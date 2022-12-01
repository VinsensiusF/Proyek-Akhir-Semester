import 'package:flutter/material.dart';
import 'package:pas/pages/faq_page.dart';

import '../main.dart';

class Drawers extends StatefulWidget {
  const Drawers({ Key? key }) : super(key: key);

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
                    MaterialPageRoute(builder: (context) => const MyFAQPage()),
                  );
                },
              ),
            ],
          ),
        )
    );
  }
}