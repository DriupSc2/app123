import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:killa/icons.dart';
import 'package:killa/pages/antecedentes-page.dart';
import 'package:killa/pages/covid-page.dart';
import 'package:killa/pages/diagnostico-page.dart';
import 'package:killa/pages/introduction-page.dart';
import 'package:killa/pages/preguntas-page.dart';
import 'package:killa/pages/prescripcion-page.dart';
import 'package:killa/pages/revision-fisica-page.dart';
import 'package:killa/pages/signos-vitales-page.dart';
import 'package:killa/provider/theme_provider.dart';
import 'package:killa/widgets/svg_asset.dart';


class ConsultationPage extends StatefulWidget {
  const ConsultationPage({Key? key,}) : super(key: key);
  @override
  State<ConsultationPage> createState() => _ConsultationPageState();
}
bool languaje = true;

const bool _isSelectedTheme = true;

class _ConsultationPageState extends State<ConsultationPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: languaje? const Text("KILLA - QUECHUA"):const Text("KILLA - AYMARA"),
        leading: const SvgAsset(
          height: 25,
          width: 25,
          assetName: AssetName.consulta1,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(8.0)),
            Container(
              alignment: Alignment.center,
              child: const Text("Categorias"),
            ),
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: onTapIntroductionPage,
                            child: Container(
                              alignment: Alignment.center,
                              height: 100,
                              width: 165,

                              decoration: BoxDecoration(
                                color: MyThemes.darkTheme.colorScheme.primaryVariant,
                                borderRadius: BorderRadius.circular(10.0)
                              ),

                              child: const Text("Introducción",style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),),
                            ),
                          ),
                          InkWell(
                            onTap: onTapCovidPage,
                            child: Container(
                              alignment: Alignment.center,
                              height: 100,
                              width: 165,
                              decoration: BoxDecoration(
                                color: MyThemes.darkTheme.colorScheme.secondaryVariant,
                                borderRadius: BorderRadius.circular(5.0)
                              ),
                              child: const Text("COVID - 19",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(8.0),),
                    Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: onTapSignosVitales,
                            child: Container(
                              alignment: Alignment.center,
                              height: 100,
                              width: 165,
                              decoration: BoxDecoration(
                                color: MyThemes.darkTheme.colorScheme.secondaryVariant,
                                borderRadius: BorderRadius.circular(5.0)
                              ),
                              child: const Text("Signos Vitales",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),),
                            ),
                          ),
                          InkWell(
                            onTap: onTapRevisionFisicaPage,
                            child: Container(
                              alignment: Alignment.center,
                              height: 100,
                              width: 165,
                              decoration: BoxDecoration(
                                color: MyThemes.darkTheme.colorScheme.primaryVariant,
                                borderRadius: BorderRadius.circular(5.0)
                              ),
                              child: const Text("Revision Fisica",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(8.0),),
                    Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: onTapPreguntasPage,
                            child: Container(
                              alignment: Alignment.center,
                              height: 100,
                              width: 165,
                              decoration: BoxDecoration(
                                color: MyThemes.darkTheme.colorScheme.primaryVariant,
                                borderRadius: BorderRadius.circular(5.0)
                              ),

                              child: const Text("Preguntas",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),),
                            ),
                          ),
                          InkWell(
                            onTap: onTapAntecedentesPage,
                            child: Container(
                              alignment: Alignment.center,
                              height: 100,
                              width: 165,
                              decoration: BoxDecoration(
                                color: MyThemes.darkTheme.colorScheme.secondaryVariant,
                                borderRadius: BorderRadius.circular(5.0)
                              ),
                              child: const Text("Antecedentes",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(8.0),),
                    Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: onTapDiagnosticoPage,
                            child: Container(
                              alignment: Alignment.center,
                              height: 100,
                              width: 165,
                              decoration: BoxDecoration(
                                color: MyThemes.darkTheme.colorScheme.secondaryVariant,
                                borderRadius: BorderRadius.circular(5.0)
                              ),
                              child: const Text("Diagnostico",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),),
                            ),
                          ),
                          InkWell(
                            onTap: onTapPrescriptionPage,
                            child: Container(
                              alignment: Alignment.center,
                              height: 100,
                              width: 165,
                              decoration: BoxDecoration(
                                color: MyThemes.darkTheme.colorScheme.primaryVariant,
                                borderRadius: BorderRadius.circular(5.0)
                              ),
                              child: const Text("Prescripcion",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onTapIntroductionPage(){
    Get.to(()=>IntroductionPage(language: languaje,));
  }

  void onTapCovidPage(){
    Get.to(()=>CovidPage(language: languaje,));
  }

  void onTapSignosVitales(){
    Get.to(()=>SignosVitalesPage(languaje: languaje));
  }

  void onTapAntecedentesPage(){
    Get.to(()=>AntecedentesPage(language: languaje,));
  }

  void onTapRevisionFisicaPage(){
    Get.to(()=>RevisionFisicaPage(language: languaje,));
  }

  void onTapDiagnosticoPage(){
    Get.to(()=>DiagnosticoPage(language: languaje));
  }
  void onTapPrescriptionPage(){
    Get.to(()=>PrescriptionPage(language: languaje));
  }
  void onTapPreguntasPage(){
    Get.to(()=>PreguntasPage(language: languaje));
  }
}


void setLanguage(String lang){
  if(lang == "quechua"){
    languaje = true;
  }else if(lang == "aymara"){
    languaje = false;
  }
}

bool getLanguage(){
  return languaje;
}