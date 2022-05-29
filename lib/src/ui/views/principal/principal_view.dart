import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:pidgeon_app/src/data/models/lesson_model.dart';
import 'package:pidgeon_app/src/data/repositories/lesson/repo_lesson.dart';
import 'package:pidgeon_app/src/ui/widgets/lesson_totem.dart';
import 'package:pidgeon_app/src/ui/widgets/user_stats.dart';

class Principal {
  
  NestedScrollView customNestedScrollView(Size screenSize) {
    return NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: screenSize.height * .4,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text(
                  'Inicio',
                  style: TextStyle(color: Color(0xff0A379A)),
                ),
                background: headHome(screenSize),
              ),
              backgroundColor: const Color(0xffefeeee),
              pinned: true,
            )
          ];
        },
        body: lessonList());
  }

  lessonList() {
    RepoLesson repoLesson = RepoLesson();
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 70,
          ),
          UserStats(),
          StreamBuilder<List<LessonModel>>(
              stream: repoLesson.getAllLessons(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }
                final lecciones = snapshot.data;
                return SizedBox(
                  height: 350,
                  width: double.infinity,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          child: LessonTotem(
                        index: index + 1,
                        lesson: lecciones![index].title!,
                      ));
                    },
                    itemCount: lecciones!.length,
                    viewportFraction: 0.50,
                    scale: 0.7,
                  ),
                );
              }),
        ],
      ),
    );
  }

  headHome(Size screenSize) {
    return Container(
        child: Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/backgroundAppbar.png',
          fit: BoxFit.cover,
        ),
        Positioned(
            top: screenSize.height * .08,
            left: screenSize.width * .03,
            child: Column(
              children: [
                const Text(
                  'Bienvenido Osvaldo',
                  style: const TextStyle(fontSize: 28, color: Colors.white),
                ),
                const Text(
                  'Todo esta bien ...',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            )),
      ],
    ));
  }
}