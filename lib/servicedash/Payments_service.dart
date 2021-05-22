import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:fashow/size_config.dart';
class ServicePayments extends StatefulWidget {
  @override
  _ServicePaymentsState createState() => _ServicePaymentsState();
}

class _ServicePaymentsState extends State<ServicePayments> {
  df({String productname,
    String usd,
    String inr,
    String cny,
    String eur,
    String gbp,
     String Fusd,
    String Finr,
    String Fcny,
    String Feur,
    String Fgbp,
    String orderId,
    String ownerId,}){

    if(currentUser.country=='India'){
      return
        Column(
          children: <Widget>[
            ListTile(
              title: Text(productname, style: TextStyle(
                  color: kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),),
            ),
            ListTile(
              title:            Text( "Advance payment:₹$inr",style: TextStyle(color: kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),

            ),
            ListTile(
              title:             Text( "Due payment:₹$Finr",style: TextStyle(color: kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),

            ),


          ],
        );

    }
    else if(currentUser.country=='US'){
      return
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: Text(productname, style: TextStyle(
                  color: kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),),
            ),

            ListTile(
              title:            Text( "Advance payment: \u0024 $usd",style: TextStyle(color:  kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),

            ),
            ListTile(
              title:             Text( "Due payment: \u0024 $Fusd",style: TextStyle(color:  kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),

            ),


          ],
        );

    }

    else if (currentUser.country == 'Europe'){
      return
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ListTile(
              title: Text(productname, style: TextStyle(
                  color:kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),),
            ),

            ListTile(
              title:            Text( "Advance payment:  € $eur",style: TextStyle(color: kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),

            ),
            ListTile(
              title:             Text( "Due payment: € $Feur",style: TextStyle(color: kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),

            ),


          ],
        );

    }
    else if (currentUser.country == 'UK'){
      return
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ListTile(
              title: Text(productname, style: TextStyle(
                  color: kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),),
            ),

            ListTile(
              title:            Text( "Advance payment: £ $gbp",style: TextStyle(color: kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),

            ),
            ListTile(
              title:             Text( "Due payment: £ $Fgbp",style: TextStyle(color: kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),

            ),



          ],
        );

    }
    else{
      return
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: Text(productname, style: TextStyle(
                  color: kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),),
            ),

            ListTile(
              title:            Text( "Advance payment: \u0024 $usd",style: TextStyle(color:  kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),

            ),
            ListTile(
              title:             Text( "Due payment: \u0024 $Fusd",style: TextStyle(color:  kText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),

            ),


          ],
        );

    }
  }
  upcoming(){
    return
      Container(decoration: BoxDecoration(
          gradient: fabGradient
      ) ,
        alignment: Alignment.center,
        child: PaginateFirestore(
//    itemsPerPage: 2,
            itemBuilderType:
            PaginateBuilderType.listView,
            itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.documents[index];

              String ownerId = documentSnapshot.data['ownerId'];
              String orderId = documentSnapshot.data['orderId'];
              // String prodId = documentSnapshot.data['prodId'];

              String fulfilled = documentSnapshot.data['fulfilled'];
              String title = documentSnapshot.data['title'];
              String inr = documentSnapshot.data['inr'];
              String usd = documentSnapshot.data['usd'];
              String eur = documentSnapshot.data['eur'];
              String gbp = documentSnapshot.data['gbp'];
                String Finr = documentSnapshot.data['Finr'];
              String Fusd = documentSnapshot.data['Fusd'];
              String Feur = documentSnapshot.data['Feur'];
              String Fgbp = documentSnapshot.data['Fgbp'];

              return
                ListView(
                  shrinkWrap:true,
                  scrollDirection: Axis.vertical,
                  children: [
                    df(productname:title,
                      usd:usd,inr:inr,eur:eur,gbp:gbp,
                      Fusd:Fusd,Finr:Finr,Feur:Feur,Fgbp:Fgbp,

                      orderId:orderId, ownerId:ownerId,),

                  ],
                );

            },
            query:  Firestore.instance.collection('Payments')
                .document(currentUser.id)
                .collection('ServicePayments')
                .orderBy('timestamp',descending: true)
                .where('fulfilled',isEqualTo: 'false')

        ),
      );

  }
  fulfilled(){
    return
      Container(decoration: BoxDecoration(
          gradient: fabGradient
      ) ,
        alignment: Alignment.center,
        child: PaginateFirestore(
//    itemsPerPage: 2,
            itemBuilderType:
            PaginateBuilderType.listView,
            itemBuilder: (index, context, documentSnapshot)   {
//        DocumentSnapshot ds = snapshot.data.documents[index];

              String ownerId = documentSnapshot.data['ownerId'];
              String orderId = documentSnapshot.data['orderId'];
              // String prodId = documentSnapshot.data['prodId'];

              String fulfilled = documentSnapshot.data['fulfilled'];
              String title = documentSnapshot.data['title'];
              String inr = documentSnapshot.data['inr'];
              String cny = documentSnapshot.data['cny'];
              String usd = documentSnapshot.data['usd'];
              String eur = documentSnapshot.data['eur'];
              String gbp = documentSnapshot.data['gbp'];
              String Finr = documentSnapshot.data['Finr'];
              String Fcny = documentSnapshot.data['Fcny'];
              String Fusd = documentSnapshot.data['Fusd'];
              String Feur = documentSnapshot.data['Feur'];
              String Fgbp = documentSnapshot.data['Fgbp'];

              return
                ListView(
                  shrinkWrap:true,
                  scrollDirection: Axis.vertical,
                  children: [
                    df(productname:title,
                      usd:usd,inr:inr,eur:eur,gbp:gbp,
                      Fusd:Fusd,Finr:Finr,Feur:Feur,Fgbp:Fgbp,

                      orderId:orderId, ownerId:ownerId,),

                  ],
                );

            },
            query:  Firestore.instance.collection('Payments')
                .document(currentUser.id)
                .collection('ServicePayments').orderBy('timestamp',descending: true)
                .where('fulfilled',isEqualTo: 'true')

        ),
      );

  }
  void initState() {
    super.initState();
    update();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return
      RotatedBox(
        quarterTurns: 3,
        child: Expanded(
          child: DefaultTabController(
              length: 2,
              child: Scaffold(
                backgroundColor: kPrimaryColor,
                appBar: AppBar(
                  toolbarHeight: SizeConfig.safeBlockHorizontal * 8,
                  backgroundColor: kPrimaryColor,
                  elevation: 0,
                  bottom: TabBar(
                    isScrollable: true,
                    labelColor: Colors.white,
                    unselectedLabelColor: kIcon,

                    tabs: [
                      Text("Upcoming Payments", style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,),),
                      Text("Fulfilled Payments", style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 5),),

                    ],
                  ),
                ),

                body: RotatedBox(
                  quarterTurns: 1,
                  child: TabBarView(
                      children: <Widget>[
                        upcoming(),
                        fulfilled(),


                      ]),
                ),
              )
          ),
        ),
      );


  }
  main(){
    Scaffold(
      appBar:  AppBar(backgroundColor: kSecondaryColor,
        title: Text('Payments',
          style: TextStyle(
              fontFamily :"MajorMonoDisplay",
              fontSize:  35.0 ,
              color: Colors.white),),
        iconTheme: new IconThemeData(color: kIcon),
      ),
      backgroundColor: kPrimaryColor,

      body:
      Column(
        children: [
          ExpansionTile (
            title: Text('Upcoming Payments'),
              maintainState:true,
            children: [
              upcoming()
            ],
          ),
          ExpansionTile (
            title: Text('Payments Received'),
            maintainState:true,
            children: [
              fulfilled()
            ],
          ),

        ],
      ),

    );
    update();
  }
  update() async {

    QuerySnapshot snapshot = await  Firestore.instance.collection('Payments')
        .document(currentUser.id)
        .collection('ServicePayments').getDocuments();
    snapshot.documents.forEach((doc) {
      doc.reference.updateData({'read':'true'});
    });
  }

}
