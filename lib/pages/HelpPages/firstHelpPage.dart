// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

//class firstHelpPage extends StatefulWidget {
//  const firstHelpPage({Key? key}) : super(key: key);

//  @override
//  _firstHelpPageState createState() => _firstHelpPageState();
//}

//class _firstHelpPageState extends State<firstHelpPage> {

class firstHelpPage extends StatefulWidget {
  const firstHelpPage({Key? key}) : super(key: key);

  @override
  _firstHelpPageState createState() => _firstHelpPageState();
}

class _firstHelpPageState extends State<firstHelpPage> {
  PageController controller = PageController(initialPage: 0);

  int currentPage = 0;

  List<Widget> getList() {
    List<Widget> childs = [];
    childs.add(

        Column(
            children: [
              Image.asset(
                'assets/icons/killaImage.png',
                width: 200.0,
                height: 200.0,
                fit: BoxFit.cover,
                ),
              Text("Es una aplicacion que sirve como intermediario comunicativo, mediante el uso de audios pre-grabados basados en la simulacion de una consulta medica.")
            ]
        ));
    childs.add(
        Column(
            children: [
              Image.asset(
                'assets/icons/medicImage2.png',
                width: 200.0,
                height: 200.0,
                fit: BoxFit.cover,
              ),
              Text("En el menu de killa tenemos tres opciones, la opcion “Consulta”, es el apartado principal de killa, el cual tiene todos los audios que la aplicación ofrece.")

            ]
        ));
    childs.add(
        Column(

            children: [
              Image.asset(
                'assets/icons/killaImage.png',
                width: 200.0,
                height: 200.0,
                fit: BoxFit.cover,
              ),
              Text("Este apartado deriva de la anterior opción (iniciar consulta), en este se agrupan los audios según ocho fases de consulta que un médico realiza en una rutina normal.")
            ]
        ));
    childs.add(
        Column(
            children: [
              Image.asset(
                'assets/icons/killaImage.png',
                width: 200.0,
                height: 200.0,
                fit: BoxFit.cover,
              ),
              Text("Cada opción del menu de consulta está conformado con un audio fijado el cual es una indicación que puede ser usada en más de una ocasión, seguido de este están los audios relativos al apartado.")
            ]
        ));
    childs.add(
        Column(
            children: [
              Image.asset(
                'assets/icons/killaImage.png',
                width: 200.0,
                height: 200.0,
                fit: BoxFit.cover,
              ),
              Text("Como dice su nombre esa opcion cuenta con las indicaciones o preguntas que un medico requeriria en una situacion espontanea, evitando asi, que este busque el audio especifico dentro de los otros apartados. ")
            ]
        ));
    childs.add(
        Column(
            children: [
              Image.asset(
                'assets/icons/killaImage.png',
                width: 200.0,
                height: 200.0,
                fit: BoxFit.cover,
              ),
              Text("Si usted, desease tener más opciones en cuanto a términos específicos del lenguaje puede consultar el manual de semiología (© Dr. Julio Lopera Quiroga, 2008, 2015, 2020). Este solo está disponible en el idioma Quechua.")
            ]
        ));
    childs.add(
        Column(
            children: [
              Image.asset(
                'assets/icons/killaImage.png',
                width: 200.0,
                height: 200.0,
                fit: BoxFit.cover,
              ),
              Text("Si quiere hacer algún cambio del tema de la aplicación o el idioma, puede ingresar a este apartado cuando lo necesite,puede dejar sus comentarios en la opción de “Ayuda y Feedback” y si quiere volver a ver estas indicaciones presione el icono (i) .")
            ]
        ));
    return childs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: controller,
          children: <Widget>[...getList()],
          onPageChanged: (value) {
            setState(() {
              currentPage = value;
            });
          },
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  controller.previousPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut);
                });
              },
              icon: const Icon(Icons.arrow_left),
            ),
            Text(
              "${currentPage + 1}/${getList().length}",
            ),
            IconButton(
              onPressed: () {
                controller.nextPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut);
              },
              icon: const Icon(Icons.arrow_right),
            )
          ],
        ));
  }
}