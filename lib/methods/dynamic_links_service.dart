import 'package:fashow/Product_screen.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

class DynamicLinkService {
  Future<void> retrieveDynamicLink(BuildContext context) async {
    print("jfvjk f,jnhgbkjngjbjnjbnjbng,kglmk,nk");

    try {
      final PendingDynamicLinkData data =
          await FirebaseDynamicLinks.instance.getInitialLink();
      final Uri deepLink = data?.link;

      if (deepLink != null) {
        if (deepLink.queryParameters.containsKey('postId')) {
          String Link = deepLink.queryParameters['postId'];
          String Link2 = deepLink.queryParameters['type'];

          String postId = Link.split("/").first;
          String ownerIdpart = Link.split("/").last;
          String ownerId = ownerIdpart.split("=").last;
          String type = Link2.split("/").first;

          print("type$type");

          print("postId$postId");
          print("type$type");

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
         String Link2 = deepLink.queryParameters['type'];

        String postId = Link.split("/").first;
        String ownerIdpart = Link.split("/").last;
        String ownerId = ownerIdpart.split("=").last;
        String type = Link2.split("/").first;

        print("type$type");

        print("ownerud$ownerId");
        print("POSTID$postId");
        print("OWNERID$ownerId");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductScreen(
                  prodId: postId,
                  userId: ownerId,
                )));
      });
    } catch (e) {
      print("${e.toString()}");
    }
  }

  Future<Uri> createDynamicLink({
    String postId,
    String ownerId,
    String type,
    String imageURL,
    String Description
  }) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://fashure.page.link',
      link: Uri.parse('https://fashure.page.link/?type=$type/postId=$postId/$ownerId'),
      androidParameters: AndroidParameters(
        packageName: 'com.fashure.app',
        minimumVersion: 1,
      ),
      socialMetaTagParameters: SocialMetaTagParameters(title:"Fashure",description: Description,imageUrl:Uri.parse('$imageURL') )
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
