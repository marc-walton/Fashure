import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/user.dart';
import 'package:flutter/material.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/Product_screen.dart';
import 'package:fashow/custom_image.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:getflutter/shape/gf_button_shape.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:uuid/uuid.dart';

class OrderView extends StatefulWidget {
  final String orderId;

  const OrderView({Key key, this.orderId}) : super(key: key);

  @override
  _OrderViewState createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  String reviewId = Uuid().v4();
  TextEditingController reviewController = TextEditingController();

  var rating = 0.0;
  df({String productname,String usd,String inr,String cny,String eur,String gbp,String prodId,String ownerId,}){
    if(currentUser.country=='India'){
      return
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(productname, style: TextStyle(
                color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),),
            Text( "₹$inr",style: TextStyle(color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
            GFButton(
              onPressed: () =>
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductScreen(
                            prodId: prodId,
                            userId: ownerId,
                          ),
                    ),
                  ),
              text: "More",
              icon: Icon(Icons.card_travel),
              shape: GFButtonShape.pills,

            ),
          ],
        );

    }
    else if(currentUser.country=='US'){
      return
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(productname, style: TextStyle(
                color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),),
            Text( "\u0024 $usd",style: TextStyle(color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
            GFButton(
              onPressed: () =>
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductScreen(
                            prodId: prodId,
                            userId: ownerId,
                          ),
                    ),
                  ),
              text: "More",
              icon: Icon(Icons.card_travel),
              shape: GFButtonShape.pills,

            ),
          ],
        );

    }
    else if (currentUser.country == 'China') {
      return
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(productname, style: TextStyle(
                color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),),
            Text( "¥ $cny",style: TextStyle(color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
            GFButton(
              onPressed: () =>
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductScreen(
                            prodId: prodId,
                            userId: ownerId,
                          ),
                    ),
                  ),
              text: "More",
              icon: Icon(Icons.card_travel),
              shape: GFButtonShape.pills,

            ),
          ],
        );

    }
    else if (currentUser.country == 'Europe'){
      return
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(productname, style: TextStyle(
                color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),),
            Text( "€ $eur",style: TextStyle(color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
            GFButton(
              onPressed: () =>
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductScreen(
                            prodId: prodId,
                            userId: ownerId,
                          ),
                    ),
                  ),
              text: "More",
              icon: Icon(Icons.card_travel),
              shape: GFButtonShape.pills,

            ),
          ],
        );

    }
    else if (currentUser.country == 'UK'){
      return
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(productname, style: TextStyle(
                color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),),
            Text( "£  $gbp ",style: TextStyle(color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
            GFButton(
              onPressed: () =>
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductScreen(
                            prodId: prodId,
                            userId: ownerId,
                          ),
                    ),
                  ),
              text: "More",
              icon: Icon(Icons.card_travel),
              shape: GFButtonShape.pills,

            ),
          ],
        );

    }
    else{
      return
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(productname, style: TextStyle(
                color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),),
            Text( "\u0024 $usd",style: TextStyle(color: kText,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
            GFButton(
              onPressed: () =>
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductScreen(
                            prodId: prodId,
                            userId: ownerId,
                          ),
                    ),
                  ),
              text: "More",
              icon: Icon(Icons.card_travel),
              shape: GFButtonShape.pills,

            ),
          ],
        );

    }
  }
Rating({String fulfill,String ProdId,String OwnerId}){
    if(fulfill=='true') {
      Center(
        child: Column(
          children:[
            Text('Please rate the order',style: TextStyle(
            color: Colors.white),),
            SmoothStarRating(
              allowHalfRating: true,
            filledIconData: Icons.blur_off,
            halfFilledIconData: Icons.blur_on,
            rating: rating,
            size: 35,
            starCount: 5,
            onRated: (value) {
              setState(() {
                rating = value;
              });
            },
          ),
            TextField(
              controller: reviewController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                labelText: 'Review',labelStyle: TextStyle(color: kText),
                hintText: 'Review',
              ),
              textAlign: TextAlign.start,
            )
        ],
        ),
      );
      Firestore.instance.collection('Reviews')
          .document(ProdId).collection('prodReviews').document(reviewId)
          .setData({
        'userId': OwnerId,
        'reviewId' : reviewId,
        'prodId':ProdId,
        'rating': rating,
        'review':reviewController.text,
      });
      Firestore.instance.collection('feed')
          .document(ProdId)
          .collection('feedItems')
          .document(reviewId)
          .setData({
        "type": "ReviewO",
        "username": currentUser.displayName,
        "userId": OwnerId,
        "userProfileImg": currentUser.photoUrl,
        "postId": ProdId,
        // "mediaUrl": mediaUrl,
        "timestamp": timestamp,
        "read": 'false',
        'message':'You received an order!',
      });
    }
    else{return
      Text('');}
}
  invoicefire(){
   
    return

    StreamBuilder(
        stream: Firestore.instance.collection('ordersCustomer')
            .document(currentUser.id)
            .collection('userOrder')
            .document(widget.orderId)
            .snapshots(),
        // ignore: missing_return
        builder: (context, snapshot) {

          if (!snapshot.hasData) {
            return Text('text' ,style: TextStyle(
                color: Colors.white),);
          }
          // DocumentSnapshot ds = snapshot.data.documents[index];
          return new ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                DocumentSnapshot ds = snapshot.data.documents[index];
               
                String ownerId = ds['ownerId'];
                String prodId = ds['prodId'];
                String orderId = ds['orderId'];
                String size = ds['size'];
                String orderStatus = ds['orderStatus'];
                String Address = ds['Address'];
                String fulfilled = ds['fulfilled'];
                
                String shopmediaUrl = ds['shopmediaUrl'];
                String productname = ds['productname'];
                String inr = ds['inr'];
                String cny = ds['cny'];
                String usd = ds['usd'];
                String eur = ds['eur'];
                String gbp = ds['gbp'];
                return
                  FutureBuilder(
                    future: usersRef.document(ownerId).get(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return circularProgress();
                      }
                      User user = User.fromDocument(snapshot.data);
//          bool isPostOwner = currentUserId == ownerId;
                      return Column(
                        children: <Widget>[
                          Rating(fulfill: fulfilled,ProdId: prodId,OwnerId: ownerId),
                          GestureDetector(
                            onTap: () => showProfile(context, profileId: user.id),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                                backgroundColor: Colors.grey,
                              ),
                              title: Text(
                                user.displayName,
                                style: TextStyle(
                                  color: kText,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(user.username,
                                style: TextStyle(color: kIcon),),),
                          ),
StreamBuilder(
    stream: productsRef.document(ownerId).collection('userProducts').document(prodId).snapshots(),
    builder: (context, snapshot){
      String shopmediaUrl = ds['shopmediaUrl'];
      String productname = ds['productname'];
      String inr = ds['inr'];
      String cny = ds['cny'];
      String usd = ds['usd'];
      String eur = ds['eur'];
      String gbp = ds['gbp'];
      return
        Column(
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductScreen(
                    prodId: prodId,
                    userId: ownerId,
                  ),
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),child: cachedNetworkImage(shopmediaUrl)),
                ],),),
            df(productname:productname, usd:usd,inr:inr,cny:cny,eur:eur,gbp:gbp, prodId:prodId, ownerId:ownerId,),

          ],
        );
       
    }),
                          Text('Size: $size',style: TextStyle(
                              color: Colors.white),),
 Text('Address: $Address',style: TextStyle(
                              color: Colors.white),),
 Text('order Status: $orderStatus',style: TextStyle(
                              color: Colors.white),),

                          Divider(color: kGrey,),
                        ],

                      );

                    },
                  );
              }
          );
        });

  }

  @override
  Widget build(BuildContext context) {
    return       Scaffold(
      appBar:  AppBar(backgroundColor: kSecondaryColor,
        title: Text('Customer invoice',
          style: TextStyle(
              fontFamily :"MajorMonoDisplay",
              fontSize:  35.0 ,
              color: Colors.white),
        ),
        iconTheme: new IconThemeData(color: kIcon),
      ),
      backgroundColor: kPrimaryColor,

      body:
      Container( decoration: BoxDecoration(
          gradient: fabGradient
      ) ,
        alignment: Alignment.center,
        child: Expanded(
          child: ListView(
            children: [
              invoicefire()
            ],
          ),
        ),
      ),

    );
  }
}
