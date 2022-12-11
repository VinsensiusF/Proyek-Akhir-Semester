import 'package:flutter/material.dart';
import 'package:pas/pages/editprofile_page.dart';
import 'package:pas/widget/drawer.dart';
import 'package:pas/function/fetch_profile.dart';
import 'package:pas/widget/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  
  @override
  Widget build(BuildContext context) {
    // final request = context.watch<CookieRequest>();

    return Scaffold(
        appBar: AppBar(
          title: const Text('SellerPrism.io'),
        ),
        drawer: const Drawers(),
        body: FutureBuilder(
            future: fetchProfile(),
            // future: fetchProfile(request),
            builder: (context, AsyncSnapshot snapshot) {

              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());

              } else {

                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Maaf, tidak ada data untuk ditunjukkan.",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 10),
                    ],
                  );

                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => InkWell(
                        child: SingleChildScrollView(
                            child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Colors.blue, Colors.white])),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 16, 0, 40),
                            child: ProfileWidget(
                              imagePath: getpic(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.8,
                          child: ListView(children: <Widget>[

                            Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  
                                  FloatingActionButton(
                                    onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const EditProfilePage()),
                                        );
                                      },
                                      child: const Icon(Icons.add_a_photo_rounded),
                                  ),
                                ],
                              ),
                          ),

                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Username',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),

                                  Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                      padding: const EdgeInsets.all(15.0),
                                      height: 65,
                                      width: 10000,
                                      decoration: BoxDecoration(
                                        color:Colors.white,
                                        borderRadius: BorderRadius.circular(8.0),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black,
                                            blurRadius: 0.7
                                          )
                                        ],
                                      ),

                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                      Text(
                                        "${snapshot.data![index].fields.username}",
                                        style: const TextStyle(
                                          fontSize: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Email',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),

                                  Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                      padding: const EdgeInsets.all(15.0),
                                      height: 65,
                                      width: 10000,
                                      decoration: BoxDecoration(
                                        color:Colors.white,
                                        borderRadius: BorderRadius.circular(8.0),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black,
                                            blurRadius: 0.7
                                          )
                                        ],
                                      ),

                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                      Text(
                                        "${snapshot.data![index].fields.email}",
                                        style: const TextStyle(
                                          fontSize: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),

                    
                          ]),
                        ),
                      ],
                    ))),
                  );
                }
              }
            }));
  }
}
