
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'consultation-page.dart';


class SignosVitalesPage extends StatefulWidget {
  const SignosVitalesPage({Key? key, required this.languaje}) : super(key: key);
  final bool languaje;
  @override
  _SignosVitalesPageState createState() => _SignosVitalesPageState();
}

class _SignosVitalesPageState extends State<SignosVitalesPage> {

  List musicList = [
    {
      "title": "Le tomaré su pulso",
      "url": "sv_2.mp3",
      "status": false,
    },
    {
      "title": "Le tomaré la frecuencia respiratoria",
      "url": "sv_3.mp3",
      "status": false,
    },
    {
      "title": "Le tomaré la temperatura",
      "url": "sv_4.mp3",
      "status": false,
    },
    {
      "title": "Le tomaré la presión sanguínea",
      "url": "sv_5.mp3",
      "status": false,
    },
    {
      "title": "Voy a llamar a mi técnico",
      "url": "sv_6.mp3",
      "status": false,
    },
  ];

  List prueba = [
    {
      "title": "Por favor extiende tu mano,como te indica el doctor",
      "url": "sv_1.mp3",
      "status": false,
    }
  ];

  int anterior=0;
  List ante =[];

  String currentTitle = "";
  String currentSong = "";
  IconData btnIcon = Icons.play_arrow;
  late AudioCache audioCache;

  AudioPlayer _audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  bool isPlaying = false;
  Duration musicDuration = Duration();
  Duration musicPosition = Duration();

  @override
  void initState(){
    super.initState();
    audioCache = AudioCache(fixedPlayer: _audioPlayer);
  }

  playMusic(String url,int a , List _lista) async {
    if (isPlaying && currentSong != url) {
      _audioPlayer.pause();
      ante[anterior]["status"] = false;
      setState(() {
        audioCache.play(url);
        currentSong = url;
        print("isPlaying && currentSong != url");
        isPlaying = true;
        print(isPlaying);
        _lista[a]["status"]= true;
        ante = _lista;
        anterior = a;
      });

    } else if (isPlaying && currentSong == url) {
      _audioPlayer.pause();
      setState(() {
        print("isPlaying && currentSong == url");
        isPlaying = false;
        print(isPlaying);
        _lista[a]["status"]= false;
      });
    }else if(!isPlaying && currentSong == url){
      setState(() {
        _audioPlayer.resume();
        print("!isPlaying && currentSong == url");
        isPlaying = true;
        print(isPlaying);
        _lista[a]["status"]= true;
      });
    }else if(!isPlaying){
      setState(() {
        audioCache.play(url);
        print("!isPlaying");
        isPlaying = true;
        print(isPlaying);
        _lista[a]["status"]= true;
        btnIcon = Icons.stop;
        anterior = a;
        ante = _lista;
        print(a);
      });
    }

    _audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        musicDuration = event;
      });
    });

    _audioPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
        musicPosition = event;
      });
    });

    _audioPlayer.onPlayerCompletion.listen((event) {
      setState(() {
        for(int i=0;i<musicList.length;i++)
        {
          musicList[i]["status"] = false;
        }
        for(int i=0;i<prueba.length;i++)
        {
          prueba[i]["status"] = false;
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            _audioPlayer.stop();
            Navigator.of(context).pop();
          },
        ),
        title: Text("Signos Vitales"),
      ),
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                child: InkWell(
                  onTap: () {
                    if(widget.languaje == true){
                      playMusic("audio/quechua/"+prueba[0]["url"],0,prueba);
                    }else{
                      playMusic("audio/aymara/"+prueba[0]["url"],0,prueba);
                    }
                    setState(() {
                      currentTitle = prueba[0]["title"];
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff031D33),
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(width: 2,color: Colors.indigo),
                    ),
                    child: ListTile(
                      leading: prueba[0]["status"] ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                      title: Text(
                        prueba[0]["title"],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle:  prueba[0]["status"] ?Text("${musicPosition.inSeconds.remainder(60)}", style: TextStyle(color: Colors.amberAccent),): Text(""),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: musicList.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            if(widget.languaje == true){
                              playMusic("audio/quechua/"+musicList[index]["url"],index,musicList);
                            }else {
                              playMusic("audio/aymara/"+musicList[index]["url"],index,musicList);
                            }
                            setState(() {
                              currentTitle = musicList[index]["title"];
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xff085187),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: ListTile(
                              leading: musicList[index]["status"] ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                              title: Text(
                                musicList[index]["title"],
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              subtitle:  musicList[index]["status"] ?Text("${musicPosition.inSeconds.remainder(60)}", style: TextStyle(color: Colors.amberAccent),): Text(""),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void onTapBack(){
    Get.to(()=>ConsultationPage());
  }
}
