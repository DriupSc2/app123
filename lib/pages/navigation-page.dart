import 'package:flutter/material.dart';
import 'package:killa/icons.dart';
import 'package:killa/pages/consultation-page.dart';
import 'package:killa/provider/theme_provider.dart';
import 'package:killa/widgets/svg_asset.dart';
import 'menu-page.dart';

class Navigationpage extends StatefulWidget {
  const Navigationpage({Key? key,}) : super(key: key);
  @override
  _NavigationpageState createState() => _NavigationpageState();
}

class _NavigationpageState extends State<Navigationpage> {
  int _index = 0;
  final tabs = [
    const MenuPage(),
    const ConsultationPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: MyThemes.darkTheme.colorScheme.surface,


        selectedLabelStyle: const TextStyle(
          color: Colors.blue,
        ),

        currentIndex: _index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.blueAccent,size: 35,),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgAsset(
              height: 35,
              width: 35,
              assetName: AssetName.consulta1,
            ),
            label: "Consult",
          )
        ],
        onTap: (index){
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}
