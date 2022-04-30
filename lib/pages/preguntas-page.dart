import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'consultation-page.dart';


class PreguntasPage extends StatefulWidget {
  const PreguntasPage({Key? key, required this.language}) : super(key: key);

  final bool language;
  @override
  _PreguntasPageState createState() => _PreguntasPageState();
}

class _PreguntasPageState extends State<PreguntasPage> {

  List listPreg01 = [
    {
      "title": "¿Por qué motivo estás viniendo",
      "url": "ana_2.mp3",
      "status": false,
    },
    {
      "title": "¿Te duele algo?",
      "url": "ana_3.mp3",
      "status": false,
    },
    {
      "title": "¿Dónde te duele?",
      "url": "ana_4.mp3",
      "status": false,
    },
    {
      "title": "Señálame con tu dedo el lugar donde te duele",
      "url": "ana_5.mp3",
      "status": false,
    },
  ];
  List listPreg02 = [
    {
      "title": "¿Te arde?",
      "url": "ana_7.mp3",

      "status": false,
    },
    {
      "title": "¿Te quema?",
      "url": "ana_8.mp3",
      "status": false,
    },
    {
      "title": "¿Te punza?",
      "url": "ana_9.mp3",
      "status": false,
    },
    {
      "title": "¿Te retuerce?",
      "url": "ana_10.mp3",
      "status": false,
    },
  ];
  List listPreg03 = [
    {
      "title": "¿Te duele poco?",
      "url": "ana_12.mp3",

      "status": false,
    },
    {
      "title": "¿No te duele tanto?",
      "url": "ana_13.mp3",
      "status": false,
    },
    {
      "title": "¿Te duele mucho?",
      "url": "ana_14.mp3",
      "status": false,
    },
  ];
  List listPreg04 = [
    {
      "title": "¿Te duele por días?",
      "url": "ana_16.mp3",

      "status": false,
    },
    {
      "title": "¿Te duele por semanas?",
      "url": "ana_17.mp3",
      "status": false,
    },
    {
      "title": "¿Te duele por meses?",
      "url": "ana_18.mp3",
      "status": false,
    },
    {
      "title": "Indícame con tus dedos la cantidad",
      "url": "ana_19.mp3",
      "status": false,
    },
  ];
  List listPreg05 = [
    {
      "title": "¿Son como puré?",
      "url": "ana_21.mp3",

      "status": false,
    },
    {
      "title": "¿Son delgadas?",
      "url": "ana_22.mp3",
      "status": false,
    },
    {
      "title": "¿Son gruesas?",
      "url": "ana_23.mp3",
      "status": false,
    },
    {
      "title": "¿Son de color rojo?",
      "url": "ana_24.mp3",
      "status": false,
    },
    {
      "title": "¿Son de color blanco?",
      "url": "ana_25.mp3",
      "status": false,
    },
    {
      "title": "¿Son de color negro?",
      "url": "ana_26.mp3",
      "status": false,
    },
  ];
  List listPreg06 = [
    {
      "title": "¿Te sientes cansado?",
      "url": "ana_27.mp3",

      "status": false,
    },
    {
      "title": "¿Has tenido escalofríos?",
      "url": "ana_28.mp3",
      "status": false,
    },
    {
      "title": "¿Tienes tos seca o con flema?",
      "url": "ana_29.mp3",
      "status": false,
    },
    {
      "title": "¿Has tenido calentura en la noche o en el día?",
      "url": "ana_30.mp3",
      "status": false,
    },
    {
      "title": "¿Cuántas deposiciones líquidas has hecho durante el día?",
      "url": "ana_31.mp3",
      "status": false,
    },
    {
      "title": "Indícame con tus dedos la cantidad",
      "url": "ana_19.mp3",
      "status": false,
    },
    {
      "title": "¿Te da mareos?",
      "url": "ana_32.mp3",
      "status": false,
    },
    {
      "title": "¿Te da sueño luego de comer?",
      "url": "ana_33.mp3",
      "status": false,
    },
    {
      "title": "¿Comes rápido?",
      "url": "ana_34.mp3",
      "status": false,
    },
  ];
  List listPreg07 = [
    {
      "title": "¿Carnes?",
      "url": "ana_36.mp3",

      "status": false,
    },
    {
      "title": "¿Frutas?",
      "url": "ana_37.mp3",
      "status": false,
    },
    {
      "title": "¿Verduras?",
      "url": "ana_38.mp3",
      "status": false,
    },
    {
      "title": "¿Queso,leche,mantequilla?",
      "url": "ana_39.mp3",
      "status": false,
    },
    {
      "title": "¿Dulces?",
      "url": "ana_40.mp3",
      "status": false,
    },
    {
      "title": "¿Grasas?",
      "url": "ana_41.mp3",
      "status": false,
    },
  ];
  List listPreg08 = [
    {
      "title": "¿Mate?",
      "url": "ana_43.mp3",

      "status": false,
    },
    {
      "title": "¿Cerveza?",
      "url": "ana_44.mp3",
      "status": false,
    },
    {
      "title": "¿jugos?",
      "url": "ana_45.mp3",
      "status": false,
    },
    {
      "title": "¿agua?",
      "url": "ana_46.mp3",
      "status": false,
    },
  ];
  List listPreg09 = [
    {
      "title": "¿Te duele al orinar?",
      "url": "ana_47.mp3",

      "status": false,
    },
    {
      "title": "Me gustaría preguntarte ¿qué día es hoy?",
      "url": "ana_48.mp3",
      "status": false,
    },
    {
      "title": "¿Has hecho fuerza cargando cosas?",
      "url": "ana_49.mp3",
      "status": false,
    },
  ];

  List prueba = [
    {
      "title": "Si alignas de las siguientes preguntas coinciden con lo que sientes, mueve la cabeza",
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
        for(int i=0;i<listPreg01.length;i++)
        {
          listPreg01[i]["status"] = false;
        }
        for(int i=0;i<listPreg02.length;i++)
        {
          listPreg02[i]["status"] = false;
        }
        for(int i=0;i<listPreg03.length;i++)
        {
          listPreg03[i]["status"] = false;
        }
        for(int i=0;i<listPreg04.length;i++)
        {
          listPreg04[i]["status"] = false;
        }
        for(int i=0;i<listPreg05.length;i++)
        {
          listPreg05[i]["status"] = false;
        }
        for(int i=0;i<listPreg06.length;i++)
        {
          listPreg06[i]["status"] = false;
        }
        for(int i=0;i<listPreg07.length;i++)
        {
          listPreg07[i]["status"] = false;
        }
        for(int i=0;i<listPreg08.length;i++)
        {
          listPreg08[i]["status"] = false;
        }
        for(int i=0;i<listPreg09.length;i++)
        {
          listPreg09[i]["status"] = false;
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
        title: Text("Preguntas"),
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
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    alignment: Alignment.bottomLeft ,
                    child: Text("MOTIVO DE CONSULTA",
                    style: TextStyle(
                      fontSize: 16,
                    ),)
                  ),
                ),
                Container(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: listPreg01.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
                        child: InkWell(
                          onTap: () {
                            if(widget.language == true) {
                              playMusic("audio/quechua/"+listPreg01[index]["url"], index,listPreg01);
                            }else {
                              playMusic("audio/aymara/"+listPreg01[index]["url"], index,listPreg01);
                            }
                            setState(() {
                              currentTitle = listPreg01[index]["title"];
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xff085187),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: ListTile(
                              leading: listPreg01[index]["status"] ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                              title: Text(
                                listPreg01[index]["title"],
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              subtitle:  listPreg01[index]["status"] ?Text("${musicPosition.inSeconds.remainder(60)}", style: TextStyle(color: Colors.amberAccent),): Text(""),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Color(0xff085187),
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(width: 2,color: Colors.white),
                    ),

                    child: ExpansionTile(                    
                      title: Text("¿Cómo es el dolor?"),
                      onExpansionChanged: (bool charged){},
                      children:[
                        Container(
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: listPreg02.length,
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  if(widget.language == true){
                                    playMusic("audio/quechua/"+listPreg02[index]["url"],index,listPreg02);
                                  }else{
                                    playMusic("audio/aymara/"+listPreg02[index]["url"],index,listPreg02);
                                  }
                                  setState(() {
                                    currentTitle = listPreg02[index]["title"];
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xff085187),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: ListTile(
                                    leading: listPreg02[index]["status"] ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                                    title: Text(
                                      listPreg02[index]["title"],
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    subtitle:  listPreg02[index]["status"] ?Text("${musicPosition.inSeconds.remainder(60)}", style: TextStyle(color: Colors.amberAccent),): Text(""),
                                  ),
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
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Color(0xff085187),
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(width: 2,color: Colors.white),
                    ),

                    child: ExpansionTile(
                      title: Text("¿Qué tanto te duele?"),
                      onExpansionChanged: (bool charged){},
                      children:[
                        Container(
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: listPreg03.length,
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  if(widget.language == true){
                                    playMusic("audio/quechua/"+listPreg03[index]["url"],index,listPreg03);
                                  }else{
                                    playMusic("audio/aymara/"+listPreg03[index]["url"],index,listPreg03);
                                  }
                                  setState(() {
                                    currentTitle = listPreg03[index]["title"];
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xff085187),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: ListTile(
                                    leading: listPreg03[index]["status"] ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                                    title: Text(
                                      listPreg03[index]["title"],
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    subtitle:  listPreg03[index]["status"] ?Text("${musicPosition.inSeconds.remainder(60)}", style: TextStyle(color: Colors.amberAccent),): Text(""),
                                  ),
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
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Color(0xff085187),
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(width: 2,color: Colors.white),
                    ),

                    child: ExpansionTile(
                      title: Text("¿Desde hace cuánto?"),
                      onExpansionChanged: (bool charged){},
                      children:[
                        Container(
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: listPreg04.length,
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  if(widget.language == true){
                                    playMusic("audio/quechua/"+listPreg04[index]["url"],index,listPreg04);
                                  }else{
                                    playMusic("audio/aymara/"+listPreg04[index]["url"],index,listPreg04);
                                  }
                                  setState(() {
                                    currentTitle = listPreg04[index]["title"];
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xff085187),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: ListTile(
                                    leading: listPreg04[index]["status"] ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                                    title: Text(
                                      listPreg04[index]["title"],
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    subtitle:  listPreg04[index]["status"] ?Text("${musicPosition.inSeconds.remainder(60)}", style: TextStyle(color: Colors.amberAccent),): Text(""),
                                  ),
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
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Color(0xff085187),
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(width: 2,color: Colors.white),
                    ),

                    child: ExpansionTile(
                      title: Text("¿Cómo has hecho tus deposiciones?"),
                      onExpansionChanged: (bool charged){},
                      children:[
                        Container(
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: listPreg05.length,
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  if(widget.language == true){
                                    playMusic("audio/quechua/"+listPreg05[index]["url"],index,listPreg05);
                                  }else{
                                    playMusic("audio/aymara/"+listPreg05[index]["url"],index,listPreg05);
                                  }
                                  setState(() {
                                    currentTitle = listPreg05[index]["title"];
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xff085187),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: ListTile(
                                    leading: listPreg05[index]["status"] ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                                    title: Text(
                                      listPreg05[index]["title"],
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    subtitle:  listPreg05[index]["status"] ?Text("${musicPosition.inSeconds.remainder(60)}", style: TextStyle(color: Colors.amberAccent),): Text(""),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: listPreg06.length,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
                      child: InkWell(
                        onTap: () {
                          if(widget.language == true){
                            playMusic("audio/quechua/"+listPreg06[index]["url"],index,listPreg06);
                          }else{
                            playMusic("audio/aymara/"+listPreg06[index]["url"],index,listPreg06);
                          }
                          setState(() {
                            currentTitle = listPreg06[index]["title"];
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff085187),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: ListTile(
                            leading: listPreg06[index]["status"] ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                            title: Text(
                              listPreg06[index]["title"],
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            subtitle:  listPreg06[index]["status"] ?Text("${musicPosition.inSeconds.remainder(60)}", style: TextStyle(color: Colors.amberAccent),): Text(""),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Color(0xff085187),
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(width: 2,color: Colors.white),
                    ),

                    child: ExpansionTile(
                      title: Text("¿Qué has comido?"),
                      onExpansionChanged: (bool charged){},
                      children:[
                        Container(
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: listPreg07.length,
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  if(widget.language == true){
                                    playMusic("audio/quechua/"+listPreg07[index]["url"],index,listPreg07);
                                  }else{
                                    playMusic("audio/aymara/"+listPreg07[index]["url"],index,listPreg07);
                                  }
                                  setState(() {
                                    currentTitle = listPreg07[index]["title"];
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xff085187),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: ListTile(
                                    leading: listPreg07[index]["status"] ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                                    title: Text(
                                      listPreg07[index]["title"],
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    subtitle:  listPreg07[index]["status"] ?Text("${musicPosition.inSeconds.remainder(60)}", style: TextStyle(color: Colors.amberAccent),): Text(""),
                                  ),
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
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Color(0xff085187),
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(width: 2,color: Colors.white),
                    ),

                    child: ExpansionTile(
                      title: Text("¿Qué has tomado?"),
                      onExpansionChanged: (bool charged){},
                      children:[
                        Container(
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: listPreg08.length,
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  if(widget.language == true){
                                    playMusic("audio/quechua/"+listPreg08[index]["url"],index,listPreg08);
                                  }else{
                                    playMusic("audio/aymara/"+listPreg08[index]["url"],index,listPreg08);
                                  }
                                  setState(() {
                                    currentTitle = listPreg08[index]["title"];
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xff085187),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: ListTile(
                                    leading: listPreg08[index]["status"] ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                                    title: Text(
                                      listPreg08[index]["title"],
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    subtitle:  listPreg08[index]["status"] ?Text("${musicPosition.inSeconds.remainder(60)}", style: TextStyle(color: Colors.amberAccent),): Text(""),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: listPreg09.length,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
                      child: InkWell(
                        onTap: () {
                          if(widget.language == true){
                            playMusic("audio/quechua/"+listPreg09[index]["url"],index,listPreg09);
                          }else{
                            playMusic("audio/aymara/"+listPreg09[index]["url"],index,listPreg09);
                          }
                          setState(() {
                            currentTitle = listPreg09[index]["title"];
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff085187),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: ListTile(
                            leading: listPreg09[index]["status"] ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                            title: Text(
                              listPreg09[index]["title"],
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            subtitle:  listPreg09[index]["status"] ?Text("${musicPosition.inSeconds.remainder(60)}", style: TextStyle(color: Colors.amberAccent),): Text(""),
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
