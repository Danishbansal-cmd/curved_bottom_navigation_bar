import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  final globalKey = GlobalKey<CurvedNavigationBarState>();
  final items = <Widget>[
    Icon(
      Icons.headphones,
      size: 30,
    ),
    Icon(
      Icons.people,
      size: 30,
    ),
    Icon(
      Icons.account_circle,
      size: 30,
    ),
    Icon(
      Icons.add_photo_alternate,
      size: 30,
    ),
    Icon(
      Icons.youtube_searched_for,
      size: 30,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.network(
              'https://i.pinimg.com/550x/2a/7e/da/2a7eda48288946e07afa8c39aa96497d.jpg',
              fit: BoxFit.cover,
            ),
          ),
          RefreshIndicator(
            onRefresh: () async{
              await Future.delayed(const Duration(milliseconds: 1200),(){
                print("hahahfdlfasldf");
              });
            },
            child: ListView(
              physics: ClampingScrollPhysics(),
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(index.toString(),style: const TextStyle(color: Colors.white),),
                      TextButton(
                        onPressed: () {
                          final navigationState = globalKey.currentState;
                          navigationState!.setPage((index + 1) % 5);
                        },
                        child: Text("go to ${index + 1}"),
                        style: TextButton.styleFrom(
                          textStyle: TextStyle(
                            color: Colors.red,
                            backgroundColor: Colors.grey.shade300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: globalKey,
        height: 60,
        items: items,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInCubic,
        animationDuration: const Duration(milliseconds: 300),
        buttonBackgroundColor: Colors.blue.shade100,
        color: Colors.redAccent,
        index: index,
        onTap: (index) {
          setState(() {
            this.index = index;
          });
        },
      ),
    );
  }
}
