import 'package:flutter/material.dart';
import 'package:pas/main.dart';
import 'package:pas/widget/drawer.dart';


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
            drawer: const Drawers(),
            body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                
                children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:  Image.network(
                                    'https://cdn.dribbble.com/users/539800/screenshots/2892313/dribble_category_icons.gif',
                                    width: 400,
                                    // height: 200,
                                    fit: BoxFit.cover,
                                ),
                        
                    ),
                    

                    Expanded(flex:2,
                  child: Container(
                        // width: 400.0,
                        // height: 60.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: const Color.fromARGB(53, 250, 250, 250),
                        ),
                       
                        child:const Center(
                          child: Text("Temukan produk dengan kategori yang kamu inginkan disini!", 
                              style: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 14,
                                color: Color.fromARGB(255, 31, 30, 30),
                                // height: 50,
                              ),
                              textAlign: TextAlign.justify,
                                ),
                            ),
                        ),
                        // const SizedBox(height: 40),
                  ),

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
                ],
            ),
    
          );
    }
}