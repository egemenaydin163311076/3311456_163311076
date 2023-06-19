import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../database/db_helper.dart';
import '../model/odeme.dart';



class FormOdeme extends StatefulWidget {
  final Odeme? odeme;

  FormOdeme({this.odeme});

  @override
  _FormOdemeState createState() => _FormOdemeState();
}

class _FormOdemeState extends State<FormOdeme> {
  DbHelper db = DbHelper();

  TextEditingController? odemeturu;
  TextEditingController? lastName;
  TextEditingController? tutar;
  TextEditingController? sonoedemetarihi;
  TextEditingController? sirket;

  @override
  void initState() {
    odemeturu = TextEditingController(
        text: widget.odeme == null ? '' : widget.odeme!.odemeturu);

    tutar = TextEditingController(
        text: widget.odeme == null ? '' : widget.odeme!.tutar);

    sonoedemetarihi = TextEditingController(
        text: widget.odeme == null ? '' : widget.odeme!.sonodemetarihi);

    sirket = TextEditingController(
        text: widget.odeme == null ? '' : widget.odeme!.sirket);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ÖDEME EKLE'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: TextField(
              controller: odemeturu,
              decoration: InputDecoration(
                  labelText: 'Ödeme Türü',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: TextField(
              controller: tutar,
              decoration: InputDecoration(
                  labelText: 'Tutar',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: TextField(
                controller: sonoedemetarihi,
                decoration: InputDecoration(
                  labelText: 'Son Ödeme Tarihi',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              )

          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: TextField(
              controller: sirket,
              decoration: InputDecoration(
                  labelText: 'Şirket İsmi',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20
            ),
            child: ElevatedButton(
              child: (widget.odeme == null)
                  ? Text(
                'Ekle',
                style: TextStyle(color: Colors.white),
              )
                  : Text(
                'Güncelle',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                upsertOdeme();
              },
            ),
          )
        ],
      ),
    );
  }

  Future<void> upsertOdeme() async {
    if (widget.odeme != null) {
      //update
      await db.updateOdeme(Odeme(
          id: widget.odeme!.id,
          odemeturu: odemeturu!.text,
          tutar: tutar!.text,
          sonodemetarihi: sonoedemetarihi!.text,
          sirket: sirket!.text
      ));

      Navigator.pop(context, 'Güncelle');
    } else {
      //insert
      await db.saveOdeme(Odeme(
        odemeturu: odemeturu!.text,
        tutar: tutar!.text,
        sonodemetarihi: sonoedemetarihi!.text,
        sirket: sirket!.text,
      ));
      Navigator.pop(context, 'Kaydet');
    }
  }
}