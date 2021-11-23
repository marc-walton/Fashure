import 'package:fashow/Product_screen.dart';
import 'package:fashow/Resale/resaleScreen.dart';
import 'package:fashow/blog_sceen.dart';
import 'package:fashow/collscreen.dart';
import 'package:fashow/post_screen.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

class DynamicLinkService {
  Future<void> retrieveDynamicLink(BuildContext context) async {
    print(">>>>>>>>>>>>>>>>>>>>>dynamic link");

    try {
      print(">>>>>>>>>>>>>>>>>>>>>dynamic try");

      final PendingDynamicLinkData data =
          await FirebaseDynamicLinks.instance.getInitialLink();
      final Uri deepLink = data?.link;
      print(">>>>>>>>>>>>>>>>>>>>>dynamic Uriii");

      if (deepLink != null) {
        print(">>>>>>>>>>>>>>>>>>>>>dynamic not nulllll");
        print("$deepLink");

        print(">>>>>>>>>>>>>>>>>>>>>dynamic psotIddd");

        String Link = deepLink.queryParameters['type'];
        print("$Link");

        String type = Link
            .split("/")
            .first;
        print("$type");

        String postIdpart = Link
            .split("=")
            .last;
        print("$postIdpart");

        String postId = postIdpart
            .split("|")
            .first;
        print("$postId");
        String ownerId = Link
            .split("|")
            .last;
        print("$ownerId");

        print("type$type");

        print("postId$postId");

        print("ownerud$ownerId");
        if (type == "shop") {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                ProductScreen(
                  prodId: postId,
                  userId: ownerId,
                )));
      }
         else if (type == "resale") {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                ResaleScreen(
                  postId: postId,
                  userId: ownerId,
                )));
      }
         else if (type == "blog") {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                BlogScreen(
                  blogId: postId,
                  userId: ownerId,
                )));
      }
         else if (type == "collection") {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                CollScreen(
                  collId: postId,
                  userId: ownerId,
                )));
      }
         else if (type == "post") {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                PostScreen(
                  postId: postId,
                  userId: ownerId,
                )));
      }


      }

      FirebaseDynamicLinks.instance.onLink(
          onSuccess: (PendingDynamicLinkData dynamicLink) async {
            String Link = deepLink.queryParameters['type'];
            print("$Link");

            String type = Link.split("/").first;
            print("$type");

            String postIdpart = Link.split("=").last;
            print("$postIdpart");

            String postId = postIdpart.split("|").first;
            print("$postId");
            String ownerId = Link.split("|").last;
            print("$ownerId");

            print("type$type");

            print("postId$postId");

            print("ownerud$ownerId");
            if (type == "shop") {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      ProductScreen(
                        prodId: postId,
                        userId: ownerId,
                      )));
            }
            else if (type == "resale") {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      ResaleScreen(
                        postId: postId,
                        userId: ownerId,
                      )));
            }
            else if (type == "blog") {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      BlogScreen(
                        blogId: postId,
                        userId: ownerId,
                      )));
            }
            else if (type == "collection") {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      CollScreen(
                        collId: postId,
                        userId: ownerId,
                      )));
            }
            else if (type == "post") {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      PostScreen(
                        postId: postId,
                        userId: ownerId,
                      )));
            }
      });
    } catch (e) {
      print("${e.toString()}<<<<<<<<<<<<<<<<<<<<<<<<<<<");
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
      link: Uri.parse('https://fashure.page.link/?type=$type/postId=$postId|$ownerId'),
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
