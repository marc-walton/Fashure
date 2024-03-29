const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();
const PublitioAPI = require('publitio_js_sdk').default
const publitioCredentials = require('./publitio_credentials.json')
const publitio = new PublitioAPI(publitioCredentials.key, publitioCredentials.secret)
// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//  response.send("Hello from Firebase!");
// });
const stripe = require("stripe")("sk_test_51JT7jkCTAUDjRNFV9VYB4FO4lDIxe1hXhO5lC0UhNiuED1RByuak7wSE05aWBwvXDI41Pd4LGBxjHxj9rTUdCkMf00BEPkBRsg");
//const stripe = require("stripe")(process.env.STRIPE_API_SECRET)
const host = process.env.NEXT_PUBLIC_HOST

const stripeAccount = async (req, res) => {
  const { method } = req
  if (method === "GET") {
    // CREATE CONNECTED ACCOUNT
    const { mobile } = req.query
    const account = await stripe.accounts.create({
      type: "express",
    })
    const accountLinks = await stripe.accountLinks.create({
      account: account.id,
      refresh_url: `${host}/api/stripe/account/reauth?account_id=${account.id}`,
      return_url: `${host}/register${mobile ? "-mobile" : ""}?account_id=${
        account.id
      }&result=success`,
      type: "account_onboarding",
    })
    if (mobile) {
      // In case of request generated from the flutter app, return a json response
      res.status(200).json({ success: true, url: accountLinks.url })
    }
    else {
      // In case of request generated from the web app, redirect
      res.redirect(accountLinks.url)
    }
  }
  else if (method === "DELETE") {...} else if (method === "POST") {...}
}

export default stripeAccount
exports.stripePaymentIntentRequest = functions.https.onRequest(async (req, res) => {
    try {
        let customerId;

        //Gets the customer who's email id matches the one sent by the client
        const customerList = await stripe.customers.list({
            email: req.body.email,
            limit: 1
        });

        //Checks the if the customer exists, if not creates a new customer
        if (customerList.data.length !== 0) {
            customerId = customerList.data[0].id;
        }
        else {
            const customer = await stripe.customers.create({
                email: req.body.email
            });
            customerId = customer.data.id;
        }

        //Creates a temporary secret key linked with the customer
        const ephemeralKey = await stripe.ephemeralKeys.create(
            { customer: customerId },
            { apiVersion: '2020-08-27' }
        );

        //Creates a new payment intent with amount passed in from the client
        const paymentIntent = await stripe.paymentIntents.create({
            amount: parseInt(req.body.amount),
            currency: 'sgd',
            customer: customerId,
        })

        res.status(200).send({
            paymentIntent: paymentIntent.client_secret,
            ephemeralKey: ephemeralKey.secret,
            customer: customerId,
            success: true,
        })

    } catch (error) {
        res.status(404).send({ success: false, error: error.message })
    }
});
//exports.onCreateFollower = functions.firestore
//  .doc("/followers/{userId}/userFollowers/{followerId}")
//  .onCreate(async (snapshot, context) => {
//    console.log("Follower Created", snapshot.id);
//    const userId = context.params.userId;
//    const followerId = context.params.followerId;
//
//    // 1) Create followed users posts ref
//    const followedUserPostsRef = admin
//      .firestore()
//      .collection("posts")
//      .doc(userId)
//      .collection("userPosts");
//
//    // 2) Create following user's timeline ref
//    const timelinePostsRef = admin
//      .firestore()
//      .collection("timeline")
//      .doc(followerId)
//      .collection("timelinePosts");
//
//    // 3) Get followed users posts
//    const querySnapshot = await followedUserPostsRef.get();
//
//    // 4) Add each user post to following user's timeline
//    querySnapshot.forEach((doc) => {
//      if (doc.exists) {
//        const postId = doc.id;
//        const postData = doc.data();
//        timelinePostsRef.doc(postId).set(postData);
//      }
//    });
//  });
//
//exports.onDeleteFollower = functions.firestore
//  .doc("/followers/{userId}/userFollowers/{followerId}")
//  .onDelete(async (snapshot, context) => {
//    console.log("Follower Deleted", snapshot.id);
//
//    const userId = context.params.userId;
//    const followerId = context.params.followerId;
//
//    const timelinePostsRef = admin
//      .firestore()
//      .collection("timeline")
//      .doc(followerId)
//      .collection("timelinePosts")
//      .where("ownerId", "==", userId);
//
//    const querySnapshot = await timelinePostsRef.get();
//    querySnapshot.forEach((doc) => {
//      if (doc.exists) {
//        doc.ref.delete();
//      }
//    });
//  });
//
//// when a post is created, add post to timeline of each follower (of post owner)
//exports.onCreatePost = functions.firestore
//  .doc("/posts/{userId}/userPosts/{postId}")
//  .onCreate(async (snapshot, context) => {
//    const postCreated = snapshot.data;
//    const userId = context.params.userId;
//    const postId = context.params.postId;
//
//    // 1) Get all the followers of the user who made the post
//    const userFollowersRef = admin
//      .firestore()
//      .collection("followers")
//      .doc(userId)
//      .collection("userFollowers");
//
//    const querySnapshot = await userFollowersRef.get();
//    // 2) Add new post to each follower's timeline
//    querySnapshot.forEach((doc) => {
//      const followerId = doc.id;
//
//      admin
//        .firestore()
//        .collection("timeline")
//        .doc(followerId)
//        .collection("timelinePosts")
//        .doc(postId)
//        .set(postCreated);
//    });
//  });
//
//exports.onUpdatePost = functions.firestore
//  .doc("/posts/{userId}/userPosts/{postId}")
//  .onUpdate(async (change, context) => {
//    const postUpdated = change.after.data();
//    const userId = context.params.userId;
//    const postId = context.params.postId;
//
//    // 1) Get all the followers of the user who made the post
//    const userFollowersRef = admin
//      .firestore()
//      .collection("followers")
//      .doc(userId)
//      .collection("userFollowers");
//
//    const querySnapshot = await userFollowersRef.get();
//    // 2) Update each post in each follower's timeline
//    querySnapshot.forEach((doc) => {
//      const followerId = doc.id;
//
//      admin
//        .firestore()
//        .collection("timeline")
//        .doc(followerId)
//        .collection("timelinePosts")
//        .doc(postId)
//        .get()
//        .then((doc) => {
//          if (doc.exists) {
//            doc.ref.update(postUpdated);
//          }
//        });
//    });
//  });
//
//exports.onDeletePost = functions.firestore
//  .doc("/posts/{userId}/userPosts/{postId}")
//  .onDelete(async (snapshot, context) => {
//    const userId = context.params.userId;
//    const postId = context.params.postId;
//
//    // 1) Get all the followers of the user who made the post
//    const userFollowersRef = admin
//      .firestore()
//      .collection("followers")
//      .doc(userId)
//      .collection("userFollowers");
//
//    const querySnapshot = await userFollowersRef.get();
//    // 2) Delete each post in each follower's timeline
//    querySnapshot.forEach((doc) => {
//      const followerId = doc.id;
//
//      admin
//        .firestore()
//        .collection("timeline")
//        .doc(followerId)
//        .collection("timelinePosts")
//        .doc(postId)
//        .get()
//        .then((doc) => {
//          if (doc.exists) {
//            doc.ref.delete;
//          }
//        });
//    });
//  });
//
//exports.onCreateActivityFeedItem = functions.firestore
//  .doc('/feed/{userId}/feedItems/{activityFeedItem}')
//  .onCreate(async (snapshot, context) => {
//    console.log('Activity Feed Item Created', snapshot.data);
//
//    // 1) Get user connected to the feed
//    const userId = context.params.userId;
//
//    const userRef = admin.firestore().doc(`users/${userId}`);
//    const doc = await userRef.get();
//
//    // 2) Once we have user, check if they have a notification token; send notification, if they have a token
//    const androidNotificationToken = doc.data().androidNotificationToken;
//    const createdActivityFeedItem = snapshot.data;
//    if (androidNotificationToken) {
//      // send notification
//      sendNotification(androidNotificationToken, createdActivityFeedItem);
//    } else {
//      console.log("No token for user, cannot send notification");
//    }
//
//    function sendNotification(androidNotificationToken, activityFeedItem) {
//      let body;
//
//      // 3) switch body value based off of notification type
//      switch (activityFeedItem.type) {
//        case "Chat":
//          body = `${activityFeedItem.username} replied: ${activityFeedItem.message}`;
//          break;
//          case "fav":
//          body = `${activityFeedItem.username} wishlisted an item`;
//          case "resaleLike":
//          body = `${activityFeedItem.username} wishlisted an item`;
//
//          break;
//           case "comment":
//          body = `${activityFeedItem.username} commented: ${activityFeedItem.commentData}`;
//          break;
//        case "like":
//          body = `${activityFeedItem.username} liked your post`;
//          break;
//
//          case "communityComment":
//          body = `${activityFeedItem.username} commented: ${activityFeedItem.commentData}`;
//          break;
//        case "communitylike":
//          body = `${activityFeedItem.username} liked your post`;
//          break;
//        case "follow":
//          body = `${activityFeedItem.username} started following you`;
//          break;
//case "bloglike":
//          body = `${activityFeedItem.username}  liked your blog`;
//          break;
//case "CollectionLikes":
//          body = `${activityFeedItem.username} liked your Collection`;
//          break;
//case "Videolike":
//          body = `${activityFeedItem.username} liked your Video`;
//          break;
//case "payment":
//          body = `${activityFeedItem.username} ${activityFeedItem.message}`;
//          break;
// case "SupportPaymentSender":
//          body = `${activityFeedItem.username} ${activityFeedItem.message}`;
//          break;
//   case "SupportPaymentReceiver":
//          body = `${activityFeedItem.username} ${activityFeedItem.message}`;
//          break;
//   case "PaymentResaleO":
//          body = `${activityFeedItem.username} ${activityFeedItem.message}`;
//          break;
//   case "PaymentResale":
//          body = `${activityFeedItem.username} ${activityFeedItem.message}`;
//          break;
// case "resaleReview":
//          body = `${activityFeedItem.username} ${activityFeedItem.message}`;
//          break;
// case "makeOffer":
//          body = `${activityFeedItem.username} ${activityFeedItem.message}`;
//          break;
// case "Commission":
//          body = `${activityFeedItem.username} ${activityFeedItem.message}`;
//          break;
//
//case "ReqPayment":
//          body = `${activityFeedItem.username} ${activityFeedItem.message}`;
//          break;
//case "ReqPaymentI":
//          body = `${activityFeedItem.username} ${activityFeedItem.message}`;
//          break;
//case "ReviewC":
//          body = `${activityFeedItem.username} ${activityFeedItem.message}`;
//          break;
//case "ReviewO":
//          body = `${activityFeedItem.username} ${activityFeedItem.message}`;
//          break;
//case "ServicePaymentI":
//          body = `${activityFeedItem.username} ${activityFeedItem.message}`;
//          break;
//case "ServicePayment":
//          body = `${activityFeedItem.username} ${activityFeedItem.message}`;
//          break;
//case "PaymentO":
//          body = `${activityFeedItem.username} ${activityFeedItem.message}`;
//          break;
//case "VideoComment":
//          body = `${activityFeedItem.username} commented: ${activityFeedItem.commentData}`;
//          break;
//case "blogcomment":
//          body = `${activityFeedItem.username} commented: ${activityFeedItem.commentData}`;
//          break;
//case "collectioncomment":
//          body = `${activityFeedItem.username} commented: ${activityFeedItem.commentData}`;
//          break;
//case "PaymentA":
//          body = `${activityFeedItem.username} ${activityFeedItem.message}`;
//          break;
//case "PaymentOA":
//          body = `${activityFeedItem.username}  ${activityFeedItem.message}`;
//          break;
//case "topBid":
//          body = `${activityFeedItem.username} commented: You have won an auction!`;
//          break;
//case "FreelancePayments":
//          body = `Payments settled!`;
//          break;
//case "CommissionPayments":
//          body = `Payments settled!`;
//          break;
//case "OrderPayments":
//          body = `Payments settled!`;
//          break;
//
//        default:
//          break;
//      }
//
//      // 4) Create message for push notification
//      const message = {
//        notification: { body },
//        token: androidNotificationToken,
//        data: { recipient: userId }
//      };
//
//      // 5) Send message with admin.messaging()
//      admin
//        .messaging()
//        .send(message)
//        .then(response => {
//          // Response is a message ID string
//          console.log("Succesfully sent message", response);
//        })
//        .catch(error => {
//          console.log("Error sending message", error);
//        })
//    }
//  })
//
//
//
//exports.uploadNewVideo = functions.firestore
//    .document('videos/{videoId}')
//    .onCreate(async (snap, context) => {
//        const bucket = admin.storage().bucket()
//        const fileName = `${context.params.videoId}.mp4`
//        const videoFile = bucket.file(fileName)
//
//        console.log(`uploading video file: ${videoFile.name}`)
//        var expires = new Date()
//        expires.setTime(expires.getTime() + (60 * 60 * 1000))
//        const downloadUrlArr = await videoFile.getSignedUrl({
//            action: 'read',
//            expires: expires
//        })
//        const downloadUrl = downloadUrlArr[0]
//
//        var data
//        try {
//            data = await publitio.uploadRemoteFile({ file_url: downloadUrl, privacy: 0, option_hls: 1 })
//            console.log(`Uploading finished. status code: ${data.code}`)
//        }
//        catch (error) {
//            console.error('Uploading error')
//            console.error(error)
//        }
//
//        if (data.code == 201) {
//            console.log(`Setting data in firestore doc: ${context.params.videoId} with publitioID: ${data.id}`)
//            await admin.firestore().collection("videos").doc(context.params.videoId).set({
//                finishedProcessing: true,
//                videoUrl: data.url_download,
//                thumbUrl: data.url_thumbnail,
//                aspectRatio: data.width / data.height,
//                publitioId: data.id,
//            }, { merge: true })
//            // Delete the source file if you want
//            console.log('Deleting source file')
//            await bucket.file(context.params.videoId).delete()
//            console.log('Done')
//        } else {
//            console.log('Upload status unsuccessful. Data:')
//            console.log(data)
//        }
//    })
//
//exports.deleteVideo = functions.firestore
//    .document('videos/{videoId}')
//    .onDelete(async (snap, context) => {
//        const videoId = context.params.videoId
//        const publitioId = snap.data().publitioId
//        console.log(`Deleting video file: ${videoId}`)
//
//        try {
//            const result = await publitio.call(`/files/delete/${publitioId}`, 'DELETE')
//            console.log('delete complete. result:')
//            console.log(result)
//        }
//        catch (error) {
//            console.error('Delete error')
//            console.error(error)
//        }
//    })
