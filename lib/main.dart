import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'SuperMercado Gonzalez'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> imgList = [
    "https://raw.githubusercontent.com/Yadier-Gonzalez-Graciano/img-flutterflow_ios_6j/main/Act%2013%20GridView%20Flutter%20Flow/carne4.jpg",
    "https://raw.githubusercontent.com/Yadier-Gonzalez-Graciano/img-flutterflow_ios_6j/main/Act%2013%20GridView%20Flutter%20Flow/fruta6.jpg",
    "https://raw.githubusercontent.com/Yadier-Gonzalez-Graciano/img-flutterflow_ios_6j/main/Act%2013%20GridView%20Flutter%20Flow/fruta7.jpg",
    "https://raw.githubusercontent.com/Yadier-Gonzalez-Graciano/img-flutterflow_ios_6j/main/Act%2013%20GridView%20Flutter%20Flow/panssssssssssss.png",
    "https://raw.githubusercontent.com/Yadier-Gonzalez-Graciano/img-flutterflow_ios_6j/main/Act%2013%20GridView%20Flutter%20Flow/frutas6.jpg",
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          CarouselSlider(
            items: imgList
                .map((e) => Center(
                      child: Image.network(e),
                    ))
                .toList(),
            options: CarouselOptions(
              initialPage: 0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2),
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              onPageChanged: (value, _) {
                setState(() {
                  _currentPage = value;
                });
              },
            ),
          ),
          buildCarouselIndicator(),
        ],
      ),
    );
  }

  Widget buildCarouselIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < imgList.length; i++)
          Container(
            margin: EdgeInsets.all(5),
            height: i == _currentPage ? 7 : 5,
            width: i == _currentPage ? 7 : 5,
            decoration: BoxDecoration(
              color: i == _currentPage ? Colors.black : Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }
}
