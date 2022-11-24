import 'package:flutter/material.dart';
import 'package:pas/pages/landing_page.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
                title: const Text('Home Page'),
            ),
            drawer: Drawer(
              child: Column(
                children: [
                  ListTile(
                    title: const Text("Home Page"),
                    onTap: () {
                      Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const MyLandingPage()),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text("Lihat Kategori"),
                    onTap: () {
                      Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const MyLandingPage()),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text("Forum"),
                    onTap: () {
                      Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const MyLandingPage()),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('FAQ'),
                    onTap: () {
                        // Route menu ke halaman to do
                        Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const MyLandingPage()),
                        );
                    },
                  ),
                ],
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. In mollis lectus leo. Aliquam quis turpis cursus turpis tempor molestie sit amet eget magna. Aliquam hendrerit sagittis orci eu convallis. Curabitur efficitur orci at dignissim ultricies. Sed rhoncus pellentesque feugiat. Sed imperdiet quis nunc eu feugiat. Nam vel imperdiet metus, eget facilisis mauris. Mauris eu nibh semper, gravida ante sit amet, eleifend lacus. Etiam et eros nisi.Integer vestibulum nulla ipsum. Maecenas facilisis, sem eu pulvinar rhoncus, eros ante commodo diam, eu vulputate augue orci sed magna. Nulla facilisi. Aenean efficitur lorem mi, non tristique tellus dignissim quis. Sed venenatis turpis ipsum, at finibus orci vulputate quis. Donec pellentesque ipsum non ultricies vehicula. Suspendisse faucibus rhoncus eleifend.")

                ]
              ),
            ),
            floatingActionButton: Visibility(
                child: Container(
                  width: 762,
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: TextButton(
                                  onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(builder: (context) => const MyLandingPage()),
                                      );
                                  },
                                  style: TextButton.styleFrom(
                                      primary: Colors.white,
                                      backgroundColor: Colors.blue,
                                  ),
                                  child: const Text('Daftar Kategori', style: TextStyle(fontSize: 15),),
                              ), 
                        ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: TextButton(
                                  onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(builder: (context) => const MyLandingPage()),
                                      );
                                  },
                                  style: TextButton.styleFrom(
                                      primary: Colors.white,
                                      backgroundColor: Colors.blue,
                                  ),
                                  child: const Text('Lihat Forum', style: TextStyle(fontSize: 15),),
                              ), 
                        ),
                        Align(
                        alignment: Alignment.bottomCenter,
                        child: TextButton(
                                  onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(builder: (context) => const MyLandingPage()),
                                      );
                                  },
                                  style: TextButton.styleFrom(
                                      primary: Colors.white,
                                      backgroundColor: Colors.blue,
                                  ),
                                  child: const Text('Lihat FAQ', style: TextStyle(fontSize: 15),),
                              ), 
                        ),
                    ],
                  )
                )
              )
          );
  }
}
