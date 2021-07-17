import 'package:fashow/Products.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
class DynamicLinkService {
  Future<void> retrieveDynamicLink(BuildContext context) async {
    try {
      final PendingDynamicLinkData data = await FirebaseDynamicLinks.instance.getInitialLink();
      final Uri deepLink = data?.link;

      if (deepLink != null) {
        if (deepLink.queryParameters.containsKey('postId')) {
          String postId = deepLink.queryParameters['postId'];
           String ownerId = deepLink.queryParameters['ownerId'];

          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  Prod(prodId: postId,ownerId: ownerId,)));
          }

      }

      FirebaseDynamicLinks.instance.onLink(onSuccess: (PendingDynamicLinkData dynamicLink) async {
        String postId = deepLink.queryParameters['postId'];
        String ownerId = deepLink.queryParameters['ownerId'];

        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Prod(prodId: postId,ownerId: ownerId,)));
      });

    } catch (e) {
      print(e.toString());
    }
  }
  Future<Uri> createDynamicLink({
    String postId,
    String ownerId,
  }) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://fashure.page.link',
      link: Uri.parse('https://fashure.page.link/?postId=$postId/?ownerId=$ownerId'),
      androidParameters: AndroidParameters(
        packageName: 'com.fashure.app',
        minimumVersion: 1,
      ),
      // iosParameters: IosParameters(
      //  bundleId: 'your_ios_bundle_identifier',
      // minimumVersion: '1',
      //appStoreId: 'your_app_store_id',
      //),
    );
    final Uri dynamicUrl = await parameters.buildUrl();

    print(dynamicUrl);
    final ShortDynamicLink shortDynamicLink = await parameters.buildShortLink();
    final Uri shortUrl = shortDynamicLink.shortUrl;
    return shortUrl;
  }

}