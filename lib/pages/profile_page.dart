// import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pas/pages/editprofile_page.dart';
import 'package:pas/widget/drawer.dart';
import 'package:pas/widget/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
    String imagePath =
        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png';

    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        drawer: const Drawers(),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: ListView(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 40),
                  child: ProfileWidget(
                    imagePath: imagePath,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Nama',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
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
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(100, 30),
                        backgroundColor: Colors.blue,
                        shape: StadiumBorder(),
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
                )
              ]),
            )
          ],
        ));
  }
}
