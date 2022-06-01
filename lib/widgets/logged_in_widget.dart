import 'package:flutter/material.dart';
import 'package:news/widgets/app_bar.dart';
import 'package:news/widgets/bottom_nav_bar.dart';

class LoggedInWidget extends StatelessWidget {
  const LoggedInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          backgroundColor: Colors.white,
          toolbarHeight: 100,
          title: const MyAppBar(),
        ),
        body: const BottomNavBar());
  }
}
