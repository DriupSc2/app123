import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';



class DiagnosticoPage extends StatefulWidget {
  const DiagnosticoPage({Key? key, required this.language}) : super(key: key);

  final bool language;
  @override
  _DiagnosticoPageState createState() => _DiagnosticoPageState();
}

class _DiagnosticoPageState extends State<DiagnosticoPage> {

  List listDiag01 = [
    {
      "title": "¿Rinofaringitis?",
      "url": "d_2.mp3",
      "status": false,
    },
    {
      "title": "Amigdalitis",
      "url": "d_3.mp3",
      "status": false,
    },
    {
      "title": "Bronquitis",
      "url": "d_4.mp3",
      "status": false,
    },
    {
      "title": "Faringitis",
      "url": "d_5.mp3",
      "status": false,
    },
    {
      "title": "Neumonia",
      "url": "d_6.mp3",
      "status": false,
    },
  ];
  List listDiag02 = [
    {
      "title": "¿Gastritis?",
      "url": "d_7.mp3",
      "status": false,
    },
    {
      "title": "Enfermedad diarreica",
      "url": "d_8.mp3",
      "status": false,
    },
    {
      "title": "Cólicos",
      "url": "d_9.mp3",
      "status": false,
    },
    {
      "title": "Enfermedad diarreica aguda",
      "url": "d_10.mp3",
      "status": false,
    },
  ];

  List listDiag03 = [
    {
      "title": "Anemia ligera",
      "url": "d_11.mp3",
      "status": false,
    },
    {
      "title": "Anemia moderada",
      "url": "d_12.mp3",
      "status": false,
    },
    {
      "title": "Anemia severa",
      "url": "da_13.mp3",
      "status": false,
    },
  ];
  List listDiag04 = [
    {
      "title": "Lumbalgia simple",
      "url": "d_14.mp3",
      "status": false,
    },
    {
      "title": "Lumbalgia aguda",
      "url": "d_15.mp3",
      "status": false,
    },
  ];
  List listDiag05 = [
    {
      "title": "Alergias",
      "url": "d_17.mp3",
      "status": false,
    },
    {
      "title": "Higiene",
      "url": "d_18.mp3",
      "status": false,
    },
    {
      "title": "Contagio",
      "url": "d_19.mp3",
      "status": false,
    },
    {
      "title": "Estas comiendo mucha grasa",
      "url": "d_20.mp3",
      "status": false,
    },
    {
      "title": "No estás comiendo a la hora",
      "url": "d_21.mp3",
      "status": false,
    },
    {
      "title": "Estás comiendo comidas muy condimentadas",
      "url": "d_22.mp3",
      "status": false,
    },
    {
      "title": "Comiste comida sin lavarla antes",
      "url": "d_23.mp3",
      "status": false,
    },
    {
      "title": "No te estás alimentando bien",
      "url": "d_24.mp3",
      "status": false,
    },
    {
      "title": "Asociada a otra enfermedad",
      "url": "d_25.mp3",
      "status": false,
    },
    {
      "title": "Infecciones",
      "url": "d_26.mp3",
      "status": false,
    },
    {
      "title": "Trabajar mucho en la chacra",
      "url": "d_27.mp3",
      "status": false,
    },
    {
      "title": "Cargaste mucho peso",
      "url": "d_28.mp3",
      "status": false,
    },
  ];
  List listaDiagnostico = [
    {
      "title": "No se preocupe, no es grave, pero escucha estas indicaciones",
      "url": "d_29.mp3",

      "status": false,
    },
    {
      "title": "Debe cuidarse",
      "url": "d_30.mp3",
      "status": false,
    },
    {
      "title": "Coma mejor",
      "url": "d_31.mp3",
      "status": false,
    },
    {
      "title": "Abríguese bien",
      "url": "d_32.mp3",
      "status": false,
    },
    {
      "title": "No coma cosas sin lavar",
      "url": "d_33.mp3",
      "status": false,
    },
    {
      "title": "Debe tomar bastante agua",
      "url": "d_34.mp3",

      "status": false,
    },
    {
      "title": "Trate de no hablar ni gritar",
      "url": "d_35.mp3",
      "status": false,
    },
    {
      "title": "Tome bebidas tibias",
      "url": "d_36.mp3",
      "status": false,
    },
    {
      "title": "No debe comer muchos condimentos ni picantes",
      "url": "d_37.mp3",
      "status": false,
    },
    {
      "title": "Guarde reposo el mayor tiempo que pueda",
      "url": "d_38.mp3",
      "status": false,
    },
  ];


  List prueba = [
    {
      "title": "Usted tiene:",
      "url": "d_1.mp3",
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
        for(int i=0;i<listaDiagnostico.length;i++)
        {
          listaDiagnostico[i]["status"] = false;
        }
        for(int i=0;i<listDiag01.length;i++)
        {
          listDiag01[i]["status"] = false;
        }
        for(int i=0;i<listDiag02.length;i++)
        {
          listDiag02[i]["status"] = false;
        }
        for(int i=0;i<listDiag03.length;i++)
        {
          listDiag01[i]["status"] = false;
        }
        for(int i=0;i<listDiag04.length;i++)
        {
          listDiag04[i]["status"] = false;
        }
        for(int i=0;i<listDiag05.length;i++)
        {
          listDiag05[i]["status"] = false;
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
        title: Text("Diagnostico"),
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
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle:  prueba[0]["status"] ?Text("${musicPosition.inSeconds.remainder(60)}", style: TextStyle(color: Colors.amberAccent),): Text(""),
                      ),
                    ),
                  ),
                ),
                Text("TIPO DE ENFERMEDAD"),
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
                      title: Text("Infección Respiratoria Aguda"),
                      onExpansionChanged: (bool charged){},
                      children:[
                        Container(
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: listDiag01.length,
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  if(widget.language == true){
                                    playMusic("audio/quechua/"+listDiag01[index]["url"],index,listDiag01);
                                  }else{
                                    playMusic("audio/aymara/"+listDiag01[index]["url"],index,listDiag01);
                                  }
                                  setState(() {
                                    currentTitle = listDiag01[index]["title"];
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xff085187),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: ListTile(
                                    leading: listDiag01[index]["status"] ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                                    title: Text(
                                      listDiag01[index]["title"],
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    subtitle:  listDiag01[index]["status"] ?Text("${musicPosition.inSeconds.remainder(60)}", style: TextStyle(color: Colors.amberAccent),): Text(""),
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
                      title: Text("Enfermedades del sistema digestivo"),
                      onExpansionChanged: (bool charged){},
                      children:[
                        Container(
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: listDiag02.length,
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  if(widget.language == true){
                                    playMusic("audio/quechua/"+listDiag02[index]["url"],index,listDiag02);
                                  }else{
                                    playMusic("audio/aymara/"+listDiag02[index]["url"],index,listDiag02);
                                  }
                                  setState(() {
                                    currentTitle = listDiag02[index]["title"];
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xff085187),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: ListTile(
                                    leading: listDiag02[index]["status"] ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                                    title: Text(
                                      listDiag02[index]["title"],
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    subtitle:  listDiag02[index]["status"] ?Text("${musicPosition.inSeconds.remainder(60)}", style: TextStyle(color: Colors.amberAccent),): Text(""),
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
                      title: Text("Enfermedades Hematológicas"),
                      onExpansionChanged: (bool charged){},
                      children:[
                        Container(
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: listDiag03.length,
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  if(widget.language == true){
                                    playMusic("audio/quechua/"+listDiag03[index]["url"],index,listDiag03);
                                  }else{
                                    playMusic("audio/aymara/"+listDiag03[index]["url"],index,listDiag03);
                                  }
                                  setState(() {
                                    currentTitle = listDiag03[index]["title"];
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xff085187),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: ListTile(
                                    leading: listDiag03[index]["status"] ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                                    title: Text(
                                      listDiag03[index]["title"],
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    subtitle:  listDiag03[index]["status"] ?Text("${musicPosition.inSeconds.remainder(60)}", style: TextStyle(color: Colors.amberAccent),): Text(""),
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
                      title: Text("Dolores Musculares"),
                      onExpansionChanged: (bool charged){},
                      children:[
                        Container(
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: listDiag04.length,
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  if(widget.language == true){
                                    playMusic("audio/quechua/"+listDiag04[index]["url"],index,listDiag04);
                                  }else{
                                    playMusic("audio/aymara/"+listDiag04[index]["url"],index,listDiag04);
                                  }
                                  setState(() {
                                    currentTitle = listDiag04[index]["title"];
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xff085187),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: ListTile(
                                    leading: listDiag04[index]["status"] ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                                    title: Text(
                                      listDiag04[index]["title"],
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    subtitle:  listDiag04[index]["status"] ?Text("${musicPosition.inSeconds.remainder(60)}", style: TextStyle(color: Colors.amberAccent),): Text(""),
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
                Text("MOTIVO DE ENFERMEDAD"),
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
                      title: Text("Debido a:"),
                      onExpansionChanged: (bool charged){},
                      children:[
                        Container(
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: listDiag05.length,
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  if(widget.language == true){
                                    playMusic("audio/quechua/"+listDiag05[index]["url"],index,listDiag05);
                                  }else{
                                    playMusic("audio/aymara/"+listDiag05[index]["url"],index,listDiag05);
                                  }
                                  setState(() {
                                    currentTitle = listDiag05[index]["title"];
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xff085187),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: ListTile(
                                    leading: listDiag05[index]["status"] ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                                    title: Text(
                                      listDiag05[index]["title"],
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    subtitle:  listDiag05[index]["status"] ?Text("${musicPosition.inSeconds.remainder(60)}", style: TextStyle(color: Colors.amberAccent),): Text(""),
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
                Text("INDICACIONES"),
                Container(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: listaDiagnostico.length,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
                      child: InkWell(
                        onTap: () {
                          if(widget.language == true){
                            playMusic("audio/quechua/"+listaDiagnostico[index]["url"],index,listaDiagnostico);
                          }else{
                            playMusic("audio/aymara/"+listaDiagnostico[index]["url"],index,listaDiagnostico);
                          }
                          setState(() {
                            currentTitle = listaDiagnostico[index]["title"];
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff085187),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: ListTile(
                            leading: listaDiagnostico[index]["status"] ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                            title: Text(
                              listaDiagnostico[index]["title"],
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            subtitle:  listaDiagnostico[index]["status"] ?Text("${musicPosition.inSeconds.remainder(60)}", style: TextStyle(color: Colors.amberAccent),): Text(""),
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
