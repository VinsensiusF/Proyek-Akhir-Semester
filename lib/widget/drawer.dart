import 'package:flutter/material.dart';
import 'package:pas/pages/profile_page.dart';
import 'package:pas/pages/faq_page.dart';
import 'package:pas/pages/login_page.dart';

import '../main.dart';

import '../main.dart';
import 'package:pas/pages/kategori_page.dart';
import 'package:pas/pages/forum_page.dart';

import 'package:provider/provider.dart';
import 'package:pas/utils/utils.dart';

import '../pages/form_toko.dart';
import '../pages/kategori_details_page.dart';

class Drawers extends StatefulWidget {
  const Drawers({Key? key}) : super(key: key);

  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<Drawers> {
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Padding(
      padding: const EdgeInsets.all(2),
      child: Column(
        children: [
          ListTile(
            title: const Text("Home Page"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyHomePage(
                          title: 'SellerPrism.io',
                        )),
              );
            },
          ),
          ListTile(
            title: const Text("Profile"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
          ListTile(
            title: const Text("Lihat Kategori"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyKategoriPage()),
              );
            },
          ),
          ListTile(
            title: const Text("Forum"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ForumPage()),
              );
            },
          ),
          ListTile(
            title: const Text('FAQ'),
            onTap: () {
              // Route menu ke halaman to do
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyFAQPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Toko'),
            onTap: () {
              // Route menu ke halaman to do
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyKategoriDetailPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Form Toko'),
            onTap: () {
              // Route menu ke halaman to do
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const TokoForm()),
              );
            },
          ),
          ListTile(
            title: const Text('Login'),
            onTap: () {
              // Route menu ke Login Page
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
    ));
  }
}
