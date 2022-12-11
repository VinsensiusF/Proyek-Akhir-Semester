// import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pas/pages/editprofile_page.dart';
import 'package:pas/widget/drawer.dart';
import 'package:pas/widget/profile_widget.dart';

class SellerProfilePage extends StatefulWidget {
  const SellerProfilePage({Key? key}) : super(key: key);

  @override
  _SellerProfilePageState createState() => _SellerProfilePageState();
}

class _SellerProfilePageState extends State<SellerProfilePage> {
  // Future<Map<String, dynamic>> fetchData(ConnectNetworkService request) async {
  //   String url = 'https://medsos-umkm.up.railway.app/profile_json/';

  //   try {
  //     Map<String, dynamic> extractedData = {};

  //     final response = await http.get(Uri.parse(url));
  //     extractedData['profile'] = jsonDecode(response.body);

  //     return extractedData;
  //   } catch (error) {
  //     return {"Error": "error"};
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // String imagePath =
    //     'https://img.icons8.com/bubbles/100/000000/user.png';

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        drawer: const Drawers(),
        body: SingleChildScrollView(
          child:
            Column(
          children: [
            Container(decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue, Colors.white]
              )
            ),
            child: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 16, 0, 40),
                  // padding : const EdgeInsets.fromLTRB(40,10,10,10),
                  child: ProfileWidget(
                    imagePath: 'https://img.icons8.com/bubbles/100/000000/user.png',
                  ),
                ),
          ),
            Column(
              // height: MediaQuery.of(context).size.height * 0.8,
              // physics: const NeverScrollableScrollPhysics(),
              // child: ListView(children: <Widget>[
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Nama',
                        style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                        // textAlign: TextAlign.center,
                      ),
                      Text(
                        'Your name will be shown here ...',
                        style: TextStyle(fontSize: 16, height: 2),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Username',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Your username will be shown here ...',
                        style: TextStyle(fontSize: 16, height: 2),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Email',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Your email will be shown here ...',
                        style: TextStyle(fontSize: 16, height: 2),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),

                // garis
                const SizedBox(height: 30),
                // const Divider(
                //   color: Colors.black
                // ),
                // const SizedBox(height: 10),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Nama Usaha',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Your business name will be shown here ...',
                        style: TextStyle(fontSize: 16, height: 2),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Deskripsi',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Your business description will be shown here ...',
                        style: TextStyle(fontSize: 16, height: 2),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Alamat Usaha',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Your business address will be shown here ...',
                        style: TextStyle(fontSize: 16, height: 2),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Alamat Usaha',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Your business contact will be shown here ...',
                        style: TextStyle(fontSize: 16, height: 2),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Alamat Usaha',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Your business link/website will be shown here ...',
                        style: TextStyle(fontSize: 16, height: 2),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),


              // ]
              ]
              // ),
            ),

            Padding(
              padding : const EdgeInsets.fromLTRB(20,20,20,20),
              child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    // fixedSize: const Size(100, 30),
                    backgroundColor: Colors.blue,
                    shape: const StadiumBorder(),
                    onPrimary: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  child: const Text(
                    "Edit Profile",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const EditProfilePage()),
                    );
                  }),
            ),

            const SizedBox(height: 70),


          ],
            )
          ),
        );
  }
}
