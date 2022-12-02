import 'dart:convert';
import 'dart:core';

class User {
  String username;
  String email;
  String nama;
  String jenis_kelamin;
  String institusi;
  String kontak;

  User(
      this.email,
      this.username,
      this.nama,
      this.jenis_kelamin,
      this.institusi,
      this.kontak
      );

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'username': username,
      'nama': nama,
      'jenis_kelamin': jenis_kelamin,
      'institusi': institusi,
      'kontak': kontak,
    };
  }

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      map['data']['email'],
      map['data']['username'],
      map['data']['nama'],
      map['data']['jenis_kelamin'],
      map['data']['institusi'],
      map['data']['kontak']
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'User(email: $email, username: $username, nama: $nama, jenis_kelamin: $jenis_kelamin, intitusi: $institusi, kontak: $kontak)';
  }
}