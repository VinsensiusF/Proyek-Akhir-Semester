import 'package:flutter/material.dart';
import 'package:pas/pages/landing_page.dart';
import 'package:pas/main.dart';


class MyKategoriPage extends StatefulWidget {
    const MyKategoriPage({super.key});

    @override
    State<MyKategoriPage> createState() => _MyListPageState();
}


class _MyListPageState extends State<MyKategoriPage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('SellerPrism.io'),
            ),
            drawer: Drawer(
              child: Column(
                children: [
                  ListTile(
                    title: const Text("Home Page"),
                    onTap: () {
                      Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const MyHomePage(title: 'SellerPrism.io',)),
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
                      MaterialPageRoute(builder: (context) => const MyHomePage(title: 'SellerPrism.io',)),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('FAQ'),
                    onTap: () {
                        // Route menu ke halaman to do
                        Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const MyHomePage(title: 'SellerPrism.io',)),
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
                //   const Text("Lorem ipsum dolor sit amet", 
                //         textAlign: TextAlign.justify,),
                //         const SizedBox(height: 50),
                  Align(
                        alignment: Alignment.bottomCenter,
                        child: Card(
                            child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                                const ListTile(
                                leading: Icon(Icons.fastfood),
                                title: Text('Kategori A'),
                                subtitle: Text('Temukan produk terbaik kategori A disini.'),
                                ),
                                Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                    TextButton(
                                    child: const Text('Lihat Toko'),
                                    onPressed: () {/* ... */},
                                    ),
                                    const SizedBox(width: 8),
                                ],
                                ),
                            ],
                            ),
                        ),

                        ),
                ]
              ),
            ),
    
          );
    }
}