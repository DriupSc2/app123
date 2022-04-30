
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class RevisionFisicaPage extends StatefulWidget {
  const RevisionFisicaPage({Key? key, required this.language}) : super(key: key);

  final bool language;
  @override
  _RevisionFisicaPageState createState() => _RevisionFisicaPageState();
}

class _RevisionFisicaPageState extends State<RevisionFisicaPage> {

  List musicList = [
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
      "title": "Acuéstese en la camilla para examinarlo",
      "url": "ef_3.mp3",
      "status": false,
    },
    {
      "title": "Podría desabrocharse la correa.",
      "url": "ef_4.mp3",
      "status": false,
    },
    {
      "title": "Podría desabrocharse la faja.",
      "url": "ef_5.mp3",
      "status": false,
    },
    {
      "title": "Retírate tu camisa o chompa para examinarte",
      "url": "ef_6.mp3",
      "status": false,
    },
    {
      "title": "Inhale, exhale(tome profundo aire y bótelo despacio)",
      "url": "ef_7.mp3",
      "status": false,
    },
    {
      "title": "Relájese, no ponga duro el músculo",
      "url": "ef_8.mp3",
      "status": false,
    },
    {
      "title": "Doble y mueva el cuello",
      "url": "ef_9.mp3",
      "status": false,
    },
    {
      "title": "¿Siente dolor al pasar saliva o alimentos, ardor o punza?",
      "url": "ef_10.mp3",
      "status": false,
    },
    {
      "title": "¿Su religión le permite hacerse transfusiones sanguíneas?",
      "url": "ef_11.mp3",
      "status": false,
    },
    {
      "title": "Tosa y respire varias veces",
      "url": "ef_12.mp3",
      "status": false,
    },
    {
      "title": "Usare el estetoscopio para revisarle",
      "url": "ef_13.mp3",
      "status": false,
    },
    {
      "title": "Le vamos a hacer un examen de sangre",
      "url": "ef_14.mp3",
      "status": false,
    },
    {
      "title": "Retírese la mascarilla",
      "url": "ef_15.mp3",
      "status": false,
    },
    {
      "title": "Ponte tu bata",
      "url": "ef_16.mp3",
      "status": false,
    },
    {
      "title": "Tome aire y bótelo profundamente",
      "url": "ef_17.mp3",
      "status": false,
    },
    {
      "title": "Tome asiento y vístase nuevamente",
      "url": "ef_18.mp3",
      "status": false,
    },
    {
      "title": "¿Si te toco esta parte te duele?",
      "url": "ef_19.mp3",
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
        title: Text("Revision fisica"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
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
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle:  prueba[0]["status"] ?Text("${musicPosition.inSeconds.remainder(60)}", style: TextStyle(color: Colors.amberAccent),): Text(""),
                      ),
                    ),
                  ),
                ),
                Container(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: musicList.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
                        child: InkWell(
                          onTap: () {
                            if(widget.language == true){
                              playMusic("audio/quechua/"+musicList[index]["url"],index,musicList);
                            }else{
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
