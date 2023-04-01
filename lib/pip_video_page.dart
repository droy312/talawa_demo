import 'package:flutter/material.dart';
import 'package:pip_view/pip_view.dart';
import 'package:talawa_demo/pip_video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PipVideoPage extends StatelessWidget {
  PipVideoPage({Key? key}) : super(key: key);

  static final String? _initialVideoId = YoutubePlayer.convertUrlToId(
      'https://www.youtube.com/watch?v=HAqfvcXuJTk');

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: _initialVideoId ?? 'HAqfvcXuJTk',
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 200,
          width: MediaQuery.of(context).size.width - 32,
          child: PIPView(
            builder: (context, isFloating) {
              return InkWell(
                onTap: () {
                  PIPView.of(context)?.presentBelow(PipVideoPage());
                },
                child: Card(child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: PipVideoPlayer(controller: _controller),
                )),
              );
            },
          ),
        ),
      ),
    );
  }
}
