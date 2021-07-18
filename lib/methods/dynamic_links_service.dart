import 'package:fashow/Product_screen.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

class DynamicLinkService {
  Future<void> retrieveDynamicLink(BuildContext context) async {
    try {
      final PendingDynamicLinkData data =
          await FirebaseDynamicLinks.instance.getInitialLink();
      final Uri deepLink = data?.link;

      if (deepLink != null) {
        if (deepLink.queryParameters.containsKey('postId')) {
          String Link = deepLink.queryParameters['postId'];
          String postId = Link.split("/").first;
          String ownerIdpart = Link.split("/").last;
          String ownerId = ownerIdpart.split("=").last;

          print("postId$postId");
          print("ownerud$ownerId");
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductScreen(
                    prodId: postId,
                    userId: ownerId,
                  )));
        }
      }

      FirebaseDynamicLinks.instance.onLink(
          onSuccess: (PendingDynamicLinkData dynamicLink) async {
        String Link = deepLink.queryParameters['postId'];
        String postId = Link.split("/").first;
        String ownerIdpart = Link.split("/").last;
        String ownerId = ownerIdpart.split("=").last;
        print("POSTID$postId");
        print("OWNERID$ownerId");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductScreen(
                  prodId: postId,
                  userId: ownerId,
                )));
      });
    } catch (e) {
      print("skdj lkjagaskdgfha;sgflska${e.toString()}");
    }
  }

  Future<Uri> createDynamicLink({
    String postId,
    String ownerId,
  }) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://fashure.page.link',
      link: Uri.parse('https://fashure.page.link/?postId=$postId/$ownerId'),
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
