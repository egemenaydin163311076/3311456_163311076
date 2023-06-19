import 'package:flutter/cupertino.dart';
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
      home: ayarlar(),
    );
  }
}


class ayarlar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar:
      AppBar(
        elevation:4,
        centerTitle:true,
        automaticallyImplyLeading: false,
        backgroundColor:Color(0xa0a108e0),
        shape:RoundedRectangleBorder(
          borderRadius:BorderRadius.zero,
        ),
        title:Text(
          "AYARLAR",
          style:TextStyle(
            fontWeight:FontWeight.w700,
            fontStyle:FontStyle.normal,
            fontSize:20,
            color:Color(0xffffffff),
          ),
        ),
        leading: IconButton(
          icon: Icon(CupertinoIcons.arrow_left),
          tooltip: 'Geri',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body:
      ListView(
        scrollDirection: Axis.vertical,
        padding:EdgeInsets.all(16),
        shrinkWrap:false,
        physics:ScrollPhysics(),
        children:[

          Padding(
            padding:EdgeInsets.fromLTRB(0, 16, 0, 0),
            child:Row(
              mainAxisAlignment:MainAxisAlignment.start,
              crossAxisAlignment:CrossAxisAlignment.center,
              mainAxisSize:MainAxisSize.max,
              children:[

                Expanded(
                  flex: 1,
                  child: Text(
                    "Avatar",
                    textAlign: TextAlign.start,
                    overflow:TextOverflow.clip,
                    style:TextStyle(
                      fontWeight:FontWeight.w400,
                      fontStyle:FontStyle.normal,
                      fontSize:16,
                      color:Color(0xff000000),
                    ),
                  ),
                ),
                Padding(
                  padding:EdgeInsets.symmetric(vertical: 0,horizontal:8),
                  child:Container(
                    height:30,
                    width:30,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child:Image.network(
                        "https://image.freepik.com/free-photo/pleasant-looking-serious-man-stands-profile-has-confident-expression-wears-casual-white-t-shirt_273609-16959.jpg",
                        fit:BoxFit.cover),
                  ),
                ),
                Icon(
                  CupertinoIcons.arrowshape_turn_up_right,
                  color:Color(0xff000000),
                  size:18,
                ),
              ],),),
          Divider(
            color:Color(0x4d9e9e9e),
            height:16,
            thickness:1,
            indent:0,
            endIndent:0,
          ),
          Padding(
            padding:EdgeInsets.fromLTRB(0, 16, 0, 0),
            child:Row(
              mainAxisAlignment:MainAxisAlignment.start,
              crossAxisAlignment:CrossAxisAlignment.center,
              mainAxisSize:MainAxisSize.max,
              children:[

                Expanded(
                  flex: 1,
                  child: Text(
                    "Isim",
                    textAlign: TextAlign.start,
                    overflow:TextOverflow.clip,
                    style:TextStyle(
                      fontWeight:FontWeight.w400,
                      fontStyle:FontStyle.normal,
                      fontSize:16,
                      color:Color(0xff000000),
                    ),
                  ),
                ),
                Padding(
                  padding:EdgeInsets.symmetric(vertical: 0,horizontal:8),
                  child:Text(
                    "Ali Veli Ziya",
                    textAlign: TextAlign.start,
                    overflow:TextOverflow.clip,
                    style:TextStyle(
                      fontWeight:FontWeight.w400,
                      fontStyle:FontStyle.normal,
                      fontSize:12,
                      color:Color(0xff9e9e9e),
                    ),
                  ),
                ),
                Icon(CupertinoIcons.arrowshape_turn_up_right,
                  color:Color(0xff000000),
                  size:18,
                ),
              ],),),
          Divider(
            color:Color(0x4d9e9e9e),
            height:16,
            thickness:1,
            indent:0,
            endIndent:0,
          ),
          Padding(
            padding:EdgeInsets.fromLTRB(0, 16, 0, 0),
            child:Row(
              mainAxisAlignment:MainAxisAlignment.start,
              crossAxisAlignment:CrossAxisAlignment.center,
              mainAxisSize:MainAxisSize.max,
              children:[

                Expanded(
                  flex: 1,
                  child: Text(
                    "Sifre Degistir",
                    textAlign: TextAlign.start,
                    overflow:TextOverflow.clip,
                    style:TextStyle(
                      fontWeight:FontWeight.w400,
                      fontStyle:FontStyle.normal,
                      fontSize:16,
                      color:Color(0xff000000),
                    ),
                  ),
                ),
                Padding(
                  padding:EdgeInsets.symmetric(vertical: 0,horizontal:8),
                  child:Text(
                    "********",
                    textAlign: TextAlign.start,
                    overflow:TextOverflow.clip,
                    style:TextStyle(
                      fontWeight:FontWeight.w400,
                      fontStyle:FontStyle.normal,
                      fontSize:12,
                      color:Color(0xff9e9e9e),
                    ),
                  ),
                ),
                Icon(CupertinoIcons.arrowshape_turn_up_right,
                  color:Color(0xff000000),
                  size:18,
                ),
              ],),),
          Divider(
            color:Color(0x4d9e9e9e),
            height:16,
            thickness:1,
            indent:0,
            endIndent:0,
          ),
          Padding(
            padding:EdgeInsets.fromLTRB(0, 16, 0, 0),
            child:Row(
              mainAxisAlignment:MainAxisAlignment.start,
              crossAxisAlignment:CrossAxisAlignment.center,
              mainAxisSize:MainAxisSize.max,
              children:[

                Expanded(
                  flex: 1,
                  child: Text(
                    "Email",
                    textAlign: TextAlign.start,
                    overflow:TextOverflow.clip,
                    style:TextStyle(
                      fontWeight:FontWeight.w400,
                      fontStyle:FontStyle.normal,
                      fontSize:16,
                      color:Color(0xff000000),
                    ),
                  ),
                ),
                Padding(
                  padding:EdgeInsets.symmetric(vertical: 0,horizontal:8),
                  child:Text(
                    "aliveliziya@gmail.com",
                    textAlign: TextAlign.start,
                    overflow:TextOverflow.clip,
                    style:TextStyle(
                      fontWeight:FontWeight.w400,
                      fontStyle:FontStyle.normal,
                      fontSize:12,
                      color:Color(0xff9e9e9e),
                    ),
                  ),
                ),
                Icon(
                  CupertinoIcons.arrowshape_turn_up_right,
                  color:Color(0xff000000),
                  size:18,
                ),
              ],),),
        ],),
    )
    ;}
}
