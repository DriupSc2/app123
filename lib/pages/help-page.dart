import 'package:flutter/material.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ayuda y feedback",)),
      body: SafeArea(
        child: Column(
          children: [
            Container(height: 50,),
            Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.topLeft,
              child: const Text("AYUDA",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.topLeft,
              child: const Text("Enviar feedback",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Color(0xff0071E3),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.topLeft,
              child: const Text("Preguntas frecuentes",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Color(0xff0071E3),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),

            const Padding(padding: EdgeInsets.all(16.0)),
            Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.topLeft,
              child: const Text("ACERDA DE NOSOTROS",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.topLeft,
              child: const Text("Privacidad",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Color(0xff0071E3),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.topLeft,
              child: const Text("Terminos de uso",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Color(0xff0071E3),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),

            Container(height: 60,),

            Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.topLeft,
              child: const Text("Version: alfa 0.2",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Color(0xff069696),
                  fontSize: 15,
                ),
              ),
            ),


          ],
        ),
      )
    );
  }
}