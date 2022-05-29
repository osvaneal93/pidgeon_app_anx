import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pidgeon_app/src/ui/views/principal/lecciones_view.dart';

import 'package:pidgeon_app/src/ui/views/principal/principal_view.dart';
import 'package:pidgeon_app/src/ui/views/principal/screen_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffefeeee),
      bottomNavigationBar: bottomNavigationBar(),
      body: ScreenList().screenList[currentIndex].customNestedScrollView(screenSize),
    );
  }

  Container bottomNavigationBar() {
    return Container(
        margin: const EdgeInsets.symmetric(vertical:10, horizontal: 50),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 20),
          ],
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BottomNavigationBar(
            onTap: (index)=> setState(() => currentIndex = index ),
            backgroundColor:  const Color(0xffefeeee),
            currentIndex: currentIndex,
            items: [
              //home
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Color.fromARGB(116, 66, 99, 191)),
                activeIcon: Icon(Icons.home, color: Color(0xff4263BF)),
                label: '',
              ),
              //favorite
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite, color:Color.fromARGB(116, 66, 99, 191)),
                activeIcon:
                    Icon(Icons.favorite, color:Color(0xff4263BF)),
                label: '',
              ),
              //loockback
              BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart, color: Color.fromARGB(116, 66, 99, 191)),
                activeIcon:
                    Icon(Icons.bar_chart, color: Color(0xff4263BF)),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.synagogue, color: Color.fromARGB(116, 66, 99, 191)),
                activeIcon: Icon(FontAwesomeIcons.synagogue, color: Color(0xff4263BF)),
                label: '',
              ),
            ],
          ),
        ));
  }

}
