import 'package:flutter/material.dart';
import 'package:news/screens/home/home_frag/categories.dart';
import 'package:news/widgets/app_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Top News',
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 160.0,
                    color: Colors.red,
                    height: 100,
                  ),
                  Container(
                    width: 160.0,
                    color: Colors.blue,
                    height: 100,
                  ),
                  Container(
                    width: 160.0,
                    color: Colors.green,
                    height: 100,
                  ),
                  Container(
                    width: 160.0,
                    color: Colors.yellow,
                    height: 100,
                  ),
                  Container(
                    width: 160.0,
                    color: Colors.orange,
                    height: 100,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Categories',
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 10,
            ),
            const Categories()
          ],
        ),
      ),
    );
  }
}
