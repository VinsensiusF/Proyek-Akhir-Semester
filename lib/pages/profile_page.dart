import 'package:flutter/material.dart';
import 'package:pas/pages/editprofile_page.dart';
// import 'package:pas/utils/utils.dart';
import 'package:pas/widget/drawer.dart';
import 'package:pas/function/fetch_profile.dart';
import 'package:pas/widget/profile_widget.dart';

// import 'package:provider/provider.dart';
// import 'package:profile/profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    String imagePath = 'https://img.icons8.com/bubbles/100/000000/user.png';
    // final double? minRadius = 40;
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
                          child:
                           Padding(
                            padding: const EdgeInsets.fromLTRB(0, 16, 0, 40),
                            child: ProfileWidget(
                              imagePath: imagePath,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.8,
                          child: ListView(children: <Widget>[
                            // Container(
                            //   padding: const EdgeInsets.symmetric(horizontal: 30),
                            //   child: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: const [
                            //       Text(
                            //         'Nama',
                            //         style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            //       ),
                            //       Text(
                            //         'Your name will be shown here ...',
                            //         style: TextStyle(fontSize: 16, height: 2),
                            //       ),
                            //       SizedBox(height: 10),
                            //     ],
                            //   ),
                            // ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Username',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    // 'Your username will be shown here ...',
                                    "${snapshot.data![index].fields.username}",
                                    style: const TextStyle(
                                        fontSize: 16, height: 2),
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
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    // 'Your email will be shown here ...',
                                    "${snapshot.data![index].fields.email}",
                                    style: const TextStyle(
                                        fontSize: 16, height: 2),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 20, 20, 20),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    shape: const StadiumBorder(),
                                    onPrimary: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 32, vertical: 12),
                                  ),
                                  child: const Text(
                                    "Edit Profile",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const EditProfilePage()),
                                    );
                                  }),
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

// Widget imageProfile() {
//   return Stack(
//     children: <Widget>[
//       CircleAvatar(
//         radius: 80.0,
//         backgroundImage: ,
//       )
//     ]
//   );
// }
