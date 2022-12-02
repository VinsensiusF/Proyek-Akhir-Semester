// To parse this JSON data, do
//
//     final Kategori = myWatchlistFromJson(jsonString);
import 'dart:convert';

List<Kategori> KategoriFromJson(String str) => List<Kategori>.from(
    json.decode(str).map((x) => Kategori.fromJson(x)));

String KategoriToJson(List<Kategori> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Kategori {
  Kategori({
    required this.pk,
    required this.fields,
  });

  int pk;
  Fields fields;

  factory Kategori.fromJson(Map<String, dynamic> json) => Kategori(
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  Fields({
    required this.nama,
    required this.deskripsi,
    // required this.gambar,
    required this.file_url,
  });

  String nama;
  String deskripsi;
//   Type gambar;
  String file_url;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        nama: json["nama"],
        deskripsi: json["deskripsi"],
        file_url: json["file_url"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "deskripsi": deskripsi,
        "file_url": file_url,
      };
}