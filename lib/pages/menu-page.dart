import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:killa/icons.dart';
import 'package:killa/pages/HelpPages/firstHelpPage.dart';
import 'package:killa/pages/consultation-page.dart';
import 'package:killa/pages/indicaciones-page.dart';
import 'package:killa/pages/pdf_view_page.dart';
import 'package:killa/resources/odf_api.dart';
import 'package:killa/widgets/button_widget.dart';
import 'package:killa/widgets/svg_asset.dart';
import 'configuration-page.dart';



class MenuPage extends StatefulWidget {

  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  get padding => null;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("KILLA"),
        leading: const SvgAsset(
          height: 25,
          width: 25,
          assetName: AssetName.killa,
        ),

        actions: <Widget>[

          IconButton(
            icon: const SvgAsset(
              height: 35,
              width: 35,
              assetName: AssetName.gear,
            ),
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ConfigurationPage())
                );
              },
          ),
        ],


      ),



      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(30.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300,80),
                  ),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      SvgAsset(
                        height: 35,
                        width: 35,
                        assetName: AssetName.indicaciones1,
                      ),
                      Padding(padding: EdgeInsets.all(16.0)),
                      Text("Indicaciones rapidas",
                          style: TextStyle(
                            fontSize: 21,
                          )
                        ),
                      SizedBox()
                    ],
                  ),
                  onPressed: onTapConsultationPage,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(30.0),
                child: ButtonWidget(
                  text: 'Manual de Semiología',
                  onClicked: () async {
                    const path = 'assets/Glosario-Multilingue-Puno-Ultimo.pdf';
                    final file = await PDFApi.loadAsset(path);
                    openPDF(context, file);
                  },
                  icon: const SvgAsset(
                    height: 35,
                    width: 35,
                    assetName: AssetName.manual1,
                  ),
                ),
              ),
          ],

          ),



        ),



      ),
      //Help Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const firstHelpPage());

        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.navigation),
      ),
    );
  }

  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
  );

  void onTapConsultationPage() {
    Get.to(() => IndicacionesPage(language: getLanguage()));
  }
}