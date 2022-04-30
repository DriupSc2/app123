import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audioplayers_api.dart';
import 'package:flutter/material.dart';

class ButtonQuestion extends StatefulWidget {
  const ButtonQuestion({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ButtonQuestionState createState() => _ButtonQuestionState();
}

class _ButtonQuestionState extends State<ButtonQuestion> {

  AudioPlayer audioPlayer = new AudioPlayer();
  Duration duration = new Duration();
  Duration position = new Duration();
  PlayerState playerState = PlayerState.PAUSED;
  bool playing = false;
  late AudioCache audioCache;
  IconData playBtn = Icons.play_arrow;
  @override
  void initState(){
    super.initState();
    audioCache = AudioCache(fixedPlayer: audioPlayer);

    audioPlayer.onDurationChanged.listen((Duration dd){
      setState(() {
        duration = dd;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((Duration dd){
      setState(() {
        position = dd;
      });
    });

    audioPlayer.onPlayerCompletion.listen((event) {
      setState(() {
        duration = position;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: 500,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(20.0),
            ),
            padding: EdgeInsets.zero,
            child: InkWell(
              onTap: (){
                //getAudio();
              },
              child: Row(
                children: [
                  IconButton(
                      onPressed: () async {
                        if(!playing){
                          audioCache.play('audio/ac_1.mp3');
                          setState(() {
                            playBtn = Icons.pause;
                            playing = true;
                          });
                        }else{
                          audioPlayer.pause();
                          setState(() {
                            playBtn = Icons.play_arrow;
                            playing = false;
                          });
                        }
                      },
                      icon: Icon(playBtn)),
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                  ),),
                ],
              ),
            ),
          ),
          playing ? slider(): Container(),
        ],
      ),
    );
  }

  Widget slider(){
    return Slider.adaptive(
        min: 0.0,
        value: position.inMilliseconds.toDouble(),
        max: duration.inMilliseconds.toDouble(),
        activeColor: Colors.deepOrange,
        inactiveColor: Colors.brown,
        onChanged: (double value){
          setState(() {
            audioPlayer.seek(new Duration(seconds: value.toInt()));
          });
        });
  }

  void getAudio() async{
    if(!playing){
      audioCache.play('audio/ac_1.mp3');
      setState(() {
        playBtn = Icons.pause;
        playing = true;
      });
    }else{
      audioPlayer.pause();
      setState(() {
        playBtn = Icons.play_arrow;
        playing = false;
      });
    }
  }
}


