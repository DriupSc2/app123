
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';



class AntecedentesPage extends StatefulWidget {
  const AntecedentesPage({Key? key, required this.language}) : super(key: key);

  final bool language;
  @override
  _AntecedentesPageState createState() => _AntecedentesPageState();
}

class _AntecedentesPageState extends State<AntecedentesPage> {

  List listAntecedentes01 = [
    {
      "title": "¿Bebes alcohol con regularidad?",
      "url": "a_1.mp3",
      "status": false,
    },
    {
      "title": "¿Fumas con regularidad?",
      "url": "a_2.mp3",
      "status": false,
    },
    {
      "title": "¿Practicas algún deporte?",
      "url": "a_3.mp3",
      "status": false,
    },
    {
      "title": "¿De qué tipo es tu vivienda?",
      "url": "a_4.mp3",
      "status": false,
    },
    {
      "title": "¿Te sientes bien cuando despiertas?",
      "url": "a_5.mp3",
      "status": false,
    },
  ];
  List listAntecedentes02 = [
    {
      "title": "¿Te operaron anteriormente?",
      "url": "a_6.mp3",
      "status": false,
    },
    {
      "title": "Señálame con tu dedo el lugar donde te operaron",
      "url": "a_7.mp3",
      "status": false,
    },
    {
      "title": "¿Tuviste alguna hospitalización reciente?",
      "url": "a_8.mp3",
      "status": false,
    },
    {
      "title": "¿Tuviste alguna transfusión sanguínea?",
      "url": "a_9.mp3",
      "status": false,
    },
    {
      "title": "¿Eres alérgico a algún medicamento?",
      "url": "a_10.mp3",
      "status": false,
    },
    {
      "title": "¿Alguno de tus familiares ha tenido lo que tienes?",
      "url": "a_11.mp3",
      "status": false,
    },
    {
      "title": "¿Tus hermanos viven?",
      "url": "a_12.mp3",
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
  List ante=[];

  String currentTitle = "";
  String currentSong = "";
  String inicio = "";
  String end = "";
  IconData btnIcon = Icons.play_arrow;
  late AudioCache audioCache;

  final AudioPlayer _audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
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
        for(int i=0;i<listAntecedentes01.length;i++)
        {
          listAntecedentes01[i]["status"] = false;
        }
        for(int i=0;i<listAntecedentes02.length;i++)
        {
          listAntecedentes02[i]["status"] = false;
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
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            _audioPlayer.stop();
            Navigator.of(context).pop();
          },
        ),
        title: Text("Antecedentes"),
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
                Text("ANTECEDENTES NO PATOLÓGICOS"),
                Container(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: listAntecedentes01.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
                        child: InkWell(
                          onTap: () {
                            if(widget.language == true){
                              playMusic("audio/quechua/"+listAntecedentes01[index]["url"],index,listAntecedentes01);
                            }else{
                              playMusic("audio/aymara/"+listAntecedentes01[index]["url"],index,listAntecedentes01);
                            }

                            setState(() {
                              currentTitle = listAntecedentes01[index]["title"];
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xff085187),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: ListTile(
                              leading: listAntecedentes01[index]["status"] ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                              title: Text(
                                listAntecedentes01[index]["title"],
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              subtitle:  listAntecedentes01[index]["status"] ?Text("${musicPosition.inSeconds.remainder(60)}", style: TextStyle(color: Colors.amberAccent),): Text(""),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                Text("ANTECEDENTES PATOLÓGICOS"),
                Container(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: listAntecedentes02.length,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
                      child: InkWell(
                        onTap: () {
                          if(widget.language == true){
                            playMusic("audio/quechua/"+listAntecedentes02[index]["url"],index,listAntecedentes02);
                          }else{
                            playMusic("audio/aymara/"+listAntecedentes02[index]["url"],index,listAntecedentes02);
                          }                          setState(() {
                            currentTitle = listAntecedentes02[index]["title"];
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff085187),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: ListTile(
                            leading: listAntecedentes02[index]["status"] ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                            title: Text(
                              listAntecedentes02[index]["title"],
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            subtitle:  listAntecedentes02[index]["status"] ?Text("${musicPosition.inSeconds.remainder(60)}", style: TextStyle(color: Colors.amberAccent),): Text(""),
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
