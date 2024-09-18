import 'package:flutter/material.dart';
import 'datakelompok.dart';
import 'operasi_angka_screen.dart';
import 'bilangan_ganjil_genap_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> _dataKelompok = [];
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();

  void _tambahDataKelompok() {
    if (_namaController.text.isNotEmpty && _nimController.text.isNotEmpty) {
      setState(() {
        _dataKelompok.add({
          'nama': _namaController.text,
          'nim': _nimController.text,
        });
      });
      _namaController.clear();
      _nimController.clear();

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Berhasil'),
            content: Text('Data berhasil ditambahkan!'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Nama dan NIM tidak boleh kosong!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beranda'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          Card(
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  Text(
                    'Input Data Kelompok',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    controller: _namaController,
                    decoration: InputDecoration(labelText: 'Nama'),
                  ),
                  TextField(
                    controller: _nimController,
                    decoration: InputDecoration(labelText: 'NIM'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _tambahDataKelompok,
                    child: Text('Tambahkan Data'),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          ListTile(
            title: Text('Lihat Data Kelompok'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DataKelompokScreen(
                    dataKelompok: _dataKelompok,
                  ),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text('Operasi Penjumlahan & Pengurangan'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OperasiAngkaScreen()),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text('Bilangan Ganjil & Genap'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BilanganGanjilGenapScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
