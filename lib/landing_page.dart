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
                      MaterialPageRoute(builder: (context) => const MyHomePage(title: 'SellerPrism.io',)),
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
            body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    // Menggunakan padding sebesar 8 pixels
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Contoh: Toko Pak Budi",
                            labelText: "Search Toko",
                            // Menambahkan icon agar lebih intuitif
                            icon: const Icon(Icons.search),
                            // Menambahkan circular border agar lebih rapi
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                            ),
                        ),
                      )
                    ),
                  // Align(alignment: Alignment.topCenter,
                  Image.network(
                      'https://picsum.photos/id/1074/400/400',
                      width: 400,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  // ),
              
                  
                  Expanded(flex:2,
                  child: Container(width: 400.0,
                        height: 250.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: const Color.fromARGB(53, 250, 250, 250),
                        ),
                       
                        child:const Center(
                          child: Text("SellerPrism.io merupakan salah satu wadah sosialisasi dan pengembangan UMKM di seluruh Indonesia. Hal ini sesuai dengan motto MedsosUMKM, yaitu ""Sejahtera Bersama, Cemerlang Bersama"". MedsosUMKM menyediakan banyak fitur layaknya media sosial, seperti Instagram dan Facebook yang dapat digunakan oleh berbagai UMKM supaya bisa saling berinteraksi dan bekerja sama. Tentunya, website ini dapat digunakan dan diakses secara gratis oleh siapapun. Dengan adanya website ini, diharapkan semua UMKM di Indonesia menjadi saling terhubung dan memungkinkan timbulnya banyak kerja sama antara UMKM. Selain untuk antar UMKM, MedsosUMKM ini juga ditunjukkan untuk para investor yang ingin melakukan investasi di sektor UMKM dan bagi para konsumer yang tertarik dalam UMKM.", 
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
                                          MaterialPageRoute(builder: (context) => const MyHomePage(title: 'SellerPrism.io',)),
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
                                            MaterialPageRoute(builder: (context) => const MyHomePage(title: 'SellerPrism.io',)),
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
                                            MaterialPageRoute(builder: (context) => const MyHomePage(title: 'SellerPrism.io',)),
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
            );
  }
}
