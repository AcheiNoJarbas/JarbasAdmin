// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:video_player/video_player.dart';

class JarbasVideoPlayer extends StatefulWidget {
  const JarbasVideoPlayer({
    super.key,
    this.width,
    this.height,
    this.urlVideo,
  });

  final double? width;
  final double? height;
  final String? urlVideo;

  @override
  State<JarbasVideoPlayer> createState() => _JarbasVideoPlayerState();
}

class _JarbasVideoPlayerState extends State<JarbasVideoPlayer> {
  late VideoPlayerController controllerVideo;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    controllerVideo = VideoPlayerController.networkUrl(
      Uri.parse(
        widget.urlVideo!,
      ),
    );
    controllerVideo.setLooping(true);
    _initializeVideoPlayerFuture =
        controllerVideo.initialize().whenComplete(() {
      controllerVideo.play();
    });
  }

  @override
  void dispose() {
    controllerVideo.pause();
    controllerVideo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  ],
                ),
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                AspectRatio(
                    aspectRatio: controllerVideo.value.aspectRatio,
                    child: Stack(
                      children: [
                        VideoPlayer(controllerVideo),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                if (controllerVideo.value.isPlaying) {
                                  controllerVideo.pause();
                                } else {
                                  controllerVideo.play();
                                }
                              });
                            },
                            child: Opacity(
                                opacity: 0,
                                child: Container(
                                  color: Colors.black,
                                ))),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: IconButton(
                                      color: Colors.blue,
                                      style: ButtonStyle(
                                          backgroundColor:
                                              WidgetStatePropertyAll(
                                                  Colors.blue)),
                                      alignment: Alignment(0.2, 0.10),
                                      onPressed: () {
                                        setState(() {
                                          if (controllerVideo.value.volume >
                                              0) {
                                            controllerVideo.setVolume(0);
                                          } else {
                                            controllerVideo.setVolume(100);
                                          }
                                        });
                                      },
                                      icon: Icon(
                                        controllerVideo.value.volume == 0
                                            ? Icons.volume_off
                                            : Icons.volume_up,
                                        color: Colors.white,
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )),
              ],
            );
          } else {
            return Text("Video não carregado!");
          }
        });
  }
}
