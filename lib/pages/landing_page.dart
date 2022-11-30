import 'package:flutter/material.dart';


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
                children: <Widget>[
                  const Text("MedsosUMKM merupakan salah satu wadah sosialisasi dan pengembangan UMKM di seluruh Indonesia. Hal ini sesuai dengan motto MedsosUMKM, yaitu ""Sejahtera Bersama, Cemerlang Bersama"". MedsosUMKM menyediakan banyak fitur layaknya media sosial, seperti Instagram dan Facebook yang dapat digunakan oleh berbagai UMKM supaya bisa saling berinteraksi dan bekerja sama. Tentunya, website ini dapat digunakan dan diakses secara gratis oleh siapapun. Dengan adanya website ini, diharapkan semua UMKM di Indonesia menjadi saling terhubung dan memungkinkan timbulnya banyak kerja sama antara UMKM. Selain untuk antar UMKM, MedsosUMKM ini juga ditunjukkan untuk para investor yang ingin melakukan investasi di sektor UMKM dan bagi para konsumer yang tertarik dalam UMKM.", 
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