import 'package:flutter/material.dart';
import 'package:pas/main.dart';
import 'package:pas/widget/drawer.dart';
import 'package:pas/function/fetch_kategori.dart';
import 'package:pas/pages/kategori_form_page.dart';
import 'package:pas/pages/kategori_details_page.dart';


class MyKategoriPage extends StatefulWidget {
    const MyKategoriPage({super.key});

    @override
    State<MyKategoriPage> createState() => _MyListPageState();
}

class _MyListPageState extends State<MyKategoriPage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('SellerPrism.io'),
            ),
            drawer: const Drawers(),
            body: FutureBuilder(
                    future: fetchKategori(),
                    builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.data == null) {
                            return const Center(child: CircularProgressIndicator());

                        } else {
                            if (!snapshot.hasData) {
                                return Column(
                                    children: const [
                                    Text("Tidak ada kategori tersedia :(", style: TextStyle(color: Color(0xff59A5D8), fontSize: 20
                                ),
                                ),
                                SizedBox(height: 8),
                                ],
                            );
                            } else {
                            return ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (_, index) => Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Material(
                                            elevation: 2.0,
                                            borderRadius: BorderRadius.circular(5.0),
                                            color: Colors.white,
                                            shadowColor: Colors.blueGrey,
                                            
                                            child: ListTile(
                                                onTap: () {
                                                // Route menu ke halaman details
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                    builder: (context) =>
                                                        MyKategoriDetailPage(
                                                    ),
                                                    ));
                                            },
                                                leading: Icon(Icons.category),
                                                title: Text(snapshot.data![index].fields.nama),
                                                subtitle: Text(snapshot.data![index].fields.deskripsi),
                                            )
                                        ),
                                    )
                                    
                            );
                            }
                        }
                    }
                ),
                    floatingActionButton: Padding(
        padding : const EdgeInsets.fromLTRB(40,10,10,10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Align(

            ),
            Align(
                alignment: Alignment.bottomLeft,
                child: FloatingActionButton.extended(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyKategoriFormPage()
                      ),
                    ),
                label: const Text('Tambah Kategori'),
                icon: const Icon(Icons.add),
                ),
            ),
          ],
        )
        //child: Container(
        //),
    ),
            
            

 
        );
    }
}
    
