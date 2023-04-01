import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PipVideoPlayer extends StatelessWidget {
  const PipVideoPlayer({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final YoutubePlayerController controller;

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: controller,
      showVideoProgressIndicator: true,
      progressColors: const ProgressBarColors(
        playedColor: Colors.amber,
        handleColor: Colors.amberAccent,
      ),
    );
  }
}
