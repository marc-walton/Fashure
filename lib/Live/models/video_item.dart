// import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
 import 'package:video_player/video_player.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:flick_video_player/flick_video_player.dart';
class VideoItems extends StatefulWidget {
 final VideoPlayerController videoPlayerController;
  final bool looping;
  final bool autoplay;
  final String url;
  bool _pauseOnTap = true;
  double playBackSpeed = 1.0;
  VideoItems({
 this.videoPlayerController,
    this.looping, this.autoplay,this.url,
    Key key,
  }) : super(key: key);

  @override
  _VideoItemsState createState() => _VideoItemsState();
}

class _VideoItemsState extends State<VideoItems> {
  // ChewieController _chewieController;
  // final FijkPlayer player = FijkPlayer();
  FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    // _chewieController = ChewieController(
    //   videoPlayerController: widget.videoPlayerController,
    //   aspectRatio:5/8,
    //   autoInitialize: true,
    //   autoPlay: widget.autoplay,
    //   looping: widget.looping,
    //   errorBuilder: (context, errorMessage) {
    //     return Center(
    //       child: Text(
    //         errorMessage,
    //         style: TextStyle(color: Colors.white),
    //       ),
    //     );
    //   },
    // );
    flickManager = FlickManager(
      videoPlayerController:  widget.videoPlayerController,
    );
  }

  @override
  void dispose() {
    super.dispose();
    // widget.videoPlayerController.dispose();
    // _chewieController.dispose();
    // player.release();
    flickManager.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:
      FlickVideoPlayer(
        flickManager: flickManager,

      ),
      // FijkView(
      //   player: player,
      // ),
      // Chewie(
      //   controller: _chewieController,
      // ),
    );
  }

}