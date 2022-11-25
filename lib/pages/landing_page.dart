import 'package:flutter/material.dart';
import 'package:pas/pages/kategori_page.dart';


class MyLandingPage extends StatefulWidget {
    const MyLandingPage({super.key});

    @override
    State<MyLandingPage> createState() => _MyListPageState();
}


class _MyListPageState extends State<MyLandingPage> {
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
                      MaterialPageRoute(builder: (context) => const MyKategoriPage()),
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
                children: <Widget>[
                  const Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. In mollis lectus leo. Aliquam quis turpis cursus turpis tempor molestie sit amet eget magna. Aliquam hendrerit sagittis orci eu convallis. Curabitur efficitur orci at dignissim ultricies. Sed rhoncus pellentesque feugiat. Sed imperdiet quis nunc eu feugiat. Nam vel imperdiet metus, eget facilisis mauris. Mauris eu nibh semper, gravida ante sit amet, eleifend lacus. Etiam et eros nisi.Integer vestibulum nulla ipsum. Maecenas facilisis, sem eu pulvinar rhoncus, eros ante commodo diam, eu vulputate augue orci sed magna. Nulla facilisi. Aenean efficitur lorem mi, non tristique tellus dignissim quis. Sed venenatis turpis ipsum, at finibus orci vulputate quis. Donec pellentesque ipsum non ultricies vehicula. Suspendisse faucibus rhoncus eleifend.", 
                        textAlign: TextAlign.justify,),
                        const SizedBox(height: 50),
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
                                      minimumSize: const Size.fromHeight(50),
                                  ),
                                  child: const Text('Daftar Kategori', style: TextStyle(fontSize: 15),),
                              ), 
                        ),
                        const SizedBox(height: 5),
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
                                        minimumSize: const Size.fromHeight(50),
                                    ),
                                    child: const Text('Lihat Forum', style: TextStyle(fontSize: 15),),
                                ), 
                          ),
                          const SizedBox(height: 5),
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
                                        minimumSize: const Size.fromHeight(50),
                                    ),
                                    child: const Text('Lihat FAQ', style: TextStyle(fontSize: 15),),
                                ), 
                          ),
                ]
              ),
            ),
    
          );
    }
}