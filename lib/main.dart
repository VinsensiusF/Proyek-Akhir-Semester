import 'package:flutter/material.dart';
import 'package:pas/pages/faq_page.dart';
import 'package:pas/widget/drawer.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pas/utils/utils.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pas/widget/drawer.dart';
import 'package:pas/pages/kategori_page.dart';
import 'package:pas/pages/forum_page.dart';
import 'models/models_search_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) {
          CookieRequest request = CookieRequest();
          return request;
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'SellerPrism.io',
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
            scaffoldBackgroundColor: Colors.white,
          ),
          home: const MyHomePage(title: 'SellerPrism.io'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _namatoko = "";
  List<Search> list = <Search>[];
  var res;
  String _explain = "";
  CookieRequest request = CookieRequest();

  @override
  initState() {
    fetchToDo();
  }

  Future<List<Search>> fetchToDo() async {
    var url =
        Uri.parse('https://medsos-umkm.up.railway.app/katalog/show_toko_json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json

    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object ToDo
    List<Search> listFields = [];
    for (var d in data) {
      if (d != null) {
        list.add(Search.fromJson(d));
        listFields.add(Search.fromJson(d));
      }
    }

    return listFields;
  }

  @override
  Widget build(BuildContext context) {
    var index;
    return Scaffold(
      appBar: AppBar(
        title: const Text('SellerPrism.io'),
      ),
      drawer: const Drawers(),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                // Menggunakan padding sebesar 8 pixels
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Hanya Masukkan Nama tanpa kata " "Toko" "",
                    suffixIcon: IconButton(
                      onPressed: () {
                        for (var res in list) {
                          if (res.fields.username.toString().toLowerCase() ==
                              _namatoko.toLowerCase()) {
                            index = res;
                          }
                        }
                        if (index == null) {
                          _explain = "Toko Tidak Ditemukan";
                        } else {
                          _explain =
                              "Toko ${index.fields.username} \nEmail: ${index.fields.email} \nOnline Terakhir: ${index.fields.lastLogin.toString().split(" ")[0]} \nWaktu Bergabung: ${index.fields.dateJoined.toString().split(" ")[0]}";
                        }
                        Widget okButton = TextButton(
                          child: Text("OK"),
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true)
                                .pop('dialog');
                          },
                        );

                        AlertDialog alert = AlertDialog(
                          title: Text("Detail Toko"),
                          content: Text(_explain),
                          actions: [
                            okButton,
                          ],
                        );

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alert;
                          },
                        );
                      },
                      icon: const Icon(Icons.arrow_circle_right_outlined),
                    ),
                    labelText: "Search Toko",
                    // Menambahkan icon agar lebih intuitif
                    icon: const Icon(Icons.search),
                    // Menambahkan circular border agar lebih rapi
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _namatoko = value!;
                    });
                  },
                  textInputAction: TextInputAction.search,
                )),
            Image.asset(
              'lib/assets/umkm.jpeg',
              width: 400,
              height: 225,
              fit: BoxFit.cover,
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: 400.0,
                height: 250.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: const Color.fromARGB(53, 250, 250, 250),
                ),
                child: const Center(
                  child: Text(
                    "SellerPrism.io merupakan salah satu wadah sosialisasi dan pengembangan UMKM di seluruh Indonesia. Hal ini sesuai dengan motto MedsosUMKM, yaitu "
                    "Sejahtera Bersama, Cemerlang Bersama"
                    ". MedsosUMKM menyediakan banyak fitur layaknya media sosial, seperti Instagram dan Facebook yang dapat digunakan oleh berbagai UMKM supaya bisa saling berinteraksi dan bekerja sama. Tentunya, website ini dapat digunakan dan diakses secara gratis oleh siapapun. Dengan adanya website ini, diharapkan semua UMKM di Indonesia menjadi saling terhubung dan memungkinkan timbulnya banyak kerja sama antara UMKM. Selain untuk antar UMKM, MedsosUMKM ini juga ditunjukkan untuk para investor yang ingin melakukan investasi di sektor UMKM dan bagi para konsumer yang tertarik dalam UMKM.",
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
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyKategoriPage()),
                  );
                },
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.blue,
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text(
                  'Daftar Kategori',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const ForumPage()),
                  );
                },
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.blue,
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text(
                  'Lihat Forum',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyFAQPage()),
                  );
                },
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.blue,
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text(
                  'Lihat FAQ',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ]),
    );
  }
}
