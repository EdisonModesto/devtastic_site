import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubeFrame extends StatefulWidget {
  const YoutubeFrame({Key? key}) : super(key: key);

  @override
  _YoutubeFrameState createState() => _YoutubeFrameState();
}

class _YoutubeFrameState extends State<YoutubeFrame> {

  final _controller = YoutubePlayerController.fromVideoId(
    videoId: '1s8DiApVC0g',
    autoPlay: false,
    params: const YoutubePlayerParams(
      showFullscreenButton: true,
      strictRelatedVideos: true,
      color: "white",
      playsInline: false,
      showVideoAnnotations: false
    ),
  );
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      aspectRatio: 16 / 9,
      backgroundColor: Colors.transparent,
      enableFullScreenOnVerticalDrag: false,
    );
  }
}