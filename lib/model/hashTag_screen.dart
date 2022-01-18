import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashow/HomePage.dart';
import 'package:fashow/model/tags.dart';
import 'package:flutter/material.dart';
import 'package:lazy_loading_list/lazy_loading_list.dart';

class HashTagScreen extends StatefulWidget {
final String hashTag;

  const HashTagScreen({Key key, this.hashTag}) : super(key: key);
  @override
  _HashTagScreenState createState() => _HashTagScreenState();
}

class _HashTagScreenState extends State<HashTagScreen> {
  List<Tag_Model>hashTags = <Tag_Model>[];
  void initState() {
    super.initState();
    getHashTagPosts();
    getHashTagProducts();
    getHashTagBlogs();
    getHashTagCollections();
    getHashTagResale();
    
  }

  getHashTagPosts()async{

      QuerySnapshot snapshot = await postsRef
          .doc(currentUser.id)
          .collection('userPosts')
          .where("hashTags",arrayContains: widget.hashTag)
          .orderBy('timestamp',descending: true)
          .limit(300)
          .get();

      setState(() {
        snapshot.docs.forEach((doc) {
          Tag_Model   assign = Tag_Model(type: "post",
            ownerId:doc.data()["ownerId"],
            postId:doc.data()["postId"],
            imgUrl:doc.data()["mediaUrl"],
          );
          hashTags.add(assign);
        });

      });
  
 
    }
 getHashTagProducts()async{
   QuerySnapshot snapshot = await productsRef
       .doc(currentUser.id)
       .collection('userProducts')
       .where("hashTags",arrayContains: widget.hashTag)
       .orderBy('timestamp',descending: true)
       .limit(300)
       .get();
   setState(() {
     snapshot.docs.forEach((doc){
       Tag_Model assign = Tag_Model(type: "shop",
         ownerId:doc.data()["ownerId"],
         postId:doc.data()["prodId"],
         imgUrl:doc.data()["shopmediaUrl"],
       );
       hashTags.add(assign);
     });
   });

    }
 getHashTagBlogs()async{

   QuerySnapshot snapshot = await blogRef
       .doc(currentUser.id)
       .collection('userBlog')
       .where("hashTags",arrayContains: widget.hashTag)
       .orderBy('timestamp',descending: true)
       .limit(300)
       .get();

   setState(() {
     snapshot.docs.forEach((doc){
       Tag_Model assign = Tag_Model(type: "editorial",
         ownerId:doc.data()["ownerId"],
         postId:doc.data()["blogId"],
         imgUrl:doc.data()["blogmediaUrl"],
       );
       hashTags.add(assign);
     });
   });



    }
 getHashTagCollections()async{
   QuerySnapshot snapshot = await collRef
       .doc(currentUser.id)
       .collection('userCollections')
       .where("hashTags",arrayContains: widget.hashTag)
       .orderBy('timestamp',descending: true)
       .limit(300)
       .get();

   setState(() {
     snapshot.docs.forEach((doc){
       Tag_Model assign = Tag_Model(type: "collection",
         ownerId:doc.data()["ownerId"],
         postId:doc.data()["collId"],
         imgUrl:doc.data()["collmediaUrl"],
       );
       hashTags.add(assign);
     });
   });

    }
 getHashTagResale()async{

   QuerySnapshot snapshot = await  FirebaseFirestore.instance.collection('Resale')
       .doc(currentUser.id)
       .collection('userResale')
       .where("hashTags",arrayContains: widget.hashTag)
       .orderBy('timestamp',descending: true)
       .limit(300)
       .get();

   setState(() {
     snapshot.docs.forEach((doc){
       Tag_Model assign = Tag_Model(type: "resale",
         ownerId:doc.data()["ownerId"],
         postId:doc.data()["resaleId"],
         imgUrl:doc.data()["images"],
       );
       hashTags.add(assign);
     });
   });

    }


  @override
  Widget build(BuildContext context) {
    hashTags.shuffle();
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:3),
        itemCount: hashTags.length,
        itemBuilder:( context,index){
          return LazyLoadingList( child: ListView(children: hashTags,), index: index,);
        } );
  }
}
