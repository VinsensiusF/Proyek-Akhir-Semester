import 'package:flutter/material.dart';
import 'package:pas/widget/drawer.dart';
import 'package:pas/models/models_kategori.dart';
import 'package:pas/models/models_search_home.dart';
import 'package:pas/models/models_toko.dart';
import 'package:http/http.dart' as http;

class MyKategoriDetailPage extends StatefulWidget {
  const MyKategoriDetailPage({super.key});

  @override
  State<MyKategoriDetailPage> createState() => _MyTokoPageState();
}

class _MyTokoPageState extends State<MyKategoriDetailPage> {
  bool _visible = false;

  void _toggle() {
    setState(() {
      _visible = !_visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          title: const Text('Toko'),
          backgroundColor: Color.fromARGB(255, 146, 161, 235),
          centerTitle: true,
        ), //AppBar

        drawer: const Drawers(),
        body: SingleChildScrollView(
            /** Card Widget **/
            child: Container(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                    children: DataToko.tokoList.isNotEmpty
                        ? DataToko.tokoList
                            .map((toko) => Card(
                                  elevation: 50,
                                  shadowColor: Colors.black,
                                  color: Color.fromARGB(255, 146, 161, 235),
                                  child: SizedBox(
                                    width: 350,
                                    height: 500,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.blue[500],
                                            radius: 108,
                                            child: const CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  "https://images.tokopedia.net/img/cache/500-square/VqbcmM/2022/1/16/1abf9771-e4c9-47c8-b77a-95a05fc4bb34.jpg"),
                                              radius: 100,
                                            ), //CircleAvatar
                                          ), //CircleAvatar
                                          const SizedBox(
                                            height: 20,
                                          ), //SizedBox
                                          Text(
                                            toko.namatoko,
                                            // ignore: prefer_const_constructors
                                            style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                            ), //Textstyle
                                          ), //Text
                                          const SizedBox(
                                            height: 10,
                                          ), //SizedBox
                                          const SizedBox(
                                            height: 10,
                                            width: 120,
                                          ), //SizedBox

                                          ElevatedButton(
                                              onPressed: _toggle,
                                              child:
                                                  const Text('Lihat Detail')),
                                          Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 30, right: 30),
                                                  child: Visibility(
                                                    // ignore: sort_child_properties_last
                                                    child: Text(
                                                      toko.deskripsi,
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18),
                                                    ),
                                                    maintainSize: true,
                                                    maintainAnimation: true,
                                                    maintainState: true,
                                                    visible: _visible,
                                                  ),
                                                )
                                              ]),
                                        ],
                                      ),
                                    ),
                                  ),
                                ))
                            .toList()
                        : [
                            Center(
                                child: Column(children: const [
                              Text(
                                "Mohon maaf. Belum ada Toko yang tersedia.",
                                style: TextStyle(fontSize: 16),
                              ),
                            ]))
                          ]))));
  }
}
