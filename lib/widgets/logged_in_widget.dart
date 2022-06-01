import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news/screens/home/home.dart';
import 'package:news/screens/home/home_frag/categories.dart';
import 'package:news/widgets/app_bar.dart';

class LoggedInWidget extends StatelessWidget {
  const LoggedInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          backgroundColor: Colors.white,
          toolbarHeight: 100,
          title: const MyAppBar(),
        ),
        body: MyHomePage());
  }
}
