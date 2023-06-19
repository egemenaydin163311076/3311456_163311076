import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';


class Ekle extends StatefulWidget {
  @override
  _EkleState createState() => _EkleState();
}

class _EkleState extends State<Ekle> {
  final _formKey = GlobalKey<FormState>();
  final _mesajyaz = TextEditingController();
  final List<String> _mesajlar = [];

  Future<String> get _getDosyaYolu async {
    Directory dosya = await getApplicationDocumentsDirectory();
    return '${dosya.path}/mesajlar.txt';
  }

  Future<void> _kaydet() async {
    if (_formKey.currentState!.validate()) {
      String mesaj = _mesajyaz.text;
      String veri = 'mesaj: $mesaj\n\n';

      String dosyaYolu = await _getDosyaYolu;
      File dosya = File(dosyaYolu);
      dosya.writeAsString(veri, mode: FileMode.append);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Mesaj kaydedildi.'),
        ),
      );

      setState(() {
        _mesajlar.add(mesaj);
      });

      _mesajyaz.clear();
    }
  }

  Future<String> _mesajlariGetir() async {
    String dosyaYolu = await _getDosyaYolu;
    File dosya = File(dosyaYolu);

    if (await dosya.exists()) {
      String dosyaIcerik = await dosya.readAsString();
      return dosyaIcerik;
    } else {
      return '';
    }
  }

  @override
  void dispose() {
    _mesajyaz.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HAYALLER'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _mesajyaz,
                    decoration: InputDecoration(labelText: 'Hayal Ekle'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ''
                            'Bir Hayal Giriniz.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _kaydet,
                    child: Text('Hayal Kur :)'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _mesajlar.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Icon(Icons.cloud),
                      SizedBox(width: 8.0),
                      Text(_mesajlar[index]),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}