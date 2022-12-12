import 'package:flutter/material.dart';
import 'package:pas/widget/drawer.dart';
import 'package:pas/pages/login_page.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pas/models/faq_models.dart';
import 'dart:convert';
import 'package:pas/main.dart';
import 'package:provider/provider.dart';
import 'package:pas/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:pas/pages/faq_form.dart';
import 'package:pas/function/fetch_faq.dart';

class MyFAQPage extends StatefulWidget {
  const MyFAQPage({super.key});

  @override
  State<MyFAQPage> createState() => _MyFAQPageState();
}

class _MyFAQPageState extends State<MyFAQPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("FAQ"),
      ),
      drawer: const Drawers(),
      body: Container(
          child: Padding(
        padding: EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: FloatingActionButton.extended(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyFAQForm()),
                  ),
                  label: const Text('Buat FAQ'),
                  icon: const Icon(Icons.add),
                ),
              ),
              FutureBuilder(
                future: fetchFAQ(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (!snapshot.hasData) {
                      return Column(
                        children: const [
                          Text(
                            "Tidak ada to do list :(",
                            style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                          ),
                          SizedBox(height: 8),
                        ],
                      );
                    } else {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, index) => NullFAQCheck(_, index, snapshot, request, context));
                    }
                  }
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}

Widget NullFAQCheck(BuildContext _, int index, AsyncSnapshot snapshot, CookieRequest request, BuildContext context)  {
  if (snapshot.data![index].fields.question == "" && snapshot.data![index].fields.answer == "") {
    return Container();
  } else {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          GFAccordion(
            title: snapshot.data![index].fields.question,
            content: snapshot.data![index].fields.answer,
            titleBorder: Border.all(),
            titlePadding: EdgeInsets.all(18.0),
            contentPadding: EdgeInsets.all(20.0),
            titleBorderRadius: BorderRadius.circular(20),
            collapsedTitleBackgroundColor: Colors.white10,
          ),
          TextButton(
              onPressed: () async {
                  String url = "https://medsos-umkm.up.railway.app/adminfaq/delete_faq/" + snapshot.data![index].pk.toString() + "/";
                  final response = await request.get(url);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyFAQPage()
                    ),
                  );
              },
              child: Text("Delete")
          )
        ],
      )
    );
  }
}
