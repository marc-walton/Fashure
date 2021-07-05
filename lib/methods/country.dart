import 'package:fashow/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

var format = NumberFormat.simpleCurrency(
  name: "GBP", //currencyCode
);
String hgcv = format.currencySymbol;
Country(){
  if(currentUser.country=='India'){
    Text('₹');
  }else if(currentUser.country=='UK'){
    Text('£');
  }else if(currentUser.country=='Russia'){
    Text('₽');
  }else if(currentUser.country=='USA'){
    Text("\$");
  }else if(currentUser.country=='Brazil'){
    Text("R\$");
  }else if(currentUser.country=='Canada'){
    Text("\$");
  }else if(currentUser.country=='Mexico'){
    Text("\$");
  }else if(currentUser.country=='Chile'){
    Text("\$");
  }else if(currentUser.country=='Columbia'){
    Text("\$");
  }else if(currentUser.country=='Argentina'){
    Text("\$");
  }else if(currentUser.country=='Australia'){
    Text("\$");
  }else if(currentUser.country=='New Zealand'){
    Text("\$");
  }else if(currentUser.country=='China'){
    Text("¥");
  }else if(currentUser.country=='Japan'){
    Text("¥");
  }else if(currentUser.country=='Thailand'){
    Text("฿");
  }else{
    Text("\$");
  }
}