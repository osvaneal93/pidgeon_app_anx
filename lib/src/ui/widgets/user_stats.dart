import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pidgeon_app/src/ui/tools/colors_palette.dart';

class UserStats extends StatelessWidget {
  const UserStats({super.key,});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          transformAlignment: Alignment.center,
          margin: const EdgeInsets.symmetric(vertical: 20),
          padding: const EdgeInsets.all(10),
          width: screenSize.width * .9,
          height: screenSize.height * .2,
          decoration: BoxDecoration(
            color: const Color(0xffefeeee),
            borderRadius: BorderRadius.circular(22),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xffefeeee),
                const Color(0xffefeeee),
              ],
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0xffffffff),
                offset: Offset(
                  28.8,
                  -28.8,
                ),
                blurRadius: 30,
                spreadRadius: 0.0,
              ),
              BoxShadow(
                color: Color(0xffc3c2c2),
                offset: Offset(-28.8, 28.8),
                blurRadius: 30,
                spreadRadius: 0.0,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.virusCovid, color:  Color.fromARGB(163, 10, 56, 154),),
              Text('El testimonio de esta semana',
                style: TextStyle(fontSize: 24, color: Color(0xff0A379A)),),
                Text('Ansiedad post Pandemia',
                style: TextStyle(fontSize: 18, color: Color.fromARGB(163, 10, 56, 154)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
