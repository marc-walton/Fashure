import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/SellerDash/SellerSettings.dart';
import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/chatcached_image.dart';
import 'package:fashow/enum/Variables.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/servicedash/ServiceORDERS.dart';
import 'package:fashow/servicedash/Payments_service.dart';
import 'package:fashow/user.dart';
import 'package:flutter/material.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
class SupportDash extends StatefulWidget {
  final  int selectedPage;

  const SupportDash({Key key, this.selectedPage}) : super(key: key);
  @override
  _SupportDashState createState() => _SupportDashState();
}

class _SupportDashState extends State<SupportDash> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  @override
  OrdersFulfilled(){
    return  PaginateFirestore(
        isLive: true,

        itemBuilderType:
        PaginateBuilderType.listView,
        itemBuilder: (index, context, documentSnapshot)   {
          String ownerId = documentSnapshot.data()['userId'];
          String userProfileImg = documentSnapshot.data()['userProfileImg'];
            String username = documentSnapshot.data()['username'];
            String mediaUrl = documentSnapshot.data()['mediaUrl'];
            String Earnings = documentSnapshot.data()['Earnings'];


          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                mainAxisAlignment:MainAxisAlignment.start,

                children: <Widget>[
                  FutureBuilder(
                    future: usersRef.doc(ownerId).get(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return circularProgress();
                      }
                      Users user = Users.fromDocument(snapshot.data);
                      return
                        GestureDetector(
                          onTap: () => showProfile(context, profileId: ownerId),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                              backgroundColor: Colors.grey,
                            ),
                            title: Text(
                              user.username,
                              style: TextStyle(
                                color: kText,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );

                    },
                  ),
                  ListTile(


                    leading: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),child: Container(child: CachedImage(mediaUrl,width: 60,))),

                    trailing:    currentUser.currency == "INR"? Row(
                      children: [
                        Text(" + ${cf.format(Earnings, CurrencyFormatter.inr)}",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            )),
                      ],
                    ):
                    currentUser.currency == "EUR"?Row(
                      children: [
                        Text(" + ${cf.format(Earnings, CurrencyFormatter.eur)}",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            )),
                      ],
                    ):
                    currentUser.currency == "GBP"?Row(
                      children: [
                        Text(" + ${cf.format(Earnings, CurrencyFormatter.gbp)}",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            )),
                      ],
                    ):
                    Row(
                      children: [
                        Text(" + ${cf.format(Earnings, CurrencyFormatter.usd)}",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            )),
                      ],
                    ),

                  ),



                ],

              ),
            ),
          );
        },
        query:   FirebaseFirestore.instance.collection('Earnings')
            .doc(currentUser.id)
            .collection('support')
            .orderBy('timestamp',descending: true)

    );
  }
  Widget build(BuildContext context) {
    return OrdersFulfilled();
  }

}
