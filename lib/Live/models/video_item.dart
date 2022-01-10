// // // import 'package:chewie/chewie.dart';
// import 'package:flutter/material.dart';
// import 'package:ext_video_player/ext_video_player.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//
// //  import 'package:video_player/video_player.dart';
// // import 'package:fijkplayer/fijkplayer.dart';
// // import 'package:flick_video_player/flick_video_player.dart';
// // import 'package:insta_html_parser/insta_html_parser.dart';
// // import 'package:ssinstafeedparser/insta_feed_bean.dart';
// // import 'package:ssinstafeedparser/insta_feed_parser.dart';
// // import 'package:youtube_player_iframe/youtube_player_iframe.dart';
// //
// // // import 'package:youtube_plyr_iframe/youtube_plyr_iframe.dart';
// // // class VideoItems extends StatefulWidget {
// // //  final VideoPlayerController videoPlayerController;
// // //   final bool looping;
// // //   final bool autoplay;
// // //   final String url;
// // //   bool _pauseOnTap = true;
// // //   double playBackSpeed = 1.0;
// // //   VideoItems({
// // //  this.videoPlayerController,
// // //     this.looping, this.autoplay,this.url,
// // //     Key key,
// // //   }) : super(key: key);
// // //
// // //   @override
// // //   _VideoItemsState createState() => _VideoItemsState();
// // // }
// // //
// // // class _VideoItemsState extends State<VideoItems> {
// // //   // ChewieController _chewieController;
// // //   // final FijkPlayer player = FijkPlayer();
// // //   FlickManager flickManager;
// // //   VideoPlayerController _controller;
// // //   var _videoUrl;
// // //   @override
// // //    initState()  {
// // //     super.initState();
// // //     // _chewieController = ChewieController(
// // //     //   videoPlayerController: widget.videoPlayerController,
// // //     //   aspectRatio:5/8,
// // //     //   autoInitialize: true,
// // //     //   autoPlay: widget.autoplay,
// // //     //   looping: widget.looping,
// // //     //   errorBuilder: (context, errorMessage) {
// // //     //     return Center(
// // //     //       child: Text(
// // //     //         errorMessage,
// // //     //         style: TextStyle(color: Colors.white),
// // //     //       ),
// // //     //     );
// // //     //   },
// // //     // );
// // //     videoParser();
// // //
// // //   }
// // //   videoParser()async{
// // //     print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${widget.url}");
// // //
// // //     var videoUrl = await InstaFeedParser.feedsFromProfile('${widget.url}');
// // //      print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$videoUrl");
// // //
// // //
// // //      _videoUrl =   videoUrl;
// // //      flickManager = FlickManager(
// // //        videoPlayerController:  VideoPlayerController.network("$_videoUrl"),
// // //      );
// // //
// // //     print(">>>>>>>>>>>>>>>>>>.$_videoUrl");
// // //   }
// // //   @override
// // //   void dispose() {
// // //     super.dispose();
// // //     // widget.videoPlayerController.dispose();
// // //     // _chewieController.dispose();
// // //     // player.release();
// // //     flickManager.dispose();
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Padding(
// // //       padding: const EdgeInsets.all(8.0),
// // //       child:
// // //       FlickVideoPlayer(
// // //         flickManager: flickManager,
// // //
// // //       ),
// // //       // FijkView(
// // //       //   player: player,
// // //       // ),
// // //       // Chewie(
// // //       //   controller: _chewieController,
// // //       // ),
// // //     );
// // //   }
// // //
// // // }
// // //
// // //
// // //
// class YoutubeViewer extends StatefulWidget {
//   final String videoID;
//   YoutubeViewer(this.videoID);
//   @override
//   _YoutubeViewerState createState() => _YoutubeViewerState();
// }
//
// class _YoutubeViewerState extends State<YoutubeViewer> {
//    YoutubePlayerController _controller;
//    TextEditingController _idController;
//    TextEditingController _seekToController;
//
//    PlayerState _playerState;
//    YoutubeMetaData _videoMetaData;
//    double _volume = 100;
//    bool _muted = false;
//    bool _isPlayerReady = false;
//   @override
//   void initState() {
//     super.initState();
//     _controller = YoutubePlayerController(
//       initialVideoId: widget.videoID, // livestream example
//
//       flags: const YoutubePlayerFlags(        //startAt: Duration(minutes: 1, seconds: 5),
//         mute: false,
//         autoPlay: true,
//         disableDragSeek: false,
//         loop: false,
//         isLive: false,
//         forceHD: false,
//         enableCaption: true,
//       ),
//     )..addListener(listener);
//     _idController = TextEditingController();
//     _seekToController = TextEditingController();
//     _videoMetaData = const YoutubeMetaData();
//     _playerState = PlayerState.unknown;
//   }
//
//    void listener() {
//      if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
//        setState(() {
//          _playerState = _controller.value.playerState;
//          _videoMetaData = _controller.metadata;
//        });
//      }
//    }
//
//    @override
//    void deactivate() {
//      // Pauses video while navigating to next page.
//      _controller.pause();
//      super.deactivate();
//    }
//
//    @override
//    void dispose() {
//      _controller.dispose();
//      _idController.dispose();
//      _seekToController.dispose();
//      super.dispose();
//    }
//
//   @override
//   Widget build(BuildContext context) {
//     // final player = YoutubePlayerIFrame();
//     return YoutubePlayerBuilder(
//         player: YoutubePlayer(
//           controller: _controller,
//         ),
//         builder: (context, player){
//         return  Column(
//           children: [
//             // some widgets
//             player,
//             //some other widgets
//           ],
//         );
//       }
//     );
//   }
// }
//
// class YoutubeVideo extends StatefulWidget {
//   final String url;
//
//   const YoutubeVideo({Key key, this.url}) : super(key: key);
//
//
//   @override
//   YoutubeVideoState createState() => YoutubeVideoState();
// }
//
// class YoutubeVideoState extends State<YoutubeVideo> {
//   VideoPlayerController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(
//       widget.url,
//       // youtubeVideoQuality:VideoQuality.,
//     );
//
//     _controller.addListener(() {
//       setState(() {});
//     });
//     _controller.setLooping(true);
//     _controller.initialize();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           Container(padding: const EdgeInsets.only(top: 20.0)),
//           const Text('Video from Youtube'),
//           Container(
//             padding: const EdgeInsets.all(20),
//             child: AspectRatio(
//               aspectRatio: _controller.value.aspectRatio,
//               child: Stack(
//                 alignment: Alignment.bottomCenter,
//                 children: <Widget>[
//                   VideoPlayer(_controller),
//                   ClosedCaption(text: _controller.value.caption.text),
//                   _PlayPauseOverlay(controller: _controller),
//                   VideoProgressIndicator(
//                     _controller,
//                     allowScrubbing: true,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// class _PlayPauseOverlay extends StatelessWidget {
//   const _PlayPauseOverlay({Key key, this.controller}) : super(key: key);
//
//   final VideoPlayerController controller;
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         AnimatedSwitcher(
//           duration: Duration(milliseconds: 50),
//           reverseDuration: Duration(milliseconds: 200),
//           child: controller.value.isPlaying
//               ? SizedBox.shrink()
//               : Container(
//             color: Colors.black26,
//             child: Center(
//               child: Icon(
//                 Icons.play_arrow,
//                 color: Colors.white,
//                 size: 100.0,
//               ),
//             ),
//           ),
//         ),
//         GestureDetector(
//           onTap: () {
//             controller.value.isPlaying ? controller.pause() : controller.play();
//           },
//         ),
//       ],
//     );
//   }
// }
