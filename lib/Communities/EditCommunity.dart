import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:fashow/Communities/Community_model.dart';
import 'package:fashow/Communities/Share_button.dart';
import 'package:fashow/Communities/Upload_community.dart';
import 'package:fashow/Communities/upload_poll.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';
import 'package:fashow/Communities/comments.dart';
import 'package:fashow/Live/Live.dart';
import 'package:fashow/Product_screen.dart';
import 'package:fashow/Resale/resaleScreen.dart';
import 'package:fashow/Support/SupportButton.dart';
import 'package:fashow/Timeline.dart';
import 'package:fashow/blog_sceen.dart';
import 'package:fashow/chatcached_image.dart';
import 'package:fashow/collscreen.dart';
import 'package:fashow/enum/Variables.dart';
import 'package:fashow/post_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fashow/user.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/custom_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:fashow/comments.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:photo_view/photo_view.dart';
import 'package:fashow/methods/dynamic_links_service.dart';
import 'package:share/share.dart';
import 'package:simple_polls/models/poll_models.dart';
import 'package:simple_polls/widgets/polls_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/Constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currencies_tracker/currency.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:fashow/user.dart';
import 'package:fashow/progress.dart';
import 'package:flutter/cupertino.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/Constants.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
import 'dart:ui';
import 'package:uuid/uuid.dart';

//import 'package:flutter_svg/svg.dart';
import 'package:path_provider/path_provider.dart';

import 'package:image/image.dart' as Im;

import 'package:image_cropper/image_cropper.dart';

class EditCommunity extends StatefulWidget {

  final String CommunityId;
  final String photoUrl;
  final String description ;
  final String title ;
  final List members ;
  final List admins ;

  EditCommunity({this.CommunityId,this.photoUrl,this.description, this.title, this.members, this.admins,});

  @override
  _EditCommunityState createState() => _EditCommunityState();
}

class _EditCommunityState extends State<EditCommunity> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController displayNameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  bool _displayNameValid = true;
  bool _bioValid = true;
   bool isLoading = true;
   bool _inProcess = true;
   bool isUploading = true;

  File file;

  CommunityModel user;
  getUser() async {
    setState(() {
      isLoading = true;
    });
    DocumentSnapshot doc = await    FirebaseFirestore.instance.collection('Community')
        .doc(widget.CommunityId).get();
    user = CommunityModel.fromDocument(doc);
    displayNameController.text = user.title;
    bioController.text = user.description;
    setState(() {
      isLoading = false;
    });
  }
  Container buildDisplayNameField() {
    return Container(
      decoration: BoxDecoration( borderRadius: BorderRadius.circular(15.0),
      ) ,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[


          TextField(
            style: TextStyle(color: kSubtitle),
            controller: displayNameController,
            decoration: InputDecoration(
                hintText: "Update Display Name",
                labelText: "Name",
                hintStyle: TextStyle(color: kGrey),
                errorText: _displayNameValid ? null : "Display Name too short",
                fillColor: transwhite,
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(25.0),)            ),
          )
        ],
      ),
    );
  }

  Container buildBioField() {
    return Container( decoration: BoxDecoration( borderRadius: BorderRadius.circular(15.0),
    ) ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(style: TextStyle(color: kSubtitle),
            keyboardType: TextInputType.multiline,
            maxLines: null,
            controller: bioController,
            decoration: InputDecoration(

                hintText: "Bio",
                labelText: "Bio",
                hintStyle: TextStyle(color: kGrey),
                errorText: _bioValid ? null : "Bio too long",
                fillColor: transwhite,
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(25.0),)            ),
          )
        ],
      ),
    );
  }

  updateProfileData() {
    setState(() {
      displayNameController.text.trim().length < 3 ||
          displayNameController.text.isEmpty
          ? _displayNameValid = false
          : _displayNameValid = true;
      bioController.text.trim().length > 100
          ? _bioValid = false
          : _bioValid = true;
    });

    if (_displayNameValid && _bioValid) {
      FirebaseFirestore.instance.collection('Community')
          .doc(widget.CommunityId).update({
        "title": displayNameController.text,
        "description": bioController.text,
      });

    }
  }
  getImage2() async {


    this.setState(() {
      _inProcess = true;
    });
    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));

    if (image != null) {
      File cropped = await ImageCropper.cropImage(
          sourcePath: image.path,
          aspectRatio: CropAspectRatio(
              ratioX: 1, ratioY: 1),
          compressQuality: 100,
          maxWidth: 700,
          maxHeight: 700,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: AndroidUiSettings(
            toolbarColor: Colors.deepOrange,
            toolbarTitle: "RPS Cropper",
            statusBarColor: Colors.deepOrange.shade900,
            backgroundColor: Colors.white,
          )
      );

      this.setState(() {
        file2 = cropped;
        _inProcess = true;
      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }

  getImage(ImageSource source) async {
    setState(() {
      isLoading = true;
    });
    this.setState(() {
      _inProcess = true;
    });
    File image = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));

    if (image != null) {
      File cropped = await ImageCropper.cropImage(
          sourcePath: image.path,
          aspectRatio: CropAspectRatio(
              ratioX: 1, ratioY: 1),
          compressQuality: 100,
          maxWidth: 700,
          maxHeight: 700,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: AndroidUiSettings(
            toolbarColor: Colors.deepOrange,
            toolbarTitle: "RPS Cropper",
            statusBarColor: Colors.deepOrange.shade900,
            backgroundColor: Colors.white,
          )
      );

      this.setState(() {
        file = cropped;
        _inProcess = true;
      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
    setState(() {
      isLoading = true;
    });
  }

  handleSubmit() async {
    setState(() {
      isUploading = true;
    });
    await compressImage();
    String mediaUrl = await uploadImage(file);

    createPostInFirestore(
      mediaUrl: mediaUrl,

    );

    Navigator.pop(context);

  }

  selectImage() {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text('Select Image'),

            children: <Widget>[
              SimpleDialogOption(
                child: Text('Image from Gallery'),
                onPressed:  () {
                  getImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
              SimpleDialogOption(
                child: Text('Cancel'),
                onPressed: () => Navigator.pop(context),
              )
            ],
          );
        });
  }

  clearImage() {
    setState(() {
      file = null;
    });
  }

  compressImage() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image imageFile = Im.decodeImage(file.readAsBytesSync());
    final compressedImageFile = File('$path/img_${widget.CommunityId}.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 85));
    setState(() {
      file = compressedImageFile;
    });
  }
  deletePost() async {
    var photo =  FirebaseStorage.instance.refFromURL(widget.photoUrl) ;
    await photo.delete();


  }

  Future<String> uploadImage(imageFile) async {
    deletePost();
    UploadTask  uploadTask =
    storageRef.child("${widget.CommunityId}.jpg").putFile(imageFile);
    TaskSnapshot storageSnap = await uploadTask;
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }

  createPostInFirestore({String mediaUrl, }) {
    FirebaseFirestore.instance.collection('Community')
        .doc(widget.CommunityId)
        .update({
      "communityImg": mediaUrl,

    });

    setState(() {
      file = null;
//      isUploading = false;1111
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,


          title: Center(
            child:   FittedBox(
              fit:BoxFit.contain,
              child: Text('Edit Profile',style:TextStyle(
                  fontFamily :"MajorMonoDisplay",
                  color: Colors.white),),
            ),
          ),
          iconTheme: new IconThemeData(color: Colors.white),
//        ),

        ),
        body: isLoading
            ? circularProgress()
            : Container(
          child: ListView(
            children: <Widget>[
              Container(

                child: Column(
                  children: <Widget>[

                    Padding(
                      padding: EdgeInsets.only(
                        top: 16.0,
                        bottom: 8.0,
                      ),
                      child: Stack(
                        children:[ CircleAvatar(
                          radius: 50.0,
                          backgroundImage:
                          CachedNetworkImageProvider(user.communityImg),
                        ),
                          Positioned(
                            right: 0.1,
                            bottom: 0.1,
                            child: GestureDetector(
                              onTap: (){
                                selectImage();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Icon(Icons.add,color: Colors.white,),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                          buildDisplayNameField(),
                          SizedBox(height: 10.0,),

                          buildBioField(),

                        ],
                      ),
                    ),
                    FloatingActionButton.extended(
                      onPressed: updateProfileData,
                      backgroundColor: kblue,
                      label: Text(
                        "Save",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );  }
}


class ViewMembers extends StatefulWidget {
  final List members ;
  final List admins ;

  const ViewMembers({Key key, this.members, this.admins}) : super(key: key);
  @override
  _ViewMembersState createState() => _ViewMembersState();
}

class _ViewMembersState extends State<ViewMembers> {
//   pagiante(){
//     return PaginateView(
//       child: PaginateFirestore(
//         isLive:true,
//         itemBuilderType:
//         PaginateBuilderType.listView, //Change types accordingly
//         itemBuilder: (index, context, documentSnapshot) {
//
//           return
//           Column(
//             children:  <Widget> [
//               ListTile(
//                 leading: GestureDetector(
//                   onTap: () => showProfile(context, profileId: ownerId),
//
//                   child: CircleAvatar(
//                     backgroundImage: CachedNetworkImageProvider(photoUrl),
//                     backgroundColor: Colors.grey,
//                   ),
//                 ),
//                 title: GestureDetector(
//                   onTap: () => showProfile(context, profileId: ownerId),
//                   child: Text(
//                     username,
//                     style: TextStyle(
//                       color: kText,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 subtitle: Text(location,
//                   style: TextStyle(color: kText),),
//                 trailing: IconButton(icon: Icon(Icons.more_horiz,color: kText,),
//                     onPressed: () {
//                       !isPostOwner?showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return Dialog(
//                               backgroundColor: kSecondaryColor,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius:
//                                   BorderRadius.circular(20.0)), //this right here
//                               child: GestureDetector(
//                                 onTap: (){report();
//                                 Navigator.pop(context);},
//                                 child: Container(
//                                   height: 100,
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(12.0),
//                                     child: Column(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Container(
//
//                                           child: Align(
//                                               alignment: Alignment.center,
//                                               child: Text('Report this post?',style: TextStyle(
//                                                   color: Colors.blueAccent,
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 20.0),)),),
//
//
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             );
//                             // ignore: unnecessary_statements
//                           }):handleDeletePost(context);
//                     }),
//
//               ),
//               SizedBox( height:0.0,),
//               GestureDetector(
//                   onDoubleTap: handleLikePost,
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: <Widget>[
// //          Text('text',style: TextStyle(color: kText),),
//                       ClipRRect(borderRadius: BorderRadius.circular(20.0),
//                           child: pics(userid:ownerId,prodid: postId)),
//
// //           products(),
//
//                     ],
//                   )
//               ),
//               FutureBuilder(
//                 future:   FirebaseFirestore.instance.collection('Community')
//                     .doc(widget.CommunityId)
//                     .collection('communityPosts')
//                     .doc(postId)
//                     .collection("tags")
//                     .orderBy('timestamp',descending: true).get(),
//                 builder: (context, snapshot) {
//                   if (!snapshot.hasData||snapshot.data.docs.isEmpty) {
//                     return Container();
//                   }
//                   else {
//                     return  Row(
//                       children: [
//                         SizedBox(width:12.0),
//                         GFButton(
//                           color: Colors.black,
//                           shape:  GFButtonShape.pills,
//                           textColor: Colors.black,
//                           type : GFButtonType.outline,
//                           onPressed: viewProducts,
//                           text:"View Products",
//                           icon: Icon(
//                             Icons.add_shopping_cart,
//                             // color: Colors.white,
//                             size: 20.0,
//                           ),
//
//                         ),
//                       ],
//                     );
//                   }
//                 },
//               ),
//               SizedBox( height:3.0,),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Container(
//                     padding: EdgeInsets.only(bottom: 10.0),
//                     margin: EdgeInsets.only(left: 20.0),
//                     child: ExpandableText(
//                         text:"$description ",
//                         color: Colors.black,
//                         size:15.0
//                     ),
//                   ),
// //                 Expanded(child: Text(description, style: TextStyle(color: kGrey),))
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
//                   Padding(padding: EdgeInsets.only( left: 20.0)),
//
//                   GestureDetector(
//                     onTap: handleLikePost,
//
//                     child: ImageIcon(
//                       isLiked ?  AssetImage("assets/img/clap-hands.png"):AssetImage("assets/img/clap.png"),
//                       color: kText,
//                     ),
//                   ),
//                   SizedBox(width: 15.0,),
//                   GestureDetector(
//                     onTap: () => showComments(
//                       context,
//                       postId: postId,
//                       ownerId: ownerId,
//                       mediaUrl: mediaUrl.first,
//                     ),
//                     child: Icon(
//                       Icons.mode_comment_outlined,
//                       size: 28.0,
//                       color: kText,
//                     ),
//
//                   ),
//                   SizedBox(width: 15.0,),
//                   IconButton(
//                     color: Colors.black,
//                     onPressed: () {
//                       showModalBottomSheet(context: context, builder:(context) {
//                         return Center(child:
//                         Column(
//
//                             children:[
//                               ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                   elevation : 0.1,
//                                   side: BorderSide.none,
//
//                                   primary:  Colors.black, // background
//                                 ),
//                                 onPressed: () {
//                                   Navigator.push(context, MaterialPageRoute(builder: (context) =>
//                                       ShareButton(
//                                         postId:postId,
//                                         ownerId:ownerId,
//                                         type:"SharedComm",
//                                         imageURL:mediaUrl.first,
//                                         productname:description,
//
//                                       ),
//                                   ));
//                                 },
//                                 child: Text("Share to community",style: TextStyle(color: kText),),
//                               ),
//                               FutureBuilder<Uri>(
//                                   future: _dynamicLinkService.createDynamicLink( postId:postId,ownerId: ownerId,Description: description,type: "communityPost",imageURL:mediaUrl.first),
//                                   builder: (context, snapshot) {
//                                     if(snapshot.hasData) {
//                                       Uri uri = snapshot.data;
//                                       return ElevatedButton(
//                                         style: ElevatedButton.styleFrom(
//                                           elevation : 0.1,
//                                           side: BorderSide.none,
//
//                                           primary:  Colors.black, // background
//                                         ),
//                                         onPressed: () {
//                                           Share.share(uri.toString());},
//                                         child: Text("Share to External Apps",style: TextStyle(color: kText),),
//                                       );
//                                     } else {
//                                       return Container();
//                                     }
//
//                                   }
//                               ),
//
//
//                             ])
//                         );
//                       });
//                     },
//                     // Share.shareFiles(["${shopmediaUrl.first}"],text:"$productname",subject:"${uri.toString()}");},
//                     icon: Icon(Icons.send),
//                   ),
//
//
//                   Spacer(),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: SupportButton(userId: ownerId,displayName: username,currency: currency,imgUrl: photoUrl,mediaUrl: mediaUrl.first,),
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(padding: EdgeInsets.only( left: 20.0)),
//
//                   Container(
// //                  margin: EdgeInsets.only(left: 20.0),
//                     child: Text(
//                       "${getLikeCount(likes)} likes",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 15.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//
// //            SizedBox( height:10.0,),
//
//             ],
//
//
//           );
//
//
//         },
//
//
//         query: FirebaseFirestore.instance.collection('users')
//             .doc(widget.CommunityId)
//             .collection('communityPosts')
//             .orderBy('timestamp',descending: true),
//
//       ),
//     );
//
//   }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
