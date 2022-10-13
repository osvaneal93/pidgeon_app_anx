import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pidgeon_app/src/core/utils/colors.dart';
import 'package:pidgeon_app/src/core/utils/styles.dart';
import 'package:video_player/video_player.dart';

class LessonIndex extends StatefulWidget {
  const LessonIndex({super.key});

  @override
  State<LessonIndex> createState() => _LessonIndexState();
}

class _LessonIndexState extends State<LessonIndex> {
  late VideoPlayerController _videoPlayerController;
  int _currentIndex = 0;

  void _playVideo({int index = 0, bool init = false}) {
    if (index < 0) return;

    _videoPlayerController = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/pidgeonapp-5074a.appspot.com/o/v1.mp4?alt=media&token=f11f183f-389d-4d0f-8c2f-a924c81d02db')
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((value) => _videoPlayerController.play());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _playVideo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _videoPlayerController.value.isInitialized
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: colors.black,
                  height: 300,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 20),
                    child: VideoPlayer(_videoPlayerController),
                  ),
                ),
                SizedBox(
                  height: 10,
                  child: VideoProgressIndicator(
                    _videoPlayerController,
                    allowScrubbing: true,
                    padding: EdgeInsets.all(1),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 100,
                      height: 20,
                      child: ValueListenableBuilder(
                        valueListenable: _videoPlayerController,
                        builder: (BuildContext context, VideoPlayerValue value,
                            Widget? child) {
                          return Text(
                            _videoDuration(value.position),
                            style:
                                styles.smallStyle(context, color: colors.black),
                          );
                        },
                      ),
                    )
                  ],
                )
              ],
            )
          : Container(
              color: colors.black,
              height: 300,
              width: double.infinity,
              child: const Center(child: CircularProgressIndicator()),
            ),
    );
  }

  String _videoDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [hours, minutes, seconds].join(':');
  }
}
