import 'package:flutter/material.dart';
import 'package:cached_video_player/cached_video_player.dart';

// import 'package:video_player/video_player.dart';
// import 'package:flick_video_player/flick_video_player.dart';
//
// import 'package:better_player/better_player.dart';
// class Player extends StatefulWidget {
//   final VideoInfo video;
//
//   const Player({Key key, @required this.video}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() => _PlayerState();
// }
//
// class _PlayerState extends State<Player> {
//   String _error;
//
//   // VideoPlayerController videoPlayerController;
//
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   videoPlayerController = VideoPlayerController.network(widget.video.mediaUrl)
//   //     ..initialize().then((value) {
//   //       videoPlayerController.play();
//   //       videoPlayerController.setVolume(1);
//   //     });
//   // }
//   //
//   // @override
//   // void dispose() {
//   //   super.dispose();
//   //   videoPlayerController.dispose();
//   // }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: <Widget>[
//           _error == null
//               ? NetworkPlayerLifeCycle(
//             widget.video.mediaUrl,
//                 (BuildContext context, VideoPlayerController controller) =>
//                 AspectRatioVideo(controller),
//           )
//               : Center(
//             child: Text(_error),
//           ),
//           // Container(
//           //   padding: EdgeInsets.all(16.0),
//           //   child: IconButton(
//           //     icon: Icon(Icons.close, color: Colors.white),
//           //     onPressed: () => Navigator.pop(context),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }
//
// class VideoPlayPause extends StatefulWidget {
//   VideoPlayPause(this.controller);
//
//   final VideoPlayerController controller;
//
//   @override
//   State createState() {
//     return _VideoPlayPauseState();
//   }
// }
//
// class _VideoPlayPauseState extends State<VideoPlayPause> {
//   _VideoPlayPauseState() {
//     listener = () {
//       if (mounted) {
//         setState(() {});
//       }
//     };
//   }
//
//   FadeAnimation imageFadeAnim =
//   FadeAnimation(child: const Icon(Icons.play_arrow, size: 100.0));
//   VoidCallback listener;
//
//   VideoPlayerController get controller => widget.controller;
//
//   @override
//   void initState() {
//     super.initState();
//     controller.addListener(listener);
//     controller.setVolume(1.0);
//     controller.play();
//   }
//
//   @override
//   void deactivate() {
//     controller.setVolume(0.0);
//     controller.removeListener(listener);
//     super.deactivate();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final List<Widget> children = <Widget>[
//       GestureDetector(
//         child: VideoPlayer(controller),
//         onTap: () {
//           if (!controller.value.isInitialized) {
//             return;
//           }
//           if (controller.value.isPlaying) {
//             imageFadeAnim =
//                 FadeAnimation(child: const Icon(Icons.pause, size: 100.0));
//             controller.pause();
//           } else {
//             imageFadeAnim =
//                 FadeAnimation(child: const Icon(Icons.play_arrow, size: 100.0));
//             controller.play();
//           }
//         },
//       ),
//       Align(
//         alignment: Alignment.bottomCenter,
//         child: VideoProgressIndicator(
//           controller,
//           allowScrubbing: true,
//         ),
//       ),
//       Center(child: imageFadeAnim),
//       Center(
//           child: controller.value.isBuffering
//               ? const CircularProgressIndicator()
//               : null),
//     ];
//
//     return Stack(
//       fit: StackFit.passthrough,
//       children: children,
//     );
//   }
// }
//
// class FadeAnimation extends StatefulWidget {
//   FadeAnimation(
//       {this.child, this.duration = const Duration(milliseconds: 500)});
//
//   final Widget child;
//   final Duration duration;
//
//   @override
//   _FadeAnimationState createState() => _FadeAnimationState();
// }
//
// class _FadeAnimationState extends State<FadeAnimation>
//     with SingleTickerProviderStateMixin {
//   AnimationController animationController;
//
//   @override
//   void initState() {
//     super.initState();
//     animationController =
//         AnimationController(duration: widget.duration, vsync: this);
//     animationController.addListener(() {
//       if (mounted) {
//         setState(() {});
//       }
//     });
//     animationController.forward(from: 0.0);
//   }
//
//   @override
//   void deactivate() {
//     animationController.stop();
//     super.deactivate();
//   }
//
//   @override
//   void didUpdateWidget(FadeAnimation oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (oldWidget.child != widget.child) {
//       animationController.forward(from: 0.0);
//     }
//   }
//
//   @override
//   void dispose() {
//     if (animationController != null) animationController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return animationController.isAnimating
//         ? Opacity(
//       opacity: 1.0 - animationController.value,
//       child: widget.child,
//     )
//         : Container();
//   }
// }
//
// typedef Widget VideoWidgetBuilder(
//     BuildContext context, VideoPlayerController controller);
//
// abstract class PlayerLifeCycle extends StatefulWidget {
//   PlayerLifeCycle(this.dataSource, this.childBuilder);
//
//   final VideoWidgetBuilder childBuilder;
//   final String dataSource;
// }
//
// /// A widget connecting its life cycle to a [VideoPlayerController] using
// /// a data source from the network.
// class NetworkPlayerLifeCycle extends PlayerLifeCycle {
//   NetworkPlayerLifeCycle(String dataSource, VideoWidgetBuilder childBuilder)
//       : super(dataSource, childBuilder);
//
//   @override
//   _NetworkPlayerLifeCycleState createState() => _NetworkPlayerLifeCycleState();
// }
//
// abstract class _PlayerLifeCycleState extends State<PlayerLifeCycle> {
//   VideoPlayerController controller;
//
//   @override
//
//   /// Subclasses should implement [createVideoPlayerController], which is used
//   /// by this method.
//   void initState() {
//     super.initState();
//     controller = createVideoPlayerController();
//     controller.addListener(() {
//       if (controller.value.hasError) {
//         setState(() {});
//       }
//     });
//     controller.initialize();
//     // controller.setLooping(true);
//     controller.play();
//     controller.setVolume(1);
//   }
//
//   @override
//   void deactivate() {
//     super.deactivate();
//   }
//
//   @override
//   void dispose() {
//     if (controller != null) controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return widget.childBuilder(context, controller);
//   }
//
//   VideoPlayerController createVideoPlayerController();
// }
//
// class _NetworkPlayerLifeCycleState extends _PlayerLifeCycleState {
//   @override
//   VideoPlayerController createVideoPlayerController() {
//     return VideoPlayerController.network(widget.dataSource);
//   }
// }
//
// class AspectRatioVideo extends StatefulWidget {
//   AspectRatioVideo(this.controller);
//
//   final VideoPlayerController controller;
//
//   @override
//   AspectRatioVideoState createState() => AspectRatioVideoState();
// }
//
// class AspectRatioVideoState extends State<AspectRatioVideo> {
//   VideoPlayerController get controller => widget.controller;
//   bool initialized = false;
//
//   VoidCallback listener;
//
//   @override
//   void initState() {
//     super.initState();
//     listener = () {
//       if (!mounted) {
//         return;
//       }
//       if (initialized != controller.value.isInitialized) {
//         initialized = controller.value.isInitialized;
//         if (mounted) {
//           setState(() {});
//         }
//       }
//     };
//     controller.addListener(listener);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (controller.value.hasError) {
//       return Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Text(controller.value.errorDescription,
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold)),
//         ),
//       );
//     }
//
//     if (initialized) {
//       return Center(
//         child: AspectRatio(
//           aspectRatio: controller.value.aspectRatio,
//           child: VideoPlayPause(controller),
//         ),
//       );
//     } else {
//       return Center(child: CircularProgressIndicator());
//     }
//   }
// }
class VideoPlayerItem extends StatefulWidget {
  final String videoUrl;
   VideoPlayerItem({
     this.videoUrl,
  });

  @override
  _VideoPlayerItemState createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
   VideoPlayerController videoPlayerController;
//    FlickManager flickManager;
// BetterPlayerController _betterPlayerController;
  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((value) {
        videoPlayerController.play();
        videoPlayerController.setVolume(1);
        videoPlayerController.setLooping(true);

      });
    // BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
    //     BetterPlayerDataSourceType.NETWORK,    widget.videoUrl);
    // _betterPlayerController =  BetterPlayerController(
    //   BetterPlayerConfiguration(fit: BoxFit.cover, aspectRatio: 1.0),
    //   betterPlayerDataSource: betterPlayerDataSource,
    //
    //
    //   //
    // );
    // flickManager = FlickManager(
    //   videoPlayerController:
    //   VideoPlayerController.network(widget.videoUrl),
    // );
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
    // _betterPlayerController.dispose();
    // flickManager.dispose();

  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child:
      // FlickVideoPlayer(
      //     flickManager: flickManager
      // ),
      VideoPlayer(videoPlayerController),
    );
  }
}