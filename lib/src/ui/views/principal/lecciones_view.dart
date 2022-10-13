import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pidgeon_app/src/core/utils/colors.dart';
import 'package:pidgeon_app/src/core/utils/constants.dart';
import 'package:pidgeon_app/src/core/utils/styles.dart';
import 'package:pidgeon_app/src/data/models/lesson_model.dart';
import 'package:pidgeon_app/src/ui/widgets/shared/text_divider.dart';

class LessonsView extends StatelessWidget {
  const LessonsView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextDividerLarge(label: 'Elige tu lección'),
          Expanded(
              child: GridView.builder(
            itemCount: lessonMocking.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) => LessonItem(
              screenSize: screenSize,
              index: index,
              lessonModel: lessonMocking[index],
              onTap: () {
                Navigator.of(context).pushNamed('/lessons', arguments: index);
              },
            ),
          ))
        ],
      ),
    );
  }
}

class LessonItem extends StatelessWidget {
  const LessonItem({
    Key? key,
    required this.screenSize,
    required this.index,
    required this.lessonModel,
    this.onTap,
  }) : super(key: key);

  final Size screenSize;
  final int index;
  final LessonModel lessonModel;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: screenSize.height * .13,
              width: screenSize.height * .13,
              decoration: BoxDecoration(
                color: colors.primaryRose,
                gradient: LinearGradient(colors: [
                  itemsFade[index][0],
                  itemsFade[index][1],
                ]),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  iconItemList[index],
                  color: Colors.white,
                  height: screenSize.height * .05,
                  width: screenSize.height * .05,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              lessonModel.title!,
              style: styles.mediumStyle(context,
                  color: colors.onPrimaryBlue, bold: true),
            )
          ],
        ),
      ),
    );
  }
}
