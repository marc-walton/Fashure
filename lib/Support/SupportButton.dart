import 'package:fashow/Constants.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Support/paySupport.dart';
import 'package:flutter/material.dart';
class SupportButton extends StatefulWidget {
final String userId;
final String displayName;
final String imgUrl;
final String mediaUrl;
final String currency;

  const SupportButton({Key key, this.userId, this.displayName, this.imgUrl,  this.mediaUrl, this.currency, }) : super(key: key);


  @override
  _SupportButtonState createState() => _SupportButtonState();
}

class _SupportButtonState extends State<SupportButton> {
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children:[
                      SizedBox(height:40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          ElevatedButton(

                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                side: BorderSide(width: 2.0, color: Colors.black),

                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
                                ),
                              ),onPressed: () {

                          },
                              child:Text("Watch AD",style: TextStyle(color: Colors.white),)),
                          SizedBox(width:8.0),

                          Text("(Coming soon)")
                        ],
                      ),
                      SizedBox(height:20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType:TextInputType.number,
                          style: TextStyle(color: kText),
                          controller: amountController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),

                            labelText:
                            currentUser.currency == "INR"?'₹':
                            currentUser.currency == "EUR"?'€':
                            currentUser.currency == "GBP"?'£':'\u0024', labelStyle: TextStyle(color: kText),
                            hintText:
                            currentUser.currency == "INR"?'₹':
                            currentUser.currency == "EUR"?'€':
                            currentUser.currency == "GBP"?'£':'\u0024',
                          ),
                          textAlign: TextAlign.center,
                          validator: (text) {
                            if ( text.isEmpty) {
                              return 'Should not be empty';
                            }
                            return null;
                          },
                        ),
                      ),

                      ElevatedButton(

                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            side: BorderSide(width: 2.0, color: Colors.black),

                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
                            ),
                          ),onPressed: () {
                        double am= double.tryParse(amountController.text) *100;
                        String vString = am.toInt().toString();

                        Navigator.push(context, MaterialPageRoute(builder: (context) =>PaySupport(buynowamount: vString,
                          mediaUrl: widget.mediaUrl,
                          userId: widget.userId,
                          imgUrl: widget.imgUrl,
                          displayName: widget.displayName,
                          currency: widget.currency,
                        )));


                      },
                          child:Text("Send",style: TextStyle(color: Colors.white),)),

                    ]),
              );
            }
        );
      },
      child:
      Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width/4,
            height: MediaQuery.of(context).size.height/20,

            margin: EdgeInsets.only(top:10.0,left: 10.0,right: 10.0, bottom: 10.0 ),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
              color: Colors.grey.withOpacity(0.3),
              // boxShadow: [BoxShadow(color: Colors.black)],
            ),
            child:         Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                Icon(Icons.paid_outlined,color: Colors.green,),
                // Text("Support"),
              ],
            ),


          ),

        ],
      ),


    );
  }
}
