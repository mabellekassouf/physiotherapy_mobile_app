import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'package:waterbear_movement/utilities/constants.dart';
class ArticleDetailVideoScreen extends StatefulWidget {

  @override
  _ArticleDetailVideoScreenState createState() => _ArticleDetailVideoScreenState();
}

class _ArticleDetailVideoScreenState extends State<ArticleDetailVideoScreen> {
  bool isRunning = true ;
  int index = 0;
  double _position = 0;
  double _buffer = 0;
  bool _lock = true;
  Map<String, VideoPlayerController> _controllers = {};
  Map<int, VoidCallback> _listeners = {};
  Set<String> _urls = {
    'assets/videos/video1.mp4',
  };

  @override
  void initState() {
    super.initState();
    if (_urls.length > 0) {
      _initController(0).then((_) {
        _playController(0);
      });
    }

    if (_urls.length > 1) {
      _initController(1).whenComplete(() => _lock = false);
    }
  }

  VoidCallback _listenerSpawner(index) {
    return () {
      int dur = _controller(index).value.duration.inMilliseconds;
      int pos = _controller(index).value.position.inMilliseconds;
      //int buf = _controller(index).value.buffered.last.end.inMilliseconds;

      if(mounted) {
        setState(() {
          if (dur <= pos) {
            _position = 0;
            return;
          }
          _position = pos / dur;
          // _buffer = buf / dur;
        });
      }
      if (dur - pos < 1) {
        if(index == _urls.length -1)
        {
          Navigator.of(context).popAndPushNamed("/EndOfWorkout");
        }
      }
    };
  }

  VideoPlayerController _controller(int index) {
    return _controllers[_urls.elementAt(index)];
  }

  Future<void> _initController(int index) async {
    var controller = VideoPlayerController.asset(_urls.elementAt(index));
    _controllers[_urls.elementAt(index)] = controller;
    await controller.initialize();
  }

  void _removeController(int index) {
    _controller(index).dispose();
    _controllers.remove(_urls.elementAt(index));
    _listeners.remove(index);
  }

  void _stopController(int index) {
    _controller(index).removeListener(_listeners[index]);
    _controller(index).pause();
    _controller(index).seekTo(Duration(milliseconds: 0));
  }

  void _playController(int index) async {
    if (!_listeners.keys.contains(index)) {
      _listeners[index] = _listenerSpawner(index);
    }
    if (index < _urls.length - 1) {
      _controller(index).setLooping(true);
    }
    _controller(index).addListener(_listeners[index]);
    await _controller(index).play();
    if(mounted) {
      setState(() {});
    }
  }


  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller(index).dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_rounded),
        ),
        elevation: 0,
        backgroundColor: Constants.darkAccent,
        title: Text("The Power of Meditation Video", style: TextStyle(color: Colors.white, fontSize: Constants.titleSize)),
        iconTheme: IconThemeData(color: Constants.lightAccent),
      ),

      body: Column(
        children: [
          Stack(
            children: <Widget>[
              GestureDetector(
                onLongPressStart: (_) => _controller(index).pause(),
                onLongPressEnd: (_) => _controller(index).play(),
                child: Column(
                    children:[
                      Container(
                        height: MediaQuery.of(context).size.height/2.2,
                        child: AspectRatio(
                          aspectRatio: _controller(index).value.aspectRatio,
                          child: Center(child: VideoPlayer(_controller(index))),
                        ),
                      ),
                    ]
                ),
              ),
              Positioned(
                child: Container(
                  height: 10,
                  width: MediaQuery.of(context).size.width * _buffer,
                  color: Colors.grey,
                ),
              ),
              Positioned(
                child: Container(
                  height: 10,
                  width: MediaQuery.of(context).size.width * _position,
                  color: Constants.lightAccent,
                ),
              ),
            ],
          ),
          Container(
            width:MediaQuery.of(context).size.width,
            height:MediaQuery.of(context).size.height/2.7,
            padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("The Power of meditationThe Power of meditationThe Power of meditationThe Power of meditationThe Power of meditationThe Power of meditationThe Power of meditationThe Power of meditationThe Power of meditationThe Power of meditationThe Power of meditationThe Power of meditationThe Power of meditationThe Power of meditationThe Power of meditationThe Power of meditationThe Power of meditationThe Power of meditationThe Power of meditationThe Power of meditationThe Power of meditationThe Power of meditationThe Power of meditation",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),),
              ],
            ),
          )
        ],
      ),

    );
  }



//Widget buildVideos() => PageView(
//  controller: controller,
//  onPageChanged: (index) => setState(() {
//    currentExercise = widget.exerciseSet.exercises[index];
//  }),
//  children: widget.exerciseSet.exercises
//      .map((exercise) => VideoPlayerWidget(
//    exercise: exercise,
//    onInitialized: () => setState(() {}),
//  ))
//      .toList(),
//);



//Widget buildVideoControls() => VideoControlsWidget(
//  exercise: currentExercise,
//  onTogglePlaying: (isPlaying) {
//    setState(() {
//      if (isPlaying) {
//        currentExercise.controller.play();
//      } else {
//        currentExercise.controller.pause();
//      }
//    });
//  },
//  onNextVideo: () => controller.nextPage(
//    duration: Duration(milliseconds: 300),
//    curve: Curves.easeIn,
//  ),
//  onRewindVideo: () => controller.previousPage(
//    duration: Duration(milliseconds: 300),
//    curve: Curves.easeIn,
//  ),
//);


  Widget buildPlayButton(BuildContext context) {
    if (isRunning) {
      return buildButton(
        context,
        icon: Icon(Icons.pause, size: 40, color: Colors.white),
        onClicked: () {
          _controller(index).pause();
          setState(() {
            isRunning = false;
          });
        },
      );
    } else {
      return buildButton(
        context,
        icon: Icon(Icons.play_arrow, size: 40, color: Colors.white),
        onClicked: () {
          _controller(index).play();
          setState(() {
            isRunning = true;
          });
        },
      );
    }
  }





  Widget buildButton(
      BuildContext context, {
        @required Widget icon,
        @required VoidCallback onClicked,
      }) =>
      GestureDetector(
        onTap: onClicked,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Constants.lightAccent,
                blurRadius: 8,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Constants.lightAccent,
            child: icon,
          ),
        ),
      );
}

