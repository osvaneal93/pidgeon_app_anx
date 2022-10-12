import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pidgeon_app/src/core/utils/tools.dart';

class LessonTotem extends StatelessWidget {
  final int index;
  final String lesson;
  const LessonTotem({super.key, required this.index, required this.lesson});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          transformAlignment: Alignment.center,
          margin: const EdgeInsets.symmetric(vertical: 20),
          padding: const EdgeInsets.all(10),
          width: screenSize.width * .45,
          height: screenSize.height * .35,
          decoration: BoxDecoration(
            color: const Color(0xffefeeee),
            borderRadius: BorderRadius.circular(22),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [colorListIndex[index], colorListIndex[index]],
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0xffffffff),
                offset: Offset(
                  -5,
                  -2,
                ),
                blurRadius: 20,
                spreadRadius: 0.0,
              ),
              BoxShadow(
                color: Color(0xffc3c2c2),
                offset: Offset(-10, 10),
                blurRadius: 20,
                spreadRadius: 0.0,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                lesson,
                style: TextStyle(fontSize: 24),
              ),
              const Text('Como te sientes hoy?'),
              Icon(
                FontAwesomeIcons.bookOpen,
                size: 80,
                color: Color(0xff4263BF),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
