class DataToko {
  static List<DataToko> tokoList = [];
  String namatoko;
  String deskripsi;
  int nomor;
  String alamat;
  String link;

  DataToko({
    required this.namatoko,
    required this.deskripsi,
    required this.nomor,
    required this.alamat,
    required this.link,
  });

  static void tambahToko({
    required namatoko,
    required deskripsi,
    required nomor,
    required alamat,
    required link,
  }) {
    tokoList.add(DataToko(
        namatoko: namatoko,
        deskripsi: deskripsi,
        nomor: nomor,
        alamat: alamat,
        link: link));
  }
}
