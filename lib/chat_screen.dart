import 'dart:io';
import 'package:fashow/Constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emoji_picker/emoji_picker.dart';
import 'package:fashow/progress.dart';
import 'package:fashow/provider/image_upload_provider.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/model/user_model.dart';
import 'package:fashow/servicedash/requestpayment.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashow/search_service.dart';
import 'package:provider/provider.dart';
import 'package:fashow/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fashow/ActivityFeed.dart';
import 'package:fashow/enum/view_state.dart';
import 'package:fashow/model/message_model.dart';
import 'package:fashow/model/freelance.dart';

import 'package:fashow/methods/chat_method.dart';
import 'package:fashow/model/storage_model.dart';
import 'package:fashow/chatcached_image.dart';


import 'package:fashow/utils/utilities.dart';
import 'package:fashow/utils/app_bar.dart';
import 'package:fashow/page_view/custom_tile.dart';

class ChatScreen extends StatefulWidget {

  final UserModel receiver  ;
  final Freelance free  ;

//  final String receiverName;
//  final String receiverPhoto;


  ChatScreen({this.receiver,
    this.free,
//    this.receiverName,this.receiverPhoto
  });

  @override
  _ChatScreenState createState() => _ChatScreenState();

}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController textFieldController = TextEditingController();
  FocusNode textFieldFocus = FocusNode();

  final StorageMethods _storageMethods = StorageMethods();
  final ChatMethods _chatMethods = ChatMethods();
  final SearchMethod _authMethods = SearchMethod();

  ScrollController _listScrollController = ScrollController();

  UserModel sender;
  UserModel receive;
  SharedPreferences myPrefs;
//  String _currentUserId;
  String peerId;
  String peerAvatar;
  String peerName;
  String peerUname;
//  String id;
  String userId;
  String userdisplayName;
  String userPhotoUrl;

  bool isWriting = false;

  bool showEmojiPicker = false;

  ImageUploadProvider _imageUploadProvider;
bool model;
bool Designer;
  bool Illustrator;
  bool Stylist;
  bool Makeup;
  bool Photographer;
  bool Choreographer;
  bool Hair;
  List<Freelance> list =[];

  @override
 void initState() {
    super.initState();
//    _authMethods.getCurrentUser().then((user) {
//      _currentUserId = user.uid;
//    setState(() {
//      receive = UserModel(
//        id: widget.receiver,
//        username: widget.receiverName,
//        photoUrl: widget.receiverPhoto,
//      );
//    });
    Updateread();
    Updatereadreciever();
    reqorderFire();
    setState(() {
      sender = UserModel(
        id: currentUser.id,
        displayName: currentUser.displayName,
        photoUrl: currentUser.photoUrl,
      );
    });

    }

  showKeyboard() => textFieldFocus.requestFocus();

  hideKeyboard() => textFieldFocus.unfocus();

  hideEmojiContainer() {
    setState(() {
      showEmojiPicker = false;
    });
  }

  showEmojiContainer() {
    setState(() {
      showEmojiPicker = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    _imageUploadProvider = Provider.of<ImageUploadProvider>(context);

    return
      SafeArea(
        child: Scaffold(
          backgroundColor: UniversalVariables.blackColor,
          appBar: AppBar(
              backgroundColor: kPrimaryColor,

              iconTheme: new IconThemeData(color: kText),
//            leading:IconButton(  icon: Icon(
//              Icons.menu,
//              color: Colors.blue,),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: false,
            title: InkWell(
              onTap: () => showProfile(context, profileId:widget.receiver.id),
              child: Row(

                children: [
                  Container(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 20.0,
                      backgroundColor: Colors.grey,
                      backgroundImage: CachedNetworkImageProvider(widget.receiver.photoUrl),
                    ),
                  ),
                  SizedBox(width: 20.0,),
                  GestureDetector(
                    onTap: () => showProfile(context, profileId:widget.receiver.id),
                    child: Text(
                      widget.receiver.displayName,
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
//        IconButton(
//          icon: Icon(
//            Icons.video_call,
//          ),
//          onPressed: () async =>
//          await Permissions.cameraAndMicrophonePermissionsGranted()
//              ? CallUtils.dial(
//            from: sender,
//            to: widget.receiver,
//            context: context,
//          )
//              : {},
//        ),
//        IconButton(
//          icon: Icon(
//            Icons.phone,
//          ),
//          onPressed: () {},
//
//        )
              model == true|| Photographer == true|| Stylist == true|| Designer == true|| Hair == true || Makeup == true || Illustrator == true || Choreographer == true ?
              RaisedButton(color:kblue,
                  child:  Text("Create order",style: TextStyle(color: kText),),onPressed: (){ Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ReqPay(
                        reciever: widget.receiver.id,
                        recievername: widget.receiver.displayName,
                        recieverUrl: widget.receiver.photoUrl,
                      ),
                ),
              );}):
              Container(),

            ],
          ),
          body:Column(
            children: <Widget>[
              Flexible(
                child: messageList(),
              ),
              _imageUploadProvider.getViewState == ViewState.LOADING
                  ? Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(right: 15),
                child: CircularProgressIndicator(),
              )
                  : Container(),
              chatControls(),
              showEmojiPicker ? Container(child: emojiContainer()) : Container(),
            ],
          ),

        ),
      );
  }

   Updateread() async { QuerySnapshot snapshot = await Firestore.instance
       .collection(MESSAGES_COLLECTION)
       .document(currentUser.id)
       .collection(widget.receiver.id).getDocuments();
   snapshot.documents.forEach((doc) {
     doc.reference.updateData({'read':'true'});
   });}
   Updatereadreciever() async { QuerySnapshot snapshot = await Firestore.instance
       .collection(MESSAGES_COLLECTION)
       .document(widget.receiver.id)
       .collection(currentUser.id).getDocuments();
   snapshot.documents.forEach((doc) {
     doc.reference.updateData({'read':'true'});
   });}
  emojiContainer() {
    return EmojiPicker(
      bgColor: UniversalVariables.separatorColor,
      indicatorColor: UniversalVariables.blueColor,
      rows: 3,
      columns: 7,
      onEmojiSelected: (emoji, category) {
        setState(() {
          isWriting = true;
        });

        textFieldController.text = textFieldController.text + emoji.emoji;
      },
      recommendKeywords: ["face", "happy", "party", "sad"],
      numRecommended: 50,
    );
  }

  Widget messageList() {
    return StreamBuilder(
      stream: Firestore.instance
          .collection(MESSAGES_COLLECTION)
          .document(currentUser.id)
          .collection(widget.receiver.id)
          .orderBy(TIMESTAMP_FIELD, descending: true)
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.data == null) {
          return Center(child: CircularProgressIndicator());
        }

        // SchedulerBinding.instance.addPostFrameCallback((_) {
        //   _listScrollController.animateTo(
        //     _listScrollController.position.minScrollExtent,
        //     duration: Duration(milliseconds: 250),
        //     curve: Curves.easeInOut,
        //   );
        // });

        return ListView.builder(
          padding: EdgeInsets.all(10),
          controller: _listScrollController,
          reverse: true,
          itemCount: snapshot.data.documents.length,
          itemBuilder: (context, index) {
            // mention the arrow syntax if you get the time
            return chatMessageItem(snapshot.data.documents[index]);
          },
        );
      },
    );
  }

  Widget chatMessageItem(DocumentSnapshot snapshot) {
    Message _message = Message.fromMap(snapshot.data);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Container(
        alignment: _message.senderId == currentUser.id
            ? Alignment.centerRight
            : Alignment.centerLeft,
        child: _message.senderId == currentUser.id
            ? senderLayout(_message)
            : receiverLayout(_message),
      ),
    );
  }

  Widget senderLayout(Message message) {
    Radius messageRadius = Radius.circular(10);

    return Container(
      margin: EdgeInsets.only(top: 12),
      constraints:
      BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.65),
      decoration: BoxDecoration(
        color: UniversalVariables.senderColor,
        borderRadius: BorderRadius.only(
          topLeft: messageRadius,
          topRight: messageRadius,
          bottomLeft: messageRadius,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: getMessage(message),
      ),
    );
  }

  getMessage(Message message) {
    return message.type != MESSAGE_TYPE_IMAGE
        ? Text(
      message.message,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16.0,
      ),
    )
        : message.imgUrl != null
        ? CachedImage(
      message.imgUrl,
      height: 250,
      width: 250,
      radius: 10,
    )
        : Text("Url was null");
  }

  Widget receiverLayout(Message message) {
    Radius messageRadius = Radius.circular(10);

    return Container(
      margin: EdgeInsets.only(top: 12),
      constraints:
      BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.65),
      decoration: BoxDecoration(
        color: UniversalVariables.receiverColor,
        borderRadius: BorderRadius.only(
          bottomRight: messageRadius,
          topRight: messageRadius,
          bottomLeft: messageRadius,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: getMessage(message),
      ),
    );
  }
  Addorder(){
    if(model == 'true' || Photographer == 'true' || Stylist == 'true' || Designer == 'true' || Hair == "true" || Makeup == 'true' || Illustrator == 'true' || Choreographer == 'true' )
      {
        return
        RaisedButton(child:  Text("Create order",style: TextStyle(color: kText),),onPressed: (){ Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ReqPay(
                  reciever: widget.receiver.id,
                  recievername: widget.receiver.displayName,
                  recieverUrl: widget.receiver.photoUrl,
                ),
          ),
        );});
      }
    // else{
    //   RaisedButton(child:  Text("Hire Me!",style: TextStyle(color: kText),),onPressed: (){ Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) =>
    //           ReqPay(
    //             reciever: widget.receiver.id,
    //           ),
    //     ),
    //   );});
    // }
  }
reqorderFire() async {
  Firestore.instance.collection('users')
      .where('id', isEqualTo: currentUser.id)

      .snapshots()
      .listen((snapshot){  snapshot.documents.forEach((doc) {
    setState(() {
      Illustrator = doc.data['illustrator'] ?? false;
model = doc.data['model'] ?? false;
          Makeup = doc.data['makeup'] ?? false;
          Hair = doc.data['hair'] ?? false;
          Choreographer = doc.data['choreographer'] ?? false;
          Photographer = doc.data['photographer'] ?? false;
          Stylist = doc.data['stylist'] ?? false;
          Designer = doc.data['designer'] ?? false;

      print('Activity Feed Item: $Illustrator');


    });
  }); });



  // StreamBuilder(
  //     stream: Firestore.instance.collection('users').document(widget.receiver.id).snapshots(),
  //     // ignore: missing_return
  //     builder: (context, snapshot) {
  //
  //       if (!snapshot.hasData) {
  //         return circularProgress();
  //       }
  //       // DocumentSnapshot ds = snapshot.data.documents[index];
  //
  //     });
}
  Widget chatControls() {
    setWritingTo(bool val) {
      setState(() {
        isWriting = val;
      });
    }
    selectImage(parentContext) {
      return showDialog(
          context: parentContext,
          builder: (context) {
            return SimpleDialog(
//            shape: ,
              title: Text("Send Image"),
              children: <Widget>[
                SimpleDialogOption(
                    child: Text("Photo with Camera"), onPressed:() {
                  pickImage(source: ImageSource.camera);
                  Navigator.pop(context);
                }),
                SimpleDialogOption(
                  child: Text("Image from Gallery"),
                  onPressed:  () {
                    pickImage(source: ImageSource.gallery);
                    Navigator.pop(context);
                  },
                ),
                SimpleDialogOption(
                  child: Text("Cancel"),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            );
          });
    }
    addMediaModal(context) {
      showModalBottomSheet(
          context: context,
          elevation: 0,
          backgroundColor: UniversalVariables.blackColor,
          builder: (context) {
            return Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: <Widget>[
                      FlatButton(
                        child: Icon(
                          Icons.close,
                        ),
                        onPressed: () => Navigator.maybePop(context),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Content and tools",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: ListView(
                    children: <Widget>[
                      ModalTile(
                        title: "Media",
                        subtitle: "Share Photos and Video",
                        icon: Icons.image,
                        onTap: () => selectImage(context),
                      ),
                      ModalTile(
                        title: "New project",
                        subtitle: "Share details about what you the ",
                        icon: Icons.tab,
                      ),

                    ],
                  ),
                ),
              ],
            );
          });
    }

    sendMessage() {
      var text = textFieldController.text;
      // print(widget.receiver.email);

      Message _message = Message(
        receiverId: widget.receiver.id,
        senderId: sender.id,
        message: text,
        timestamp: Timestamp.now(),
        type: 'text',
        read: 'false',
      );
      Firestore.instance.collection('feed')
              .document(widget.receiver.id)
              .collection('feedItems')
              .document(currentUser.id)
              .setData({
            "type": "Chat",
            "username": currentUser.username,
            "userId": currentUser.id,
            "userProfileImg": currentUser.photoUrl,
            // "postId": widget.OrderId,
            // "mediaUrl": mediaUrl,
            "timestamp": timestamp,
            "read": 'false',
            'message':text,
          });
      setState(() {
        isWriting = false;
      });

      textFieldController.text = "";

      _chatMethods.addMessageToDb(_message, sender, widget.receiver);
    }

    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () => addMediaModal(context),
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                gradient: UniversalVariables.fabGradient,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.add),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                TextField(
                  controller: textFieldController,
                  focusNode: textFieldFocus,
                  onTap: () => hideEmojiContainer(),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  onChanged: (val) {
                    (val.length > 0 && val.trim() != "")
                        ? setWritingTo(true)
                        : setWritingTo(false);
                  },
                  decoration: InputDecoration(
                    hintText: "Type a message",
                    hintStyle: TextStyle(
                      color: UniversalVariables.greyColor,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(50.0),
                        ),
                        borderSide: BorderSide.none),
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    filled: true,
                    fillColor: UniversalVariables.separatorColor,
                  ),
                ),
                IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    if (!showEmojiPicker) {
                      // keyboard is visible
                      hideKeyboard();
                      showEmojiContainer();
                    } else {
                      //keyboard is hidden
                      showKeyboard();
                      hideEmojiContainer();
                    }
                  },
                  icon: Icon(Icons.face),
                ),
              ],
            ),
          ),
//          isWriting
//              ? Container()
//              : Padding(
//            padding: EdgeInsets.symmetric(horizontal: 10),
//            child: Icon(Icons.record_voice_over),
//          ),
//          isWriting
//              ? Container()
//              : GestureDetector(
//            child: Icon(Icons.camera_alt),
//            onTap: () => pickImage(source: ImageSource.camera),
//          ),
          isWriting
              ? Container(
              margin: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  gradient: UniversalVariables.fabGradient,
                  shape: BoxShape.circle),
              child: IconButton(
                icon: Icon(
                  Icons.send,
                  size: 15,
                ),
                onPressed: () => sendMessage(),
              ))
              : Container()
        ],
      ),
    );
  }

  void pickImage({@required ImageSource source}) async {
    File selectedImage = await Utils.pickImage(source: source);
    _storageMethods.uploadImage(
        image: selectedImage,
        receiverId: widget.receiver.id,
        senderId: currentUser.id,
       );
  }

  CustomAppBar customAppBar(context) {
    return CustomAppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: false,
      title: InkWell(
        onTap: () => showProfile(context, profileId:widget.receiver.id),
        child: Row(

          children: [
            Container(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 20.0,
                backgroundColor: Colors.grey,
                backgroundImage: CachedNetworkImageProvider(widget.receiver.photoUrl),
              ),
            ),
            SizedBox(width: 20.0,),
            GestureDetector(
              onTap: () => showProfile(context, profileId:widget.receiver.id),
              child: Text(
                widget.receiver.displayName,
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
//        IconButton(
//          icon: Icon(
//            Icons.video_call,
//          ),
//          onPressed: () async =>
//          await Permissions.cameraAndMicrophonePermissionsGranted()
//              ? CallUtils.dial(
//            from: sender,
//            to: widget.receiver,
//            context: context,
//          )
//              : {},
//        ),
//        IconButton(
//          icon: Icon(
//            Icons.phone,
//          ),
//          onPressed: () {},
//
//        )
    model == true|| Photographer == true|| Stylist == true|| Designer == true|| Hair == true || Makeup == true || Illustrator == true || Choreographer == true ?
    RaisedButton(
        color:kblue,
        child:  Text("Create order",style: TextStyle(color: kText),),onPressed: (){ Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) =>
    ReqPay(
    reciever: widget.receiver.id,
    recievername: widget.receiver.displayName,
    recieverUrl: widget.receiver.photoUrl,
    ),
    ),
    );}):
Container(),

      ],
    );
  }
}

class ModalTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Function onTap;

  const ModalTile({
    @required this.title,
    @required this.subtitle,
    @required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: CustomTile(
        mini: false,
        onTap: onTap,
        leading: Container(
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: UniversalVariables.receiverColor,
          ),
          padding: EdgeInsets.all(10),
          child: Icon(
            icon,
            color: UniversalVariables.greyColor,
            size: 38,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: UniversalVariables.greyColor,
            fontSize: 14,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}