const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//  response.send("Hello from Firebase!");
// });

exports.onCreateFollower = functions.firestore
  .doc("/followers/{userId}/userFollowers/{followerId}")
  .onCreate(async (snapshot, context) => {
    console.log("Follower Created", snapshot.id);
    const userId = context.params.userId;
    const followerId = context.params.followerId;

    // 1) Create followed users posts ref
    const followedUserPostsRef = admin
      .firestore()
      .collection("posts")
      .doc(userId)
      .collection("userPosts");

    // 2) Create following user's timeline ref
    const timelinePostsRef = admin
      .firestore()
      .collection("timeline")
      .doc(followerId)
      .collection("timelinePosts");

    // 3) Get followed users posts
    const querySnapshot = await followedUserPostsRef.get();

    // 4) Add each user post to following user's timeline
    querySnapshot.forEach((doc) => {
      if (doc.exists) {
        const postId = doc.id;
        const postData = doc.data();
        timelinePostsRef.doc(postId).set(postData);
      }
    });
  });

exports.onDeleteFollower = functions.firestore
  .doc("/followers/{userId}/userFollowers/{followerId}")
  .onDelete(async (snapshot, context) => {
    console.log("Follower Deleted", snapshot.id);

    const userId = context.params.userId;
    const followerId = context.params.followerId;

    const timelinePostsRef = admin
      .firestore()
      .collection("timeline")
      .doc(followerId)
      .collection("timelinePosts")
      .where("ownerId", "==", userId);

    const querySnapshot = await timelinePostsRef.get();
    querySnapshot.forEach((doc) => {
      if (doc.exists) {
        doc.ref.delete();
      }
    });
  });

// when a post is created, add post to timeline of each follower (of post owner)
exports.onCreatePost = functions.firestore
  .doc("/posts/{userId}/userPosts/{postId}")
  .onCreate(async (snapshot, context) => {
    const postCreated = snapshot.data;
    const userId = context.params.userId;
    const postId = context.params.postId;

    // 1) Get all the followers of the user who made the post
    const userFollowersRef = admin
      .firestore()
      .collection("followers")
      .doc(userId)
      .collection("userFollowers");

    const querySnapshot = await userFollowersRef.get();
    // 2) Add new post to each follower's timeline
    querySnapshot.forEach((doc) => {
      const followerId = doc.id;

      admin
        .firestore()
        .collection("timeline")
        .doc(followerId)
        .collection("timelinePosts")
        .doc(postId)
        .set(postCreated);
    });
  });

exports.onUpdatePost = functions.firestore
  .doc("/posts/{userId}/userPosts/{postId}")
  .onUpdate(async (change, context) => {
    const postUpdated = change.after.data();
    const userId = context.params.userId;
    const postId = context.params.postId;

    // 1) Get all the followers of the user who made the post
    const userFollowersRef = admin
      .firestore()
      .collection("followers")
      .doc(userId)
      .collection("userFollowers");

    const querySnapshot = await userFollowersRef.get();
    // 2) Update each post in each follower's timeline
    querySnapshot.forEach((doc) => {
      const followerId = doc.id;

      admin
        .firestore()
        .collection("timeline")
        .doc(followerId)
        .collection("timelinePosts")
        .doc(postId)
        .get()
        .then((doc) => {
          if (doc.exists) {
            doc.ref.update(postUpdated);
          }
        });
    });
  });

exports.onDeletePost = functions.firestore
  .doc("/posts/{userId}/userPosts/{postId}")
  .onDelete(async (snapshot, context) => {
    const userId = context.params.userId;
    const postId = context.params.postId;

    // 1) Get all the followers of the user who made the post
    const userFollowersRef = admin
      .firestore()
      .collection("followers")
      .doc(userId)
      .collection("userFollowers");

    const querySnapshot = await userFollowersRef.get();
    // 2) Delete each post in each follower's timeline
    querySnapshot.forEach((doc) => {
      const followerId = doc.id;

      admin
        .firestore()
        .collection("timeline")
        .doc(followerId)
        .collection("timelinePosts")
        .doc(postId)
        .get()
        .then((doc) => {
          if (doc.exists) {
            doc.ref.delete;
          }
        });
    });
  });

exports.onCreateActivityFeedItem = functions.firestore
  .doc('/feed/{userId}/feedItems/{activityFeedItem}')
  .onCreate(async (snapshot, context) => {
    console.log('Activity Feed Item Created', snapshot.data);

    // 1) Get user connected to the feed
    const userId = context.params.userId;

    const userRef = admin.firestore().doc(`users/${userId}`);
    const doc = await userRef.get();

    // 2) Once we have user, check if they have a notification token; send notification, if they have a token
    const androidNotificationToken = doc.data().androidNotificationToken;
    const createdActivityFeedItem = snapshot.data;
    if (androidNotificationToken) {
      // send notification
      sendNotification(androidNotificationToken, createdActivityFeedItem);
    } else {
      console.log("No token for user, cannot send notification");
    }

    function sendNotification(androidNotificationToken, activityFeedItem) {
      let body;

      // 3) switch body value based off of notification type
      switch (activityFeedItem.type) {
        case "Chat":
          body = `${activityFeedItem.username} replied: ${activityFeedItem.message}`;
          break;case "fav":
          body = `${activityFeedItem.username} Wishlisted an item`;
          break; case "comment":
          body = `${activityFeedItem.username} commented: ${activityFeedItem.commentData}`;
          break;
        case "like":
          body = `${activityFeedItem.username} liked your post`;
          break;
        case "follow":
          body = `${activityFeedItem.username} started following you`;
          break;
case "bloglike":
          body = `${activityFeedItem.username}  liked your blog`;
          break;
case "CollectionLikes":
          body = `${activityFeedItem.username} liked your Collection`;
          break;
case "Videolike":
          body = `${activityFeedItem.username} liked your Video`;
          break;
case "payment":
          body = `${activityFeedItem.username} ${activityFeedItem.message}`;
          break;
case "ReqPayment":
          body = `${activityFeedItem.username} ${activityFeedItem.message}`;
          break;
case "ReqPaymentI":
          body = `${activityFeedItem.username} ${activityFeedItem.message}`;
          break;
case "ReviewC":
          body = `${activityFeedItem.username} ${activityFeedItem.message}`;
          break;
case "ReviewO":
          body = `${activityFeedItem.username} ${activityFeedItem.message}`;
          break;
case "ServicePaymentI":
          body = `${activityFeedItem.username} ${activityFeedItem.message}`;
          break;
case "ServicePayment":
          body = `${activityFeedItem.username} ${activityFeedItem.message}`;
          break;
case "PaymentO":
          body = `${activityFeedItem.username} ${activityFeedItem.message}`;
          break;
case "Videocomment":
          body = `${activityFeedItem.username} commented: ${activityFeedItem.commentData}`;
          break;
case "blogcomment":
          body = `${activityFeedItem.username} commented: ${activityFeedItem.commentData}`;
          break;
case "collectioncomment":
          body = `${activityFeedItem.username} commented: ${activityFeedItem.commentData}`;
          break;
case "PaymentA":
          body = `${activityFeedItem.username} commented: ${activityFeedItem.message}`;
          break;
case "PaymentOA":
          body = `${activityFeedItem.username} commented: ${activityFeedItem.message}`;
          break;
case "topBid":
          body = `${activityFeedItem.username} commented: ${activityFeedItem.message}`;
          break;

        default:
          break;
      }

      // 4) Create message for push notification
      const message = {
        notification: { body },
        token: androidNotificationToken,
        data: { recipient: userId }
      };

      // 5) Send message with admin.messaging()
      admin
        .messaging()
        .send(message)
        .then(response => {
          // Response is a message ID string
          console.log("Succesfully sent message", response);
        })
        .catch(error => {
          console.log("Error sending message", error);
        })
    }
  })

//const algolia = algoliasearch("T8T19TPOWI", "f185d715665406f2bc2d336370a88b07");
//const index = algolia.initIndex("users"); // You can choose any name
//let records = [];
//let querySnapshot =  await admin.firestore().collection("users").get();
//
//for (let i in querySnapshot.docs) {
//    let obj = querySnapshot.docs[i].data();
//    obj.objectID = querySnapshot.docs[i].id;
//    records.push(obj);
//}
//
//await index.saveObjects(records);
//console.log("Pushed everything to Algolia");