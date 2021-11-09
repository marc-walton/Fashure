

import 'package:fashow/Resale/Resale.dart';
import 'package:fashow/Resale/resaleScreen.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

import 'package:fashow/Products.dart';
import 'package:fashow/product_custom.dart';
import 'package:fashow/Product_screen.dart';

class ResaleTile extends StatelessWidget {
  final Resale products;

  ResaleTile(this.products);

  showProduct(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResaleScreen(
          postId: products.resaleId,
          userId: products.ownerId,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showProduct(context),
      child: cachedNetworkImage(products.images.first),
    );
  }
}