import 'package:fashow/Categories/Kids/baby/boy/BOY.dart';
import 'package:fashow/Categories/Kids/baby/girl/Girl.dart';
import 'package:fashow/Categories/Kids/kids/boy/Boy.dart';
import 'package:fashow/Categories/Kids/kids/girl/girl.dart';
import 'package:fashow/Categories/Kids/teen/boy/boy.dart';
import 'package:fashow/Categories/Kids/teen/girl/girl.dart';
import 'package:fashow/Categories/Men/Men.dart';
import 'package:fashow/Categories/Women/Women.dart';
import 'package:fashow/Live/upload_bid.dart';
import 'package:fashow/Resale/upload_resale.dart';
import 'package:fashow/chatcached_image.dart';
import 'package:fashow/fav.dart';
import 'package:fashow/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fashow/user.dart';
import 'package:get/get.dart';

import 'package:fashow/shop_search.dart';
import 'package:fashow/Products.dart';
import 'package:fashow/upload_Ecommerce.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:getwidget/components/toggle/gf_toggle.dart';
import 'package:getwidget/types/gf_toggle_type.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class ResaleModel extends StatefulWidget {
  // const ResaleModel({Key? key}) : super(key: key);

  @override
  _ResaleModelState createState() => _ResaleModelState();
}

class _ResaleModelState extends State<ResaleModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   FutureBuilder(

        future:    FirebaseFirestore.instance.collection('Resale')

            .doc(currentUser.id)

            .collection('userResale').get(),

        builder: (context,snapshot)

        {



          return

            ListView.builder(physics: NeverScrollableScrollPhysics(),

                shrinkWrap: true,

                scrollDirection:Axis.vertical,

                itemCount: snapshot.data.docs.length,

                itemBuilder: (BuildContext context, int index) {

                  return Container(

                      child: CachedImage( snapshot.data.docs[index].data()['shopmediaUrl']

                          .first,

                      ));



                });

        },



      ),
    );

  }
}
