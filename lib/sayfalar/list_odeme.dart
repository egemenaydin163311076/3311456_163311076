import 'package:flutter/material.dart';
import 'form_odeme.dart';
import '../database/db_helper.dart';
import '../model/odeme.dart';

class ListOdemePage extends StatefulWidget {
  const ListOdemePage({Key? key}) : super(key: key);

  @override
  _ListOdemePageState createState() => _ListOdemePageState();
}

class _ListOdemePageState extends State<ListOdemePage> {
  List<Odeme> listOdeme = [];
  DbHelper db = DbHelper();

  @override
  void initState() {
    _getAllOdeme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Ödemeler"),
        ),
      ),
      body: ListView.builder(
          itemCount: listOdeme.length,
          itemBuilder: (context, index) {
            Odeme odeme = listOdeme[index];
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ListTile(
                leading: Icon(
                  Icons.monetization_on_sharp,
                  size: 50,
                ),
                title: Text('${odeme.odemeturu}'),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                      ),
                      child: Text("Son Ödeme Tarihi: ${odeme.sonodemetarihi}"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                      ),
                      child: Text("Tutar: ${odeme.tutar}"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                      ),
                      child: Text("Şirket: ${odeme.sirket}"),
                    )
                  ],
                ),
                trailing: FittedBox(
                  fit: BoxFit.fill,
                  child: Row(
                    children: [
                      // button edit
                      IconButton(
                          onPressed: () {
                            _openFormEdit(odeme);
                          },
                          icon: Icon(Icons.edit)),
                      // button hapus
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          AlertDialog hapus = AlertDialog(
                            title: Text("Bilgilerndirme"),
                            content: Container(
                              height: 100,
                              child: Column(
                                children: [
                                  Text(
                                      "${odeme.odemeturu} Silmek İstediğinizden Emin Misiniz?")
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    _deleteOdeme(odeme, index);
                                    Navigator.pop(context);
                                  },
                                  child: Text("Evet")),
                              TextButton(
                                child: Text('Hayır'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                          showDialog(
                              context: context, builder: (context) => hapus);
                        },
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _openFormCreate();
        },
      ),
    );
  }

  Future<void> _getAllOdeme() async {
    var list = await db.getAllOdeme();

    setState(() {
      listOdeme.clear();

      list!.forEach((odeme) {
        listOdeme.add(Odeme.fromMap(odeme));
      });
    });
  }

  Future<void> _deleteOdeme(Odeme odeme, int position) async {
    await db.deleteOdeme(odeme.id!);
    setState(() {
      listOdeme.removeAt(position);
    });
  }

  Future<void> _openFormCreate() async {
    var result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => FormOdeme()));
    if (result == 'Kaydet') {
      await _getAllOdeme();
    }
  }

  Future<void> _openFormEdit(Odeme odeme) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => FormOdeme(odeme: odeme)));
    if (result == 'Güncelle') {
      await _getAllOdeme();
    }
  }
}
