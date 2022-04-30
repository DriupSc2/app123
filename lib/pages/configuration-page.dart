import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:killa/pages/consultation-page.dart';
import 'package:killa/pages/help-page.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({Key? key}) : super(key: key);

  @override
  _ConfigurationPageState createState() => _ConfigurationPageState();
}
enum Idiomas{Aymara, Quechua}
class _ConfigurationPageState extends State<ConfigurationPage> {
  Idiomas? _idiomas = getLanguage()?Idiomas.Quechua:Idiomas.Aymara;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ajustes")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget> [

              const Padding(padding: EdgeInsets.all(10.0)),
              Container(
                alignment: Alignment.bottomLeft,
                child: const SizedBox(
                    child: Text("Idioma", style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),


              ListTile(
                title: const Text('Quechua',style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),),
                leading: Radio<Idiomas>(
                  value: Idiomas.Quechua,
                  fillColor: MaterialStateColor.resolveWith((states) => Colors.blue),
                  groupValue: _idiomas,
                  onChanged: (Idiomas? value) {
                    setState(() {
                      _idiomas = value;
                      setLanguage("quechua");
                    });
                  },
                ),
              ),


              ListTile(
                title: const Text('Aymara',style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),),
                leading: Radio<Idiomas>(
                  value: Idiomas.Aymara,
                  fillColor: MaterialStateColor.resolveWith((states) => Colors.blue),
                  groupValue: _idiomas,
                  onChanged: (Idiomas? value) {
                    setState(() {
                      _idiomas = value;
                      setLanguage("aymara");
                    });
                  },
                ),
              ),


              const Padding(padding: EdgeInsets.all(16.0)),
              Container(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  child: const Text("Ayuda y FeedBack", style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Rubik",
                    color: Colors.blueAccent,
                  ),),
                  onTap: (){
                    Get.to(()=> const HelpPage());
                  },
                ),
              ),
              const SizedBox(
                width: 70,
                height: 70,
              ),
              const Padding(padding: EdgeInsets.all(16.0)),
            ],
          ),
        ),
      ),
    );
  }
}