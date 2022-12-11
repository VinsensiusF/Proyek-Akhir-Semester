import 'dart:convert';

import 'package:pas/pages/editpassword_page.dart';
import 'package:pas/pages/profile_page.dart';
import 'package:http/http.dart' as http;
import 'package:pas/widget/drawer.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  // late String status;

  String _username = "";
  String _email = "";
  

  Future<void> submit(BuildContext context, String username) async {
    String uname = username;
    // print(uname);
    final response = await http.post(
        Uri.parse('https://medsos-umkm.up.railway.app/edit_profile/$uname'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          'username': _username,
          'email': _email,
        }));
    print(_username);
    print(_email);

    Map<String, dynamic> extractedData = jsonDecode(response.body);
    // status = extractedData['status'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      drawer: const Drawers(),
      body: Form(
        key: _formKey,
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
                      labelText: "Username",
                      hintText: "Enter your new username here ...",
                      // Menambahkan icon agar lebih intuitif
                      icon: const Icon(Icons.people),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),

                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _username = value!;
                      });
                    },

                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _username = value!;
                      });
                    },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "Enter your new email here ...",
                      // Menambahkan icon agar lebih intuitif
                      icon: const Icon(Icons.email),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),

                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _email = value!;
                      });
                    },

                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _email = value!;
                      });
                    },
                  ),
                ),
                Column(
                  children: [
                    // const SizedBox(height: 10),
                    // ElevatedButton(
                    //     style: ElevatedButton.styleFrom(
                    //       // elevation: 15,
                    //       backgroundColor: Colors.blue,
                    //       shape: const StadiumBorder(),
                    //       onPrimary: Colors.white,
                    //       // padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    //     ),
                    //     child: const Text(
                    //       "Edit Password",
                    //       style: TextStyle(color: Colors.white),
                    //     ),
                    //     onPressed: () {
                    //       Navigator.of(context).push(
                    //         MaterialPageRoute(
                    //             builder: (context) => const EditPasswordPage()),
                    //       );
                    //     }),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // backgroundColor: MaterialStateProperty.all(Colors.blue),
                          backgroundColor: Colors.blue,
                          shape: const StadiumBorder(),
                          onPrimary: Colors.white,
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            String username = 'halo1';
                            submit(context, username);

                            // if (status == 'success') {
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
                                        const Center(child: Text('Saved!', style: TextStyle(fontWeight:FontWeight.bold))),
                                        const SizedBox(height: 10),
                                        const Center(
                                            child: Text(
                                                'Your data has successfully changed')),
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
                            // } else {
                            //   showDialog(
                            //   context: context,
                            //   builder: (context) {
                            //     return Dialog(
                            //       shape: RoundedRectangleBorder(
                            //         borderRadius: BorderRadius.circular(10),
                            //       ),
                            //       elevation: 15,
                            //       child: ListView(
                            //         padding: const EdgeInsets.only(
                            //             top: 20, bottom: 20),
                            //         shrinkWrap: true,
                            //         children: <Widget>[
                            //           const Center(child: Text('Not Saved.', style: TextStyle(fontWeight:FontWeight.bold))),
                            //           const SizedBox(height: 10),
                            //           const Center(
                            //               child: Text(
                            //                   'Sorry, Your data can not be changed')),
                            //           const SizedBox(height: 10),
                            //           TextButton(
                            //             onPressed: () {
                            //               Navigator.pop(context);
                            //               Navigator.of(context).push(
                            //                 MaterialPageRoute(
                            //                     builder: (context) =>
                            //                         const ProfilePage()),
                            //               );
                            //             },
                            //             child: const Text('Back To Profile'),
                            //           ),
                            //         ],
                            //       ),
                            //     );
                            //   },
                            // );
                            // }
                          }
                          ;
                        },
                        child: const Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
