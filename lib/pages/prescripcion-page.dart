
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';


class PrescriptionPage extends StatefulWidget {
  const PrescriptionPage({Key? key, required this.language}) : super(key: key);

  final bool language;
  @override
  _PrescriptionPageState createState() => _PrescriptionPageState();
}

class _PrescriptionPageState extends State<PrescriptionPage> {

  List listaPres01 = [
    {
      "title": "Le escribiré cómo tiene que tomar esta medicina en el papelito",
      "url": "p_2.mp3",
      "status": false,
    },
    {
      "title": "De preferencia tome el medicamento una hora después de las comidas",
      "url": "p_3.mp3",
      "status": false,
    },
    {
      "title": "Tome este medicamento antes de comer",
      "url": "p_4.mp3",
      "status": false,
    },
  ];
  List listaPres02 = [
    {
      "title": "Tome esta pastilla",
      "url": "p_5.mp3",
      "status": false,
    },
    {
      "title": "Tome este jarabe",
      "url": "p_6.mp3",
      "status": false,
    },    
  ];
  List listaPres03 = [
    {
      "title": "Primero esta",
      "url": "p_8.mp3",
      "status": false,
    },
    {
      "title": "Luego esta",
      "url": "p_9.mp3",
      "status": false,
    },
    {
      "title": "Por último esta",
      "url": "p_10.mp3",
      "status": false,
    },
  ];

  List listaPres04 = [
    {
      "title": "De color rojo",
      "url": "p_11.mp3",
      "status": false,
    },
    {
      "title": "De color azul",
      "url": "p_12.mp3",
      "status": false,
    },
    {
      "title": "De color amarillo",
      "url": "p_13.mp3",
      "status": false,
    },
    {
      "title": "De color verde",
      "url": "p_14.mp3",
      "status": false,
    },
    {
      "title": "De color naranja",
      "url": "p_15.mp3",
      "status": false,
    },
    {
      "title": "De color blanco",
      "url": "p_16.mp3",
      "status": false,
    },
  ];
  List listaPres05 = [
    {
      "title": "Una cucharada",
      "url": "p_17.mp3",
      "status": false,
    },
    {
      "title": "Dos cucharadas",
      "url": "p_18.mp3",
      "status": false,
    },
    {
      "title": "Tres cucharadas",
      "url": "p_19.mp3",
      "status": false,
    },
    {
      "title": "Cuatro cucharadas",
      "url": "p_20.mp3",
      "status": false,
    },
  ];
  List listaPres06 = [
    {
      "title": "Al amanecer",
      "url": "p_21.mp3",
      "status": false,
    },
    {
      "title": "Al mediodía",
      "url": "p_22.mp3",
      "status": false,
    },
    {
      "title": "Al anochecer",
      "url": "p_23.mp3",
      "status": false,
    },
    {
      "title": "Al amanecer, al medio día y al anochecer",
      "url": "p_24.mp3",
      "status": false,
    },
    {
      "title": "Al amanecer y al anochecer",
      "url": "p_25.mp3",
      "status": false,
    },
    {
      "title": "Al amanecer y al mediodía",
      "url": "p_26.mp3",
      "status": false,
    },
  ];

  List listaCovid02 = [
    {
      "title": "Vamos a darle suplementos",
      "url": "p_27.mp3",

      "status": false,
    },
    {
      "title": "Por favor, no se olvide de tomar su medicina",
      "url": "p_28.mp3",
      "status": false,
    },
    {
      "title": "No se olvide de darle la papilla a su hijo",
      "url": "p_29.mp3",
      "status": false,
    },
    {
      "title": "Tome sus medicamentos a la hora indicada",
      "url": "p_30.mp3",
      "status": false,
    },
    {
      "title": "Si vuelve a presentar síntomas vuelva",
      "url": "p_32.mp3",
      "status": false,
    },
    {
      "title": "Le voy a enviar al hospital, puesto que ahí le trataran mucho mejor",
      "url": "p_33.mp3",
      "status": false,
    },
  ];


  List prueba = [
    {
      "title": "Le daré este medicamento",
      "url": "p_1.mp3",
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
        for(int i=0;i<listaPres01.length;i++)
        {
          listaPres01[i]["status"] = false;
        }
        for(int i=0;i<listaPres02.length;i++)
        {
          listaPres02[i]["status"] = false;
        }
        for(int i=0;i<listaPres03.length;i++)
        {
          listaPres03[i]["status"] = false;
        }
        for(int i=0;i<listaPres04.length;i++)
        {
          listaPres04[i]["status"] = false;
        }
        for(int i=0;i<listaPres05.length;i++)
        {
          listaPres05[i]["status"] = false;
        }
        for(int i=0;i<listaPres06.length;i++)
        {
          listaPres06[i]["status"] = false;
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
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            _audioPlayer.stop();
            Navigator.of(context).pop();
          },
        ),
        title: Text("Prescripción"),
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
                Text("INDICACIONES"),
                Container(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: listaPres01.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
                        child: InkWell(
                          onTap: () {
                            if(widget.language == true) {
                              playMusic("audio/quechua/"+listaPres01[index]["url"], index,listaPres01);
                            }else {
                              playMusic("audio/aymara/"+listaPres01[index]["url"], index,listaPres01);
                            }
                            setState(() {
                              currentTitle = listaPres01[index]["title"];
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xff085187),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: ListTile(
                              leading: listaPres01[index]["status"] ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                              title: Text(
                                listaPres01[index]["title"],
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              subtitle:  listaPres01[index]["status"] ?Text("${musicPosition.inSeconds.remainder(60)}", style: TextStyle(color: Colors.amberAccent),): Text(""),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                Text("MEDICINA"),
                Container(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: listaPres02.length,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
                      child: InkWell(
                        onTap: () {
                          if(widget.language == true) {
                            playMusic("audio/quechua/"+listaPres02[index]["url"], index,listaPres02);
                          }else {
                            playMusic("audio/aymara/"+listaPres02[index]["url"], index,listaPres02);
                          }
                          setState(() {
                            currentTitle = listaPres02[index]["title"];
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff085187),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: ListTile(
                            leading: listaPres02[index]["status"] ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                            title: Text(
                              listaPres02[index]["title"],
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            subtitle:  listaPres02[index]["status"] ?Text("${musicPosition.inSeconds.remainder(60)}", style: TextStyle(color: Colors.amberAccent),): Text(""),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Text("ORDEN DE CONSUMO"),
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
                      title: Text("Según este orden"),
                      onExpansionChanged: (bool charged){},
                      children:[
                        Container(
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: listaPres03.length,
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  if(widget.language == true){
                                    playMusic("audio/quechua/"+listaPres03[index]["url"],index,listaPres03);
                                  }else{
                                    playMusic("audio/aymara/"+listaPres03[index]["url"],index,listaPres03);
                                  }
                                  setState(() {
                                    currentTitle = listaPres03[index]["title"];
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xff085187),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: ListTile(
                                    leading: listaPres03[index]["status"] ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                                    title: Text(
                                      listaPres03[index]["title"],
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    subtitle:  listaPres03[index]["status"] ?Text("${musicPosition.inSeconds.remainder(60)}", style: TextStyle(color: Colors.amberAccent),): Text(""),
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
                Text("COLOR RELACIONADO AL MEDICAMENTO"),
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
                      title: Text("Color"),
                      onExpansionChanged: (bool charged){},
                      children:[
                        Container(
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: listaPres04.length,
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  if(widget.language == true){
                                    playMusic("audio/quechua/"+listaPres04[index]["url"],index,listaPres04);
                                  }else{
                                    playMusic("audio/aymara/"+listaPres04[index]["url"],index,listaPres04);
                                  }
                                  setState(() {
                                    currentTitle = listaPres04[index]["title"];
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xff085187),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: ListTile(
                                    leading: listaPres04[index]["status"] ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                                    title: Text(
                                      listaPres04[index]["title"],
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    subtitle:  listaPres04[index]["status"] ?Text("${musicPosition.inSeconds.remainder(60)}", style: TextStyle(color: Colors.amberAccent),): Text(""),
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
                Text("CANTIDAD DE CONSUMO"),
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
                      title: Text("Cantidad"),
                      onExpansionChanged: (bool charged){},
                      children:[
                        Container(
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: listaPres05.length,
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  if(widget.language == true){
                                    playMusic("audio/quechua/"+listaPres05[index]["url"],index,listaPres05);
                                  }else{
                                    playMusic("audio/aymara/"+listaPres05[index]["url"],index,listaPres05);
                                  }
                                  setState(() {
                                    currentTitle = listaPres05[index]["title"];
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xff085187),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: ListTile(
                                    leading: listaPres05[index]["status"] ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                                    title: Text(
                                      listaPres05[index]["title"],
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    subtitle:  listaPres05[index]["status"] ?Text("${musicPosition.inSeconds.remainder(60)}", style: TextStyle(color: Colors.amberAccent),): Text(""),
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
                Text("TIEMPO DE CONSUMO"),
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
                      title: Text("Tiempo"),
                      onExpansionChanged: (bool charged){},
                      children:[
                        Container(
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: listaPres06.length,
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  if(widget.language == true){
                                    playMusic("audio/quechua/"+listaPres06[index]["url"],index,listaPres06);
                                  }else{
                                    playMusic("audio/aymara/"+listaPres06[index]["url"],index,listaPres06);
                                  }
                                  setState(() {
                                    currentTitle = listaPres06[index]["title"];
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xff085187),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: ListTile(
                                    leading: listaPres06[index]["status"] ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                                    title: Text(
                                      listaPres06[index]["title"],
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    subtitle:  listaPres06[index]["status"] ?Text("${musicPosition.inSeconds.remainder(60)}", style: TextStyle(color: Colors.amberAccent),): Text(""),
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
                Text("RECOMENDACIONES"),
                Container(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: listaCovid02.length,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
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
                            color: Color(0xff085187),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: ListTile(
                            leading: listaCovid02[index]["status"] ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                            title: Text(
                              listaCovid02[index]["title"],
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            subtitle:  listaCovid02[index]["status"] ?Text("${musicPosition.inSeconds.remainder(60)}", style: TextStyle(color: Colors.amberAccent),): Text(""),
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
