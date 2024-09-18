import 'package:flutter/material.dart';

class BilanganGanjilGenapScreen extends StatefulWidget {
  @override
  _BilanganGanjilGenapScreenState createState() =>
      _BilanganGanjilGenapScreenState();
}

class _BilanganGanjilGenapScreenState extends State<BilanganGanjilGenapScreen> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';

  void _checkNumber() {
    String input = _controller.text;
    int? number = int.tryParse(input);
    
    if (number == null) {
      setState(() {
        _result = 'Masukkan bilangan yang valid!';
      });
    } else if (number % 2 == 0) {
      setState(() {
        _result = '$number adalah bilangan Genap';
      });
    } else {
      setState(() {
        _result = '$number adalah bilangan Ganjil';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bilangan Ganjil/Genap'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Masukkan Bilangan'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkNumber,
              child: Text('Cek'),
            ),
            SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
