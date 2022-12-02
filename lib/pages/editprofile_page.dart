import 'package:pas/pages/profile_page.dart';
import 'package:pas/widget/drawer.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  String _username = "";
  String _email = "";

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
                      icon: const Icon(Icons.people),
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
                    TextButton(
                    child: const Text(
                      "Edit Password",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 15,
                              child: Container(
                                child: ListView(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 20),
                                  shrinkWrap: true,
                                  children: <Widget>[
                                    const Center(child: Text('Sorry')),
                                    const SizedBox(height: 20),
                                    const Center(child: Text('The page is under construction')),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Back To Profile'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      };
                  }),

                const SizedBox(height: 5),
                
                TextButton(
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 15,
                              child: Container(
                                child: ListView(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 20),
                                  shrinkWrap: true,
                                  children: <Widget>[
                                    const Center(child: Text('Saved')),
                                    const SizedBox(height: 20),
                                    const Center(child: Text('Your data has successfully changed')),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => const ProfilePage()),
                                        );
                                      },
                                      child: const Text('Back To Profile'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      };
                  })
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
