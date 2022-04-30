import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key? key, required this.language}) : super(key: key);

  final bool language;
  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  List list = [
    {
      "title": "¿Cuál es su nombre?",
      "url":"da_10.mp3",
      "status": false,
    },
    {
      "title": "¿Cuál es su edad?",
      "url":"da_11.mp3",
      "status": false,
    },
    {
      "title": "¿De qué religión es usted ?",
      "url":"da_12.mp3",
      "status": false,
    },
    {
      "title": "¿Tienes tu DNI?",
      "url":"da_13.mp3",
      "status": false,
    },
    {
      "title": "¿Podrías mostrarme tu DNI?",
      "url":"da_14.mp3",
      "status": false,
    },
    {
      "title": "¿Tienes SIS?",
      "url":"da_15.mp3",
      "status": false,
    },
  ];
  List infoList = [
    {
      "title": "Si algunas de las siguientes preguntas coinciden con lo que sientes, mueve la cabeza",
      "url":"ana_1.mp3",
      "status": false,
    },
  ];
  List saludoList = [
    {
      "title": "Buenos días",
      "url":"da_1.mp3",
      "status": false,
    },
    {
      "title": "Buenas tardes",
      "url":"da_2.mp3",
      "status": false,
    },
    {
      "title": "Buenas noches",
      "url":"da_3.mp3",
      "status": false,
    },
  ];
  List saludoPersona = [
    {
      "title": "Señor",
      "url":"da_4.mp3",
      "status": false,
    },
    {
      "title": "Señora",
      "url":"da_5.mp3",
      "status": false,
    },
    {
      "title": "Joven",
      "url":"da_6.mp3",
      "status": false,
    },
    {
      "title": "Señorita",
      "url":"da_7.mp3",
      "status": false,
    },
    {
      "title": "Papito",
      "url":"da_8.mp3",
      "status": false,
    },
    {
      "title": "Mamita",
      "url":"da_9.mp3",
      "status": false,
    },
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
      setState(() {
        _audioPlayer.pause();
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
        for(int i=0;i<list.length;i++)
        {
          list[i]["status"] = false;
        }
        for(int i=0;i<saludoList.length;i++)
        {
          saludoList[i]["status"] = false;
        }
        for(int i=0;i<saludoPersona.length;i++)
        {
          saludoPersona[i]["status"] = false;
        }
        for(int i=0;i<infoList.length;i++)
        {
          infoList[i]["status"] = false;
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
        title: const Text("INTRODUCCION"),
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
                        playMusic("audio/quechua/"+infoList[0]["url"],0,infoList);
                      }else{
                        playMusic("audio/aymara/"+infoList[0]["url"],0,infoList);
                      }
                      setState(() {
                        currentTitle = infoList[0]["title"];
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff031D33),
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(width: 2,color: Colors.indigo),
                      ),
                      child: ListTile(
                        leading: infoList[0]["status"] ? const Icon(Icons.pause) : infoList[0]["status"] ? const Icon(Icons.play_arrow) : const Icon(Icons.play_arrow),
                        title: Text(
                          infoList[0]["title"],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle:  infoList[0]["status"] ?Text("${musicPosition.inSeconds.remainder(60)}", style: TextStyle(color: Colors.amberAccent),): Text(""),
                      ),
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(8.0)),
                const Text("TIPO DE SALUDO"),
                const Padding(padding: EdgeInsets.all(8.0)),
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
                      title: const Text("Saludo / Dias"),
                      onExpansionChanged: (bool charged){},
                      children:[
                        ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: saludoList.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                if(widget.language == true){
                                  playMusic("audio/quechua/"+saludoList[index]["url"],index,saludoList);
                                }else{
                                  playMusic("audio/aymara/"+saludoList[index]["url"],index,saludoList);
                                }
                                setState(() {
                                  currentTitle = saludoList[index]["title"];
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xff085187),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: ListTile(
                                  leading: saludoList[index]["status"] ? const Icon(Icons.pause) : saludoList[index]["status"] ? const Icon(Icons.play_arrow) : const Icon(Icons.play_arrow),
                                  title: Text(
                                    saludoList[index]["title"],
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  subtitle:  saludoList[index]["status"] ?Text("${musicPosition.inSeconds.remainder(60)}", style: TextStyle(color: Colors.amberAccent),): Text(""),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
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
                      title: const Text("Saludo / Persona"),
                      onExpansionChanged: (bool charged){},
                      children:[
                        ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: saludoPersona.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                if(widget.language == true){
                                  playMusic("audio/quechua/"+saludoPersona[index]["url"],index,saludoPersona);
                                }else{
                                  playMusic("audio/aymara/"+saludoPersona[index]["url"],index,saludoPersona);
                                }
                                setState(() {
                                  currentTitle = saludoPersona[index]["title"];
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xff085187),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: ListTile(
                                  leading: saludoPersona[index]["status"] ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                                  title: Text(
                                    saludoPersona[index]["title"],
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  subtitle:  saludoPersona[index]["status"] ?Text("${musicPosition.inSeconds.remainder(60)}", style: TextStyle(color: Colors.amberAccent),): Text(""),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(8.0)),
                const Text("DATOS DEL PACIENTE"),
                const Padding(padding: EdgeInsets.all(8.0)),
                ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
                    child: InkWell(
                      onTap: () {
                        if(widget.language == true){
                          playMusic("audio/quechua/"+list[index]["url"],index, list);
                        }else{
                          playMusic("audio/aymara/"+list[index]["url"],index, list);
                        }
                        setState(() {
                          currentTitle = list[index]["title"];
                        });
                      },
                      child: Container(
                        height: 80,
                        width: 100,
                        decoration: BoxDecoration(
                          color: const Color(0xff085187),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: ListTile(
                          leading: list[index]["status"] ? const Icon(Icons.pause) : const Icon(Icons.play_arrow),
                          title: Text(
                            list[index]["title"],
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          subtitle:  list[index]["status"] ?Text("${musicPosition.inSeconds.remainder(60)}", style: const TextStyle(color: Colors.amberAccent),): const Text(""),
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
}