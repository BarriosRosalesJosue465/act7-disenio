import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Sabritas Barrios'),
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
    "https://raw.githubusercontent.com/BarriosRosalesJosue465/img_fluttterFlow_IOS_6J/main/act12NavBar_flutterFlow/producto9.jpg",
    "https://raw.githubusercontent.com/BarriosRosalesJosue465/img_fluttterFlow_IOS_6J/main/act12NavBar_flutterFlow/producto8.jpg",
    "https://raw.githubusercontent.com/BarriosRosalesJosue465/img_fluttterFlow_IOS_6J/main/act12NavBar_flutterFlow/producto4.jpg",
    "https://raw.githubusercontent.com/BarriosRosalesJosue465/img_fluttterFlow_IOS_6J/main/act12NavBar_flutterFlow/producto7.jpg",
    "https://raw.githubusercontent.com/BarriosRosalesJosue465/img_fluttterFlow_IOS_6J/main/act12NavBar_flutterFlow/producto5.jpg",
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
