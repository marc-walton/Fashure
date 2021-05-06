import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:fashow/Constants.dart';

import 'package:flutter/cupertino.dart';
Widget cachedNetworkImage(shopmediaUrl) {
  return ClipRRect(borderRadius: BorderRadius.circular(20.0),
    child: Container(
//  margin: EdgeInsets,(50.0),
      color: kPrimaryColor,
      child: CachedNetworkImage(
        imageUrl: shopmediaUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) => Padding(
          child: CircularProgressIndicator(),
          padding: EdgeInsets.all(20.0),
        ),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    ),
  );
}