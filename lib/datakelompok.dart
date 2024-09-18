import 'package:flutter/material.dart';

class DataKelompokScreen extends StatelessWidget {
  final List<Map<String, String>> dataKelompok;

  DataKelompokScreen({required this.dataKelompok});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Kelompok'),
      ),
      body: ListView.builder(
        itemCount: dataKelompok.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Nama: ${dataKelompok[index]['nama']}'),
            subtitle: Text('NIM: ${dataKelompok[index]['nim']}'),
          );
        },
      ),
    );
  }
}
