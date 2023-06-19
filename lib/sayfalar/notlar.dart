import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: notlar(),
    );
  }
}


class notlar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar:
      AppBar(
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
      body:Align(
        alignment:Alignment.center,
        child:SingleChildScrollView(
          child:
          Column(
            mainAxisAlignment:MainAxisAlignment.start,
            crossAxisAlignment:CrossAxisAlignment.center,
            mainAxisSize:MainAxisSize.min,
            children: [
              Icon(
                Icons.article,
                color:Color(0xff000000),
                size:100,
              ),
              Padding(
                padding:EdgeInsets.fromLTRB(0, 16, 0, 0),
                child:Text(
                  "Yeni Not",
                  textAlign: TextAlign.start,
                  overflow:TextOverflow.clip,
                  style:TextStyle(
                    fontWeight:FontWeight.w400,
                    fontStyle:FontStyle.normal,
                    fontSize:30,
                    color:Color(0xff000000),
                  ),
                ),
              ),
            ],),),),
    )
    ;}
}
