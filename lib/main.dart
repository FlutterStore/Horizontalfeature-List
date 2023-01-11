// 

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_horizontal_featured_list/flutter_horizontal_featured_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExampleAppPage(),
    );
  }
}

class ExampleAppPage extends StatefulWidget {
  const ExampleAppPage({Key? key}) : super(key: key);

  @override
  State<ExampleAppPage> createState() => _ExampleAppPageState();
}

class _ExampleAppPageState extends State<ExampleAppPage> {

  List<Color> colors = List.generate(20, (index) => randomColor());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HorizontalFeaturedList',style: TextStyle(color: Colors.white,fontSize: 15)),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Center(
        child: HorizontalFeaturedList(
          itemHeight: 120,
          itemColorBuilder: (context, index) => colors[index],
          itemCount: colors.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Row(
                  children: <Widget>[
                    const Icon(
                      Icons.face,
                      size: 24,
                      color: Colors.black45,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          '($index) What is Lorem Ipsum?',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '($index) Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
          onPressedItem: () {},
          onPressedSeeAll: () {},
          titleText: 'Ongoing Projects',
          seeAllText: 'See All',
        ),
      ),
    );
  }

}

Color randomColor() {
  var g = math.Random.secure().nextInt(255);
  var b = math.Random.secure().nextInt(255);
  var r = math.Random.secure().nextInt(255);
  return Color.fromARGB(255, r, g, b);
}