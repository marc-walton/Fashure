import 'package:flutter/material.dart';
class AddressResale extends StatefulWidget {
List<String> Ids ;
AddressResale({this.Ids});
  @override
  _AddressResaleState createState() => _AddressResaleState();
}

class _AddressResaleState extends State<AddressResale> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.Ids.last);
  }
}
