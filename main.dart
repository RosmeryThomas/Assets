import 'package:flutter/material.dart';
import 'package:paginadeinicio/Contactanos.dart';
import 'package:paginadeinicio/nosotros.dart';
import 'package:paginadeinicio/sedes.dart';
import 'package:paginadeinicio/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  final List<String> imageUrls = [
    'assets/images/B1.jpg',
    'assets/images/B2.jpg',
    'assets/images/B4.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Image.asset(
              'assets/images/logo.png',
              height: 25,
            ),
            bottom: TabBar(
              labelColor: Color(0xFF0175BE),

              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.home),
                      SizedBox(width: 5),
                      Text('Inicio'),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.people),
                      SizedBox(width: 5),
                      Text('Nosotros'),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(width: 5),
                      Text('Sedes'),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.mail),
                      SizedBox(width: 5),
                      Text('Contáctanos'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(
                child: ImageCarousel(imageUrls: imageUrls),
              ),
              NosotrosPage(),
              SedesTab(),
              ContactanosPage(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                isDarkMode = !isDarkMode;
              });
            },
            child: Icon(isDarkMode ? Icons.wb_sunny : Icons.brightness_3),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        ),
      ),
    );
  }
}
