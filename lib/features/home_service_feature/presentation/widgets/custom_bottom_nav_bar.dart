import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/recourses/color_manager/color_manager.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.onTap,
    required this.currentIndex,
  });
  final Function(int?)? onTap;
  final int? currentIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ClipRRect(borderRadius: BorderRadius.circular(20),
        child: BottomNavigationBar(
          currentIndex: currentIndex!,
          onTap: onTap,
          iconSize: 30,
          unselectedItemColor:ColorManager.black,
          selectedItemColor:ColorManager.primary,
          backgroundColor: ColorManager.scaffoldBackGroundColor,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              label: "",
              icon: Icon(FontAwesomeIcons.house),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(FontAwesomeIcons.searchengin),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(FontAwesomeIcons.compass),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.person_pin),
            ),
          ],
        ),
      ),
    );
  }
}