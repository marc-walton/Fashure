import 'package:fashow/SellerDash/sellerbank.dart';
import 'package:flutter/material.dart';
import 'package:fashow/HomePage.dart';
import 'package:get/get.dart';
import 'package:fashow/Constants.dart';
class SellerSetting extends StatefulWidget {
  @override
  _SellerSettingState createState() => _SellerSettingState();
}

class _SellerSettingState extends State<SellerSetting> {
  Bankdetails(){
    return
      StreamBuilder(
          stream:bankRef
              .document(currentUser.id).snapshots(),
          builder: (context,snapshot){
            String accno =  snapshot.data['accno']  ?? "";
            String ifsc = snapshot.data['ifsc'] ?? "";
            // if(snapshot.data['accno'] == null || snapshot.data['ifsc'] == null){
            // return Container();
            // }

            return Container(
              child:Column(  mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(children: [
                    Text('Account Number:',style: TextStyle(color: kText),),
                    Text("${accno }",style: TextStyle(color: kText),),
                  ],),
                  Row(children: [
                    Text('IFSC:' ,style: TextStyle(color: kText),),
                    Text("${ifsc }",style: TextStyle(color: kText),),
                  ],)

                ],),
            );
          }

      );
  }
  @override
  Widget build(BuildContext context) {
    return

      Container( decoration: BoxDecoration(
          gradient: fabGradient
      ) ,
        alignment: Alignment.center,
        child: ListView(
          shrinkWrap:true,
          children: <Widget>[

            Text('Add Bank information to receive payments on your sales' ,style: TextStyle(color: Colors.white,fontSize: 15),),


            SizedBox(height: 25),
            Bankdetails(),

            RaisedButton(
                color:kblue,
                child: Text('Add Account',            style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Get.to(SellerBank() );
                }
            ),


          ],
        ),
      );
  }
}
