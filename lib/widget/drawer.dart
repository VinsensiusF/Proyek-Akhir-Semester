import 'package:flutter/material.dart';
import 'package:pas/pages/daftar_proyek_page.dart';
import '../main.dart';
import '/pages/login_page.dart';
import 'package:provider/provider.dart';
import 'package:pas/utils/utils.dart';

class NavigationDrawerWidget extends StatefulWidget {
  @override
  _NavigationDrawerWidget createState() => _NavigationDrawerWidget();
}
class _NavigationDrawerWidget extends State<NavigationDrawerWidget> {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  CookieRequest request = CookieRequest();
  String username = "";
  String email = "";
  bool is_admin = false;
  bool is_subscribed = false;
  int id = 0;
  bool loggedIn = false;

  Future<void> submit(BuildContext context) async {
    //const url = "http://127.0.0.1:8000/auth/logout_flutter/";
    const url = "http://127.0.0.1:8000/logout_flutter/";
    final response = await request.logoutAccount(url);
    if (response['status'] == "loggedout") {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Successfully logged out!"),
      ));
      setState(() {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => DaftarProyekPage(),
        ));
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("An error occured, please try again."),
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final _request = Provider.of<CookieRequest>(context, listen: false);

      if (!_request.loggedIn) {
      } else {
        setState(() {
          request = _request;
          loggedIn = _request.loggedIn;
          username = _request.username;
          email = _request.email;
          is_admin = _request.is_admin;
          is_subscribed = _request.is_subscribed;
          id = _request.id;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: Material(
        color: Colors.blue,
        child: ListView(
          children: <Widget>[
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  Text(
                    "Welcome To Project Channel",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  loggedIn? const SizedBox(height: 24) : const SizedBox(height: 0),
                  loggedIn? buildMenuItem(
                    text: 'Profile',
                    icon: Icons.person,
                    onClicked: () => selectedItem(context, 0),
                  ) : const SizedBox(height: 0),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Daftar Proyek',
                    icon: Icons.folder_open,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  (!is_admin)? const SizedBox(height: 16) : const SizedBox(height: 0),
                  (loggedIn && !is_admin)? buildMenuItem(
                    text: 'Buat Proyek',
                    icon: Icons.add_circle_outline,
                    onClicked: () => selectedItem(context, 2),
                  ) : const SizedBox(height: 0),
                  (loggedIn && !is_admin)? const SizedBox(height: 16) : const SizedBox(height: 0),
                  (loggedIn && !is_admin)? buildMenuItem(
                    text: 'Proyek Saya',
                    icon: Icons.folder_special,
                    onClicked: () => selectedItem(context, 4),
                  ) : const SizedBox(height: 0),
                  (loggedIn && !is_admin)? const SizedBox(height: 16) : const SizedBox(height: 0),
                  Divider(color: Colors.white70),
                  (loggedIn && !is_admin)? const SizedBox(height: 16) : const SizedBox(height: 0),
                  buildMenuItem(
                    text: 'FAQ',
                    icon: Icons.question_answer,
                    onClicked: () => selectedItem(context, 5),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: loggedIn? 'Logout': 'Login',
                    icon: Icons.login,
                    onClicked: () => selectedItem(context, 6),
                  ),
                  
                  (loggedIn && !is_subscribed)? const SizedBox(height: 16) : const SizedBox(height: 0),
                  (loggedIn && !is_subscribed)? buildMenuItem(
                    text: 'Berlangganan',
                    icon: Icons.next_week_rounded,
                    onClicked: () => selectedItem(context, 7),
                  ) : const SizedBox(height: 0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
              CircleAvatar(
                radius: 24,
                backgroundColor: Color.fromRGBO(30, 60, 168, 1),
                child: Icon(Icons.add_comment_outlined, color: Colors.white),
              )
            ],
          ),
        ),
      );

  Widget buildSearchField() {
    final color = Colors.white;

    return TextField(
      style: TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Search',
        hintStyle: TextStyle(color: color),
        prefixIcon: Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text, 
    required IconData icon,
    required final Function() onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DaftarProyekPage(),
        ));
        break;
      case 6:
        if (!loggedIn){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => LoginPage(),
          ));
        }
        else {
          submit(context);
        }
        break;
    }
  }
}
