// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, avoid_single_cascade_in_expression_statements, unused_import
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:get/get.dart';


class English_page extends StatefulWidget {
  const English_page({Key? key}) : super(key: key);

  @override
  State<English_page> createState() => _English_pageState();
}

class _English_pageState extends State<English_page> {
  List English_page = [];
  bool _playArea = false;
  bool _isPlaying = false;
  bool _disposed = false;
  int _isPlayingIndex = -1;
  VideoPlayerController? _controller;

  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("assets/English.json")
        .then(((value) {
      setState(() {
        English_page = json.decode(value);
      });
    }));
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  void dispose() {
    _disposed = true;
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _playArea == false
            ? BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.7),
                    Colors.blue.withOpacity(0.7),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              )
            : BoxDecoration(color: Colors.blue),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  _playArea == false
                      ? Container(
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          // color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(
                                      Icons.arrow_back_ios_sharp,
                                    ),
                                  ),
                                  Icon(Icons.timelapse_sharp),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "There is no end to education",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "For the best return on your money, pour your purse into your head.",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(Icons.timer),
                                        Text("60 min"),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white.withOpacity(0.3),
                                    ),
                                    height: 30,
                                    width: 100,
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(Icons.science),
                                        Text("English"),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white.withOpacity(0.3),
                                    ),
                                    height: 30,
                                    width: 150,
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      : Container(
                          //colom
                          child: Column(
                            children: [
                              Container(
                                height: 100,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Icon(
                                      Icons.info_outline,
                                      size: 20,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                              _playView(context),
                              _controlView(context),
                            ],
                          ),
                        ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(80),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Chapter name",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.reddit_sharp),
                      ],
                    ),
                    Expanded(
                      child: _listView(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String convertTwo(int value) {
    return value < 10 ? "0$value" : "$value";
  }

  Widget _controlView(BuildContext context) {
    final noMute = (_controller?.value.volume ?? 0) > 0;
    final duration = _duration?.inSeconds ?? 0;
    final head = _position?.inSeconds ?? 0;
    final remained = max(0, duration - head);
    final mins = convertTwo(remained ~/ 60.0);
    final secs = convertTwo(remained % 60);
    return Column(
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.red[700],
            inactiveTrackColor: Colors.red[100],
            trackShape: RoundedRectSliderTrackShape(),
            trackHeight: 2.0,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
            thumbColor: Colors.redAccent,
            overlayColor: Colors.red.withAlpha(32),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
            tickMarkShape: RoundSliderTickMarkShape(),
            activeTickMarkColor: Colors.red[700],
            inactiveTickMarkColor: Colors.red[100],
            valueIndicatorShape: PaddleSliderValueIndicatorShape(),
            valueIndicatorColor: Colors.redAccent,
            valueIndicatorTextStyle: TextStyle(
              color: Colors.white,
            ),
          ),
          child: Slider(
            value: _progress.clamp(
                0.0, 1.0), // Ensure _progress is within [0.0, 1.0]
            min: 0.0,
            max: 1.0, // Slider now represents the entire duration of the video
            divisions: 100,
            label: _position?.toString().split(".")[0],
            onChanged: (value) {
              setState(() {
                _progress =
                    value.clamp(0.0, 1.0); // Ensure value is within [0.0, 1.0]
              });
            },
            onChangeStart: (value) {
              _controller?.pause();
            },
            onChangeEnd: (value) {
              final duration = _controller?.value.duration;
              if (duration != null && duration.inMilliseconds > 0) {
                var newValue = max(
                    0, min(value, duration.inMilliseconds.toDouble() / 1000));
                var millis = (duration.inMilliseconds * newValue).toInt();
                _controller?.seekTo(Duration(milliseconds: millis));
                _controller?.play();
              }
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  if (noMute) {
                    _controller?.setVolume(0);
                  } else {
                    _controller?.setVolume(1);
                  }
                  setState(() {});
                },
                icon: Icon(
                  noMute ? Icons.volume_down_rounded : Icons.volume_off_rounded,
                  color: Colors.white,
                )),
            IconButton(
              icon: Icon(
                Icons.fast_rewind_rounded,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () async {
                final index = _isPlayingIndex - 1;
                if (index >= 0 && English_page.length >= 0) {
                  _initializeVideo(index);
                } else {
                  Get.snackbar("Video", "No more ahead videos in list !",
                      snackPosition: SnackPosition.BOTTOM,
                      icon: Icon(
                        Icons.reddit,
                        size: 30,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.blue,
                      colorText: Colors.white);
                }
                // Action to be performed when the button is pressed
              },
            ),
            IconButton(
              icon: Icon(
                _isPlaying
                    ? Icons.pause_circle_filled_rounded
                    : Icons.play_circle_filled,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () async {
                if (_isPlaying) {
                  setState(() {
                    _isPlaying = false;
                  });
                  _controller?.pause();
                } else {
                  setState(() {
                    _isPlaying = true;
                  });
                  _controller?.play();
                }
              },
            ),
            IconButton(
              icon: Icon(
                Icons.fast_forward_rounded,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () async {
                // Action to be performed when the button is pressed
                final index = _isPlayingIndex + 1;
                if (index < English_page.length - 1) {
                  _initializeVideo(index);
                } else {
                  Get.snackbar("Video", "You finished all the videos !",
                      snackPosition: SnackPosition.BOTTOM,
                      icon: Icon(
                        Icons.reddit,
                        size: 30,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.blue,
                      colorText: Colors.white);
                }
              },
            ),
            Text(
              "$mins : $secs",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }

  Widget _playView(BuildContext contex) {
    final controller = _controller;
    // ignore: unnecessary_null_comparison
    if (controller != null && controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: VideoPlayer(controller),
      );
    } else {
      return AspectRatio(
          aspectRatio: 16 / 9,
          child: Column(
            children: [
              Icon(Icons.refresh_sharp),
              Text(
                "Being initialized pls wait",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ));
    }
  }

  var _onUpdateControllerTime;
  Duration? _duration;
  Duration? _position;
  var _progress = 0.0;
  void _onControllerUpdate() async {
    if (_disposed) {
      return;
    }
    _onUpdateControllerTime = 0;
    final now = DateTime.now().millisecondsSinceEpoch;
    if (_onUpdateControllerTime > now) {
      return;
    }
    _onUpdateControllerTime = now + 500;

    final controller = _controller;
    if (controller == null) {
      debugPrint("Contoller is null");
      return;
    }
    if (!controller.value.isInitialized) {
      debugPrint("controller can not be initialized");
      return;
    }

    if (_duration == null) {
      _duration = _controller?.value.duration;
    }
    var duration = _duration;
    if (duration == null) return;

    var position = await controller.position;
    _position = position;
    final playing = controller.value.isPlaying;
    if (playing) {
      if (_disposed) return;
      setState(() {
        //60 now 30 then 30/60 = 0.5
        _progress = position!.inMilliseconds.ceilToDouble() /
            duration.inMilliseconds.ceilToDouble();
      });
    }
    _isPlaying = playing;
  }

  _initializeVideo(int index) async {
    final controller = VideoPlayerController.networkUrl(
        Uri.parse(English_page[index]["videoUrl"]));
    final old = _controller;
    _controller = controller;
    if (old != null) {
      old.removeListener(_onControllerUpdate);
      old.pause();
    }
    setState(() {});
    controller
      ..initialize().then((_) {
        old?.dispose();
        _isPlayingIndex = index;
        controller.addListener(_onControllerUpdate);
        controller.play();
        setState(() {});
      });
  }

  _onTapVideo(int index) {
    // ignore: deprecated_member_use
    _initializeVideo(index);
  }

  _listView() {
    return ListView.builder(
      itemCount: English_page.length,
      itemBuilder: (_, int index) {
        return GestureDetector(
          onTap: () {
            _onTapVideo(index);
            debugPrint(index.toString());
            // You can add functionality here.
            setState(() {
              if (_playArea == false) {
                _playArea = true;
              }
            });
          },
          child: _buildCard(index),
        );
      },
    );
  }

  _buildCard(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            // color: Colors.blue.shade400,
            borderRadius: BorderRadius.circular(10)),
        height: 120,
        // width: 100, // fixed width remove kr
        // color: Colors.amber,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // You need to add child widgets here.
              Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(English_page[index]["thumbnail"]),
                          fit: BoxFit.cover,
                        )),
                  ),
                  SizedBox(width: 16),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          English_page[index]['title'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(English_page[index]['time'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white))
                      ])
                ],
              ),
              SizedBox(
                height: 2,
              ),
              Row(children: [
                Container(
                  width: 80,
                  height: 15,
                  decoration: BoxDecoration(
                      color: Colors.blue.shade300,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    "Keep it up",
                    style: TextStyle(fontSize: 10),
                  )),
                ),
                Row(
                  children: [
                    for (int i = 0; i < 20; i++)
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Container(
                          height: 1,
                          width: 3,
                          decoration: BoxDecoration(
                            color: Colors.black,
                          ),
                        ),
                      )
                  ],
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
