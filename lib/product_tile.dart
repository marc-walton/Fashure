
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

import 'package:fashow/Products.dart';
import 'package:fashow/product_custom.dart';
import 'package:fashow/Product_screen.dart';

class ProductTile extends StatelessWidget {
  final Prod products;

  ProductTile(this.products);

  showProduct(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductScreen(
          prodId: products.prodId,
          userId: products.ownerId,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showProduct(context),
      child: cachedNetworkImage(products.shopmediaUrl.first),
    );
  }
}