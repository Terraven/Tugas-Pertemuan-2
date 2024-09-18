import 'package:flutter/material.dart';

class OperasiAngkaScreen extends StatefulWidget {
  @override
  _OperasiAngkaScreenState createState() => _OperasiAngkaScreenState();
}

class _OperasiAngkaScreenState extends State<OperasiAngkaScreen> {
  final TextEditingController _angkaPertamaController = TextEditingController();
  final TextEditingController _angkaKeduaController = TextEditingController();
  String _selectedOperation = 'Penjumlahan';
  String _hasil = '';
  String _errorMessage = '';

  void _hitungHasil() {
    String inputPertama = _angkaPertamaController.text;
    String inputKedua = _angkaKeduaController.text;

    int? angkaPertama = int.tryParse(inputPertama);
    int? angkaKedua = int.tryParse(inputKedua);

    if (angkaPertama == null || angkaKedua == null) {
      setState(() {
        _errorMessage = 'Masukkan bilangan yang valid!';
        _hasil = '';
      });
    } else {
      setState(() {
        _errorMessage = '';
        if (_selectedOperation == 'Penjumlahan') {
          _hasil = (angkaPertama + angkaKedua).toString();
        } else if (_selectedOperation == 'Pengurangan') {
          _hasil = (angkaPertama - angkaKedua).toString();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Operasi Penjumlahan & Pengurangan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _angkaPertamaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan Angka Pertama',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: _selectedOperation,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedOperation = newValue!;
                });
              },
              items: <String>['Penjumlahan', 'Pengurangan']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _angkaKeduaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan Angka Kedua',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _hitungHasil,
              child: Text('Hitung'),
            ),
            SizedBox(height: 20),
            if (_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style: TextStyle(color: Colors.red),
              ),
            SizedBox(height: 10),
            Text(
              'Hasil: $_hasil',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
