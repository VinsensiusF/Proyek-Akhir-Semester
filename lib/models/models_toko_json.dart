// To parse this JSON data, do
//
//     final toko = tokoFromJson(jsonString);

import 'package:pas/models/models_search_home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

List<Toko> tokoFromJson(String str) =>
    List<Toko>.from(json.decode(str).map((x) => Toko.fromJson(x)));

String tokoToJson(List<Toko> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Toko {
  Toko({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Toko.fromJson(Map<String, dynamic> json) => Toko(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  Fields({
    required this.idToko,
    required this.like,
    required this.namaProduk,
    required this.kategoriProduk,
    required this.hargaProduk,
    required this.gambarProduk,
    required this.deskripsiProduk,
    required this.linkProduk,
    required this.isValid,
  });

  int idToko;
  int like;
  String namaProduk;
  String kategoriProduk;
  int hargaProduk;
  String gambarProduk;
  String deskripsiProduk;
  String linkProduk;
  bool isValid;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        idToko: json["id_toko"],
        like: json["like"],
        namaProduk: json["nama_produk"],
        kategoriProduk: json["kategori_produk"],
        hargaProduk: json["harga_produk"],
        gambarProduk: json["gambar_produk"],
        deskripsiProduk: json["deskripsi_produk"],
        linkProduk: json["link_produk"],
        isValid: json["is_valid"],
      );

  Map<String, dynamic> toJson() => {
        "id_toko": idToko,
        "like": like,
        "nama_produk": namaProduk,
        "kategori_produk": kategoriProduk,
        "harga_produk": hargaProduk,
        "gambar_produk": gambarProduk,
        "deskripsi_produk": deskripsiProduk,
        "link_produk": linkProduk,
        "is_valid": isValid,
      };
}
