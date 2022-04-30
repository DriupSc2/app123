
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'consultation-page.dart';


class CovidPage extends StatefulWidget {
  const CovidPage({Key? key, required this.language}) : super(key: key);

  final bool language;
  @override
  _CovidPageState createState() => _CovidPageState();
}

class _CovidPageState extends State<CovidPage> {

  List listaCovid01 = [
    {
      "title": "¿Usted. se ha hecho vacunar?",
      "url": "ac_1.mp3",
      "status": false,
    },
    {
      "title": "¿Me puede mostrar su carnet de vacunación?",
      "url": "ac_2.mp3",
      "status": false,
    },
    {
      "title": "¿Cuántas dosis?",
      "url": "ac_3.mp3",
      "status": false,
    },
    {
      "title": "Dime con tus dedos la cantidad",
      "url": "ac_4.mp3",
      "status": false,
    },
  ];
  List listaCovid02 = [
    {
      "title": "¿Desea que le apliquemos la vacuna en estos momentos?",
      "url": "ac_9.mp3",

      "status": false,
    },
    {
      "title": "No comparta cosas que usa para comer o asearse",
      "url": "ac_10.mp3",
      "status": false,
    },
    {
      "title": "Mantenga la distancia con familiares cercanos",
      "url": "ac_11.mp3",
      "status": false,
    },
    {
      "title": "¿Conoce a alguien que tenga covid?",
      "url": "ac_12.mp3",
      "status": false,
    },
  ];

  List listCovid = [
    {
      "title": "¿Hace días?",
      "url": "ac_6.mp3",
      "status": false,
    },
    {
      "title": "¿Hace semanas?",
      "url": "ac_7.mp3",
      "status": false,
    },
    {
      "title": "¿Hace meses?",
      "url": "ac_8.mp3",
      "status": false,
    },
  ];

  List prueba = [
    {
      "title": "Si algunas de las siguientes preguntas coinciden con lo que sientes, mueve la cabeza",
      "url": "ana_1.mp3",
      "status": false,
    }
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
        for(int i=0;i<listCovid.length;i++)
        {
          listCovid[i]["status"] = false;
        }
        for(int i=0;i<listaCovid01.length;i++)
        {
          listaCovid01[i]["status"] = false;
        }
        for(int i=0;i<listaCovid02.length;i++)
        {
          listaCovid02[i]["status"] = false;
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            _audioPlayer.stop();
            Navigator.of(context).pop();
          },
        ),
        title: const Text("COVID - 19"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                child: InkWell(
                  onTap: () {
                    if(widget.language == true){
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
                      color: const Color(0xff031D33),
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(width: 2,color: Colors.indigo),
                    ),
                    child: ListTile(
                      leading: prueba[0]["status"] ? const Icon(Icons.pause) : const Icon(Icons.play_arrow),
                      title: Text(
                        prueba[0]["title"],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle:  prueba[0]["status"] ?Text("${musicPosition.inSeconds.remainder(60)}", style: const TextStyle(color: Colors.amberAccent),): const Text(""),
                    ),
                  ),
                ),
              ),
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
                        subtitle:  listaCovid01[index]["status"] ?Text("${musicPosition.inSeconds.remainder(60)}", style: const TextStyle(color: Colors.amberAccent),): const Text(""),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: const Color(0xff085187),
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(width: 2,color: Colors.white),
                  ),

                  child: ExpansionTile(
                    title: const Text("¿Cuándo se ha hecho vacunar?"),
                    onExpansionChanged: (bool charged){},
                    children:[
                      ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: listCovid.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              if(widget.language == true){
                                playMusic("audio/quechua/"+listCovid[index]["url"],index,listCovid);
                              }else{
                                playMusic("audio/aymara/"+listCovid[index]["url"],index,listCovid);
                              }
                              setState(() {
                                currentTitle = listCovid[index]["title"];
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xff085187),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: ListTile(
                                leading: listCovid[index]["status"] ? const Icon(Icons.pause) : const Icon(Icons.play_arrow),
                                title: Text(
                                  listCovid[index]["title"],
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                subtitle:  listCovid[index]["status"] ?Text("${musicPosition.inSeconds.remainder(60)}", style: const TextStyle(color: Colors.amberAccent),): const Text(""),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: listaCovid02.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
                  child: InkWell(
                    onTap: () {
                      if(widget.language == true){
                        playMusic("audio/quechua/"+listaCovid02[index]["url"],index,listaCovid02);
                      }else{
                        playMusic("audio/aymara/"+listaCovid02[index]["url"],index,listaCovid02);
                      }
                      setState(() {
                        currentTitle = listaCovid02[index]["title"];
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff085187),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: ListTile(
                        leading: listaCovid02[index]["status"] ? const Icon(Icons.pause) : const Icon(Icons.play_arrow),
                        title: Text(
                          listaCovid02[index]["title"],
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        subtitle:  listaCovid02[index]["status"] ?Text("${musicPosition.inSeconds.remainder(60)}", style: const TextStyle(color: Colors.amberAccent),): const Text(""),
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
