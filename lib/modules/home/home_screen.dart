import 'package:flutter/material.dart';
import 'package:ppui_demo/modules/course/course_screen.dart';
import 'package:ppui_demo/modules/profile_screen.dart';
import 'package:ppui_demo/modules/settings_screen.dart';
import 'package:ppui_demo/utils/enumerations.dart';
import 'package:ppui_demo/widgets/cf_bottom_bar.dart';
import 'package:ppui_demo/widgets/cf_scaffold.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentPage = BottomBarPages.courses;

  static const _pages = [
    CourseScreen(),
    ProfileScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return CfScaffold(
      bottomNavigationBar: CfBottomBar(
        onChange: (page) => setState(() => currentPage = page),
      ),
      body: SafeArea(
        child: IndexedStack(
          index: currentPage.index,
          children: _pages,
        ),
      ),
    );
  }
}
