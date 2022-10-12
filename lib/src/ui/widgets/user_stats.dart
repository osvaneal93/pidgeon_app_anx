import 'package:flutter/material.dart';
import 'package:pidgeon_app/src/core/utils/tools.dart';

class UserStats extends StatelessWidget {
  const UserStats({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.iconColor,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            transformAlignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 20),
            padding: const EdgeInsets.all(10),
            width: screenSize.width * .9,
            height: screenSize.height * .2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  colors.primaryPurple,
                  Colors.white,
                ],
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xffffffff),
                  offset: Offset(
                    10.8,
                    -10.8,
                  ),
                  blurRadius: 20,
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
                Icon(
                  icon,
                  color: iconColor ?? colors.onPrimaryBlue,
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 24, color: colors.onPrimaryBlue),
                ),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 18, color: colors.onPrimaryBlue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
