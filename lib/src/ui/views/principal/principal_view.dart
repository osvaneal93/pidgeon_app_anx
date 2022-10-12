import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pidgeon_app/src/core/utils/tools.dart';
import 'package:pidgeon_app/src/data/models/lesson_model.dart';
import 'package:pidgeon_app/src/data/repositories/lesson/repo_lesson.dart';
import 'package:pidgeon_app/src/ui/bloc/app/app_bloc.dart';
import 'package:pidgeon_app/src/ui/cubit/login/login_cubit.dart';
import 'package:pidgeon_app/src/ui/widgets/lesson_totem.dart';
import 'package:pidgeon_app/src/ui/widgets/shared/text_divider.dart';
import 'package:pidgeon_app/src/ui/widgets/user_stats.dart';

class PrincipalView extends StatelessWidget {
  const PrincipalView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
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
              backgroundColor: Colors.blue,
              pinned: true,
            )
          ];
        },
        body: lessonList(context));
  }

  lessonList(BuildContext context) {
    RepoLesson repoLesson = RepoLesson();
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          TextDivider(
            color: colors.onPrimaryBlue,
            label: 'De la Comunidad ...',
          ),
          UserStats(
            title: 'Testimonio de la Semana',
            subtitle: 'Ansiedad post Pandemia',
            icon: FontAwesomeIcons.virusCovid,
            iconColor: colors.onPrimaryBlue,
          ),
          TextDivider(
            color: colors.onPrimaryBlue,
            label: 'Por los expertos ...',
          ),
          UserStats(
            title: 'Semana de exámenes',
            subtitle: 'La ansiedad no me deja estudiar',
            icon: FontAwesomeIcons.bookJournalWhills,
            iconColor: colors.primaryRose,
          ),
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
                      return LessonTotem(
                        index: index + 1,
                        lesson: lecciones![index].title!,
                      );
                    },
                    itemCount: lecciones!.length,
                    viewportFraction: 0.50,
                    scale: 0.7,
                  ),
                );
              }),
          TextDivider(
            color: colors.onPrimaryBlue,
            label: 'Nuestros hábitos ... ',
          ),
          UserStats(
            title: 'Alimentos diarios',
            subtitle: 'La importancia de la alimentación',
            icon: FontAwesomeIcons.bowlFood,
            iconColor: colors.primaryPurple,
          ),
          MaterialButton(
            onPressed: (() {
              context.read<AppBloc>().add(AppLogoutRequested());
            }),
            color: colors.primaryGreenblue,
            child: Text(
              'Ingresar',
              style: styles.smallStyle(context,
                  color: colors.onPrimaryBlue, bold: true),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }

  headHome(Size screenSize) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Color.fromARGB(255, 35, 147, 238),
                Color.fromARGB(255, 58, 156, 236),
                Color.fromARGB(255, 79, 164, 233),
                Color.fromARGB(255, 103, 175, 233),
                Color.fromARGB(255, 113, 179, 233),
                Color.fromARGB(255, 131, 185, 233),
                Color.fromARGB(255, 159, 205, 247),
                Color(0xffEFEEEE),
              ],
            ),
          ),
        ),
        Opacity(
            opacity: .4,
            child: SvgPicture.asset(
              'assets/walking.svg',
            )),
        Positioned(
            top: screenSize.height * .08,
            left: screenSize.width * .03,
            child: Column(
              children: const [
                Text(
                  'Bienvenido Osvaldo',
                  style: TextStyle(fontSize: 28, color: Colors.white),
                ),
                Text(
                  'Todo esta bien ...',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            )),
      ],
    );
  }
}
