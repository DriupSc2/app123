
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'consultation-page.dart';


class IndicacionesPage extends StatefulWidget {
  const IndicacionesPage({Key? key, required this.language}) : super(key: key);

  final bool language;
  @override
  _IndicacionesPageState createState() => _IndicacionesPageState();
}

class _IndicacionesPageState extends State<IndicacionesPage> {

  List listaCovid01 = [
    {
      "title": "¿Podrías mostrarme tu DNI?",
      "url": "da_14.mp3",
      "status": false,
    },
    {
      "title": "Ahora voy a verlo",
      "url": "ef_1.mp3",
      "status": false,
    },
    {
      "title": "No tenga miedo",
      "url": "ef_2.mp3",
      "status": false,
    },
    {
      "title": "Voy a llamar a mi técnico",
      "url": "sv_6.mp3",
      "status": false,
    },
    {
      "title": "Acuéstese en la camilla para examinarlo",
      "url": "ef_3.mp3",
      "status": false,
    },
    {
      "title": "Tome asiento y vístase nuevamente",
      "url": "ef_18.mp3",
      "status": false,
    },
    {
      "title": "Guarde reposo el mayor tiempo que pueda",
      "url": "d_38.mp3",
      "status": false,
    },
    {
      "title": "No se preocupe, no es grave, pero escucha estas indicaciones",
      "url": "d_29.mp3",
      "status": false,
    },
    {
      "title": "Por favor, no se olvide de tomar su medicina",
      "url": "p_28.mp3",
      "status": false,
    },
    {
      "title": "Le voy a enviar al hospital, puesto que ahí le trataran mucho mejor",
      "url": "p_33.mp3",
      "status": false,
    },
    {
      "title": "Si vuelve a presentar síntomas vuelva",
      "url": "p_32.mp3",
      "status": false,
    },
  ];


  int anterior=0;
  List ante =[];

  String currentTitle = "";
  String currentSong = "";
  IconData btnIcon = Icons.play_arrow;
  late AudioCache audioCache;

  final AudioPlayer _audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  bool isPlaying = false;
  Duration musicDuration = const Duration();
  Duration musicPosition = const Duration();

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
        isPlaying = true;
        _lista[a]["status"]= true;
        ante = _lista;
        anterior = a;
      });

    } else if (isPlaying && currentSong == url) {
      _audioPlayer.pause();
      setState(() {
        isPlaying = false;
        _lista[a]["status"]= false;
      });
    }else if(!isPlaying && currentSong == url){
      setState(() {
        _audioPlayer.resume();
        isPlaying = true;
        _lista[a]["status"]= true;
      });
    }else if(!isPlaying){
      setState(() {
        audioCache.play(url);
        isPlaying = true;
        _lista[a]["status"]= true;
        btnIcon = Icons.stop;
        anterior = a;
        ante = _lista;
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
        for(int i=0;i<listaCovid01.length;i++)
        {
            listaCovid01[i]["status"] = false;
        }
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            _audioPlayer.stop();
            Navigator.of(context).pop();
          },
        ),
        title: const Text("Indicaciones rapidas"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: listaCovid01.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
                  child: InkWell(
                    onTap: () {
                      if(widget.language == true) {
                        playMusic("audio/quechua/"+listaCovid01[index]["url"], index,listaCovid01);
                      }else {
                        playMusic("audio/aymara/"+listaCovid01[index]["url"], index,listaCovid01);
                      }
                      setState(() {
                        currentTitle = listaCovid01[index]["title"];
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff085187),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: ListTile(
                        leading: listaCovid01[index]["status"] ? const Icon(Icons.pause) : const Icon(Icons.play_arrow),
                        title: Text(
                          listaCovid01[index]["title"],
                          style: const TextStyle(
                            color: Colors.white,
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
    Get.to(()=>const ConsultationPage());
  }
}
