import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:killa/pages/navigation-page.dart';
import 'package:killa/provider/theme_provider.dart';
import 'package:provider/provider.dart';

//const color3 = Color(0xff031D33);

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,}) : super(key: key);



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
//bool _light = true;
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    builder: (context, _){

      final themeProvider = Provider.of<ThemeProvider>(context);
      return GetMaterialApp(
        //Apartados necesarios para definir los temas
        themeMode: themeProvider.themeMode,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        //Apartados necesarios para definir los temas

      home: const Navigationpage(),
      );
  },



  );
}
