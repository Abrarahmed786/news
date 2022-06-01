import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.start,
            spacing: 10.0,
            runAlignment: WrapAlignment.start,
            runSpacing: 10.0,
            crossAxisAlignment: WrapCrossAlignment.start,
            verticalDirection: VerticalDirection.down,
            clipBehavior: Clip.hardEdge,
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/images/finance.jpg',
                    height: 120,
                    width: 120,
                  ),
                  const Text('Finance')
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/images/politics.jpg',
                    height: 120,
                    width: 120,
                  ),
                  const Text('Politics')
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/images/health.jpg',
                    height: 120,
                    width: 120,
                  ),
                  const Text('Health')
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/images/tech.jpg',
                    height: 120,
                    width: 120,
                  ),
                  const Text('Tech')
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/images/sport.jpg',
                    height: 120,
                    width: 120,
                  ),
                  const Text('Sports')
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/images/fun.jpg',
                    height: 120,
                    width: 120,
                  ),
                  const Text('Fun')
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/images/social.jpg',
                    height: 120,
                    width: 120,
                  ),
                  const Text('Social Media')
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
