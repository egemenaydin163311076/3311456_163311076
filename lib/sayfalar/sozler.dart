import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Sozler extends StatefulWidget {
  @override
  _SozlerState createState() => _SozlerState();
}

class _SozlerState extends State<Sozler> {
  String _quote = '';

  Future<void> fetchQuote() async {
    final response = await http.get(Uri.parse('https://api.quotable.io/random'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      setState(() {
        _quote = data['content'];
      });
    } else {
      setState(() {
        _quote = 'Veri çekilemedi.';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchQuote();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // debug yazısını kaldırır
      title: 'Günün Sözü',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        appBar:       AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            tooltip: 'Geri',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation:4,
          centerTitle:false,
          automaticallyImplyLeading: false,
          backgroundColor:Color(0xa0a108e0),
          shape:RoundedRectangleBorder(
            borderRadius:BorderRadius.zero,
          ),
          title:Text(
            "Notlar",
            style:TextStyle(
              fontWeight:FontWeight.w700,
              fontStyle:FontStyle.normal,
              fontSize:20,
              color:Color(0xffffffff),
            ),
          ),
          actions:[
            Icon(Icons.search,color:Color(0xffffffff),size:22),
            Padding(
              padding:EdgeInsets.fromLTRB(8, 0, 16, 0),
              child:Icon(Icons.dashboard,color:Color(0xffffffff),size:22),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Rastgele bir alıntı:',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                _quote,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: fetchQuote,
                child: Text('Yeni Alıntı Getir'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
