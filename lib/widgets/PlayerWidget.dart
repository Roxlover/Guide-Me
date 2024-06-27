import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guide_me/screens/PlacesDetail.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PlayerWidget extends StatefulWidget {
  final String img;
  final String name;
  final String audio;
  const PlayerWidget({
    super.key,
    required this.img,
    required this.name,
    required this.audio,
  });

  @override
  State<StatefulWidget> createState() {
    return _PlayerWidgetState();
  }
}

class _PlayerWidgetState extends State<PlayerWidget> {
  AudioPlayer player = AudioPlayer();
  bool isplaying = false;
  PlayerState? _playerState;
  Duration? _duration;
  Duration? _position;

  StreamSubscription? _durationSubscription;
  StreamSubscription? _positionSubscription;
  StreamSubscription? _playerCompleteSubscription;
  StreamSubscription? _playerStateChangeSubscription;

  bool get _isPlaying => _playerState == PlayerState.playing;

  bool get _isPaused => _playerState == PlayerState.paused;

  String get _durationText => formatDuration(_duration);

  String get _positionText => formatDuration(_position);

  String formatDuration(Duration? duration) {
    if (duration == null) return '';

    int totalSeconds = duration.inSeconds;
    int minutes = totalSeconds ~/ 60;
    int seconds = totalSeconds % 60;

    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');

    return '$minutesStr:$secondsStr';
  }

  @override
  void initState() {
    super.initState();
    // Use initial values from player
    _playerState = player.state;
    player.getDuration().then(
          (value) => setState(() {
            _duration = value;
          }),
        );
    player.getCurrentPosition().then(
          (value) => setState(() {
            _position = value;
          }),
        );
    _initStreams();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await player.setSource(AssetSource(widget.audio));
    });
  }

  @override
  void setState(VoidCallback fn) {
    // Subscriptions only can be closed asynchronously,
    // therefore events can occur after widget has been disposed.
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _playerCompleteSubscription?.cancel();
    _playerStateChangeSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PlacesDetail()),
            );
          },
          child: Container(
              height: 16.h,
              width: 100.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: Color.fromARGB(200, 30, 129, 176), width: 2),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // Gölgenin konumu
                    ),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 68,
                          height: 68,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(widget.img),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            widget.name,
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w300, fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 13.h,
                    width: 68.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        isplaying
                            ? IconButton(
                                onPressed: _pause,
                                icon: Icon(
                                  Icons.pause,
                                  color: Color.fromARGB(200, 30, 129, 176),
                                ),
                                iconSize: 50,
                                color: color,
                              )
                            : IconButton(
                                onPressed: _play,
                                icon: Icon(
                                  Icons.play_arrow,
                                  color: Color.fromARGB(200, 30, 129, 176),
                                ),
                                iconSize: 50,
                                color: color,
                              ),
                        Column(
                          children: [
                            Slider(
                              activeColor: Color.fromARGB(200, 30, 129, 176),
                              inactiveColor: Colors.grey[400],
                              onChanged: (value) {
                                final duration = _duration;
                                if (duration == null) {
                                  return;
                                }
                                final position =
                                    value * duration.inMilliseconds;
                                player.seek(
                                    Duration(milliseconds: position.round()));
                              },
                              value: (_position != null &&
                                      _duration != null &&
                                      _position!.inMilliseconds > 0 &&
                                      _position!.inMilliseconds <
                                          _duration!.inMilliseconds)
                                  ? _position!.inMilliseconds /
                                      _duration!.inMilliseconds
                                  : 0.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 40.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(_positionText),
                                    Text(_durationText)
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )),
        ));

    // Column(
    //   mainAxisSize: MainAxisSize.min,
    //   children: <Widget>[
    //     Row(
    //       mainAxisSize: MainAxisSize.min,
    //       children: [
    //         IconButton(
    //           key: const Key('play_button'),
    //           onPressed: _isPlaying ? null : _play,
    //           iconSize: 48.0,
    //           icon: const Icon(Icons.play_arrow),
    //           color: color,
    //         ),
    //         IconButton(
    //           key: const Key('pause_button'),
    //           onPressed: _isPlaying ? _pause : null,
    //           iconSize: 48.0,
    //           icon: const Icon(Icons.pause),
    //           color: color,
    //         ),
    //         IconButton(
    //           key: const Key('stop_button'),
    //           onPressed: _isPlaying || _isPaused ? _stop : null,
    //           iconSize: 48.0,
    //           icon: const Icon(Icons.stop),
    //           color: color,
    //         ),
    //       ],
    //     ),
    // Slider(
    //   onChanged: (value) {
    //     final duration = _duration;
    //     if (duration == null) {
    //       return;
    //     }
    //     final position = value * duration.inMilliseconds;
    //     player.seek(Duration(milliseconds: position.round()));
    //   },
    //   value: (_position != null &&
    //           _duration != null &&
    //           _position!.inMilliseconds > 0 &&
    //           _position!.inMilliseconds < _duration!.inMilliseconds)
    //       ? _position!.inMilliseconds / _duration!.inMilliseconds
    //       : 0.0,
    // ),
    //     Text(
    //       _position != null
    //           ? '$_positionText / $_durationText'
    //           : _duration != null
    //               ? _durationText
    //               : '',
    //       style: const TextStyle(fontSize: 16.0),
    //     ),
    //   ],
    // );
  }

  void _initStreams() {
    _durationSubscription = player.onDurationChanged.listen((duration) {
      setState(() => _duration = duration);
    });

    _positionSubscription = player.onPositionChanged.listen(
      (p) => setState(() => _position = p),
    );

    _playerCompleteSubscription = player.onPlayerComplete.listen((event) {
      setState(() {
        _playerState = PlayerState.stopped;
        _position = Duration.zero;
      });
    });

    _playerStateChangeSubscription =
        player.onPlayerStateChanged.listen((state) {
      setState(() {
        _playerState = state;
      });
    });
  }

  Future<void> _play() async {
    await player.resume();
    setState(() => _playerState = PlayerState.playing);
    isplaying = true;
  }

  Future<void> _pause() async {
    await player.pause();
    setState(() => _playerState = PlayerState.paused);
    isplaying = false;
  }

  Future<void> _stop() async {
    await player.stop();
    setState(() {
      _playerState = PlayerState.stopped;
      _position = Duration.zero;
    });
  }
}

//#endregion