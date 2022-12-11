import 'dart:convert';

import 'package:pas/pages/profile_page.dart';
import 'package:http/http.dart' as http;
import 'package:pas/widget/drawer.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfileState();
}

String profpic = "";

class _EditProfileState extends State<EditProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      drawer: const Drawers(),
      body: Form(
        // key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Change Your Profile Picture",
                      hintText: "Enter your new profile picture URL here...",
                      // Menambahkan icon agar lebih intuitif
                      icon: const Icon(Icons.add_a_photo_rounded),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),

                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        profpic = value!;
                        print(profpic);
                      });
                    },

                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        profpic = value!;
                      });
                    },
                  ),
                ),

                Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: const StadiumBorder(),
                          onPrimary: Colors.white,
                        ),
                        onPressed: () {
                          if (profpic == "") {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 15,
                                  child: ListView(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 20),
                                    shrinkWrap: true,
                                    children: <Widget>[
                                      const Center(
                                          child: Text('Not Saved!',
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      const SizedBox(height: 10),
                                      const Center(
                                          child: Text(
                                              'Your picture has not changed')),
                                      const SizedBox(height: 10),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const ProfilePage()),
                                          );
                                        },
                                        child: const Text('Back To Profile'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 15,
                                  child: ListView(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 20),
                                    shrinkWrap: true,
                                    children: <Widget>[
                                      const Center(
                                          child: Text('Saved!',
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      const SizedBox(height: 10),
                                      const Center(
                                          child: Text(
                                              'Your picture has successfully changed')),
                                      const SizedBox(height: 10),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const ProfilePage()),
                                          );
                                        },
                                        child: const Text('Back To Profile'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          }
                        },
                        child: const Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String getPath(profpic) {
  if (profpic == "") {
    return 'https://img.icons8.com/bubbles/100/000000/user.png';
  } else {
    return profpic;
  }
}

String getpic() {
  if (profpic == "") {
    return 'https://img.icons8.com/bubbles/100/000000/user.png';
  } else {
    return profpic;
  }
}
