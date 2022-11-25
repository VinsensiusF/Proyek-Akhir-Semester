import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pas/utils/utils.dart';
import '/widget/drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DaftarProyekPage extends StatefulWidget {
  @override
  _DaftarProyekPageState createState() => _DaftarProyekPageState();
}

class _DaftarProyekPageState extends State<DaftarProyekPage> {
  List<Widget> daftarProyek = [];

  CookieRequest request = CookieRequest();
  late bool loggedIn;
  int id = 0;
  String username = "";
  String email = "";
  bool is_admin = false;
  bool is_subscribed = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final _request = Provider.of<CookieRequest>(context, listen: false);

      if (_request.loggedIn) {
        request = _request;
        loggedIn = _request.loggedIn;
        id = _request.id;
        username = _request.username;
        email = _request.email;
        is_admin = _request.is_admin;
        is_subscribed = _request.is_subscribed;
      } 
      getData();
    });
  }

  getData() async {
    Future<List<Widget>> dataProyek;
    if (is_admin)
      dataProyek = getDaftarProyekAdmin();
    else
      dataProyek = getDaftarProyek();
    daftarProyek = await dataProyek;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          // The title text which will be shown on the action bar
          title: Text("Daftar Proyek"),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / (4 / 3),
              child: ListView(
                  controller: ScrollController(), 
                  children: daftarProyek 
                  ),
            ),
          ],
        ));
  }

  Widget buildProjectCard({
    required int idProject,
    required String namaProject,
    required int bayaran,
    required String deskripsi,
    required String estimasi,
  }) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 1.0, color: Colors.deepPurple),
          left: BorderSide(width: 1.0, color: Colors.deepPurple),
          right: BorderSide(width: 1.0, color: Colors.deepPurple),
          bottom: BorderSide(width: 1.0, color: Colors.deepPurple),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 5),
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: 250,
                    child: Text(
                      namaProject,
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                              width: 2.0, color: Colors.deepPurple.shade200),
                          left: BorderSide(
                              width: 2.0, color: Colors.deepPurple.shade200),
                          right: BorderSide(
                              width: 2.0, color: Colors.deepPurple.shade200),
                          bottom: BorderSide(
                              width: 2.0, color: Colors.deepPurple.shade200),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(5),
                      // margin: EdgeInsets.only(right: 10),
                      child: Row(
                        children: [
                          Icon(Icons.attach_money_sharp),
                          Text("Rp " + bayaran.toString()),
                        ],
                      )),
                  Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                              width: 2.0, color: Colors.deepPurple.shade200),
                          left: BorderSide(
                              width: 2.0, color: Colors.deepPurple.shade200),
                          right: BorderSide(
                              width: 2.0, color: Colors.deepPurple.shade200),
                          bottom: BorderSide(
                              width: 2.0, color: Colors.deepPurple.shade200),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(5),
                      // margin: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Icon(Icons.timer),
                          Text(estimasi),
                        ],
                      )),
                ]),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  child: Text(
                    deskripsi,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<List<Widget>> getDaftarProyek() async {
    List<Widget> result = [];

    String apiURL = 'https://project-channel.herokuapp.com/get_project/';

    var apiResult = await http.get(Uri.parse(apiURL));
    var jsonObject = json.decode(apiResult.body);
    var proyekData =
        json.decode((jsonObject as Map<String, dynamic>)['projects']);

    for (var proyek in proyekData) {
      if (proyek['fields']['acc'] && proyek['fields']['buka']) {
        result.add(buildProjectCard(
            idProject: proyek['pk'],
            namaProject: proyek['fields']['nama_project'],
            bayaran: proyek['fields']['bayaran'],
            deskripsi: proyek['fields']['deskripsi'],
            estimasi: proyek['fields']['estimasi']
          )
        );
      }
    }
    
    if (result.isEmpty) {
      result.add(SizedBox(
        height: MediaQuery.of(context).size.height,
        child: const Center(
          child: Text("Mohon maaf, belum ada proyek yang tersedia untuk saat ini")
          )
        ),
      );
    }
    return result;
  }

  Future<List<Widget>> getDaftarProyekAdmin() async {
    List<Widget> result = [];

    String apiURL = 'https://project-channel.herokuapp.com/get_project/';

    var apiResult = await http.get(Uri.parse(apiURL));
    var jsonObject = json.decode(apiResult.body);
    var proyekData =
        json.decode((jsonObject as Map<String, dynamic>)['projects']);

    for (var proyek in proyekData) {
      result.add(buildProjectCard(
            idProject: proyek['pk'],
            namaProject: proyek['fields']['nama_project'],
            bayaran: proyek['fields']['bayaran'],
            deskripsi: proyek['fields']['deskripsi'],
            estimasi: proyek['fields']['estimasi']
        )
      );
    }
    if (result.isEmpty) {
      result.add(SizedBox(
        height: MediaQuery.of(context).size.height,
        child: const Center(
          child: Text("Belum ada proyek yang tersedia saat ini")
          )
        ),
      );
    }
    return result;
  }
}
