// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;

class quatePage extends StatefulWidget {
  const quatePage({super.key});
  
  @override
  State<quatePage> createState() => _quatePageState();
}

class _quatePageState extends State<quatePage> {
  bool flag = false;
  bool loading =true;
  
@override
    
    
  final GlobalKey<ScaffoldState> quatePageKey = GlobalKey<ScaffoldState>();
var data;
var colors = [
    Colors.red,
    Colors.blue,
    Colors.cyan,
    Colors.green,
    Colors.yellow,
    Colors.amber,
    Colors.purple,
    Colors.pink
  ];
bool isLoad = true;

   Future<void> getNewQuate() async{
   
      setState(() {
            //isLoad = false;
               getQuate();
           // isLoad = true;
            });
            

  }
  Future<void> getQuate() async{ 
    final Response =  await http.get(Uri.parse('https://zenquotes.io/api/quotes'));
    if (Response.statusCode == 200) {
    data = jsonDecode(Response.body.toString());
    loading = false;
  } else {
   
    throw Exception('Failed to load album');
  }

  

  }
  //  loadFail() async{
  //   loading = !loading;
  // }
  
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      key:quatePageKey,
      child: Scaffold(
        // drawer:  const drawerHomePage(),
        appBar: AppBar(
          centerTitle: true,
        //  automaticallyImplyLeading: false,
          
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [colors[Random().nextInt(7)],colors[Random().nextInt(7)]]),
            ),
          ),
          title: const Text('Quotes'),
        ),
        // // floatingActionButton: FloatingActionButton(
        // //   shape:  BeveledRectangleBorder(
        // //           borderRadius: BorderRadius.circular(10)
                  
        // //         ),
        // //   backgroundColor: Colors.purple,
        // //   onPressed: (){
        // //     getNewQuate();
        // //   },
        //   child: const Icon(Icons.refresh)),
        body:         
      Stack(
          children: [
            SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: FutureBuilder(
                      future: getQuate(),
                      builder: (context,snapshot){
                      
                        return loading?Center(child: Lottie.asset(
        "assets/Animation/quateLoadAnimation.json",
        height: 200,
        width: 200,
        repeat: true

      )
      ):ListView.builder(
                          shrinkWrap: true,
                          //itemCount: 5,
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) { 
                            print("Length = " + data.length.toString()); 
                          return Container(
                            // height: MediaQuery.of(context).size.height/3,
                            //color: colors[Random().nextInt(5)],
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [colors[Random().nextInt(7)],colors[Random().nextInt(7)]]),
      
                                //color: Colors.deepPurple[300],
                                borderRadius: BorderRadius.circular(8)
                              ),
                              margin: const EdgeInsets.all(10),
                            child: Stack(
                              children: [
                                Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment. spaceAround,
                              children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  data[index]["q"].toString(),
                                textAlign: TextAlign.center,
                                
                                style:  GoogleFonts.vollkorn(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                                )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right:8.0),
                                child: Text(
                                  '-${data[index]["a"]}',
                                  textAlign: TextAlign.end,
                                 style: GoogleFonts.roboto(
                                  fontSize: 18
                                 ),
                                  ),
                              ),
                                Padding(
                                  padding: const EdgeInsets.only(top:10,bottom:10,left:15,right: 15),
                                  child: Row(
                                    
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                       IconButton(
                                        onPressed: (){
                                          flag = !flag;
                                        },
                                         icon: flag ? Icon(Icons.favorite) :Icon(Icons.favorite_border_rounded),
                                         ),
                                       IconButton(
                                        onPressed: (){
                                          
                                        },
                                        icon: Icon(Icons.bookmark)),
                                       IconButton(
                                        onPressed:(){
                                            Share.share(data[index]["q"]);
                                        },
                                        icon:const Icon(Icons.share)
                                        )
                                    ],
                                  ),
                                )
                              ],
                            ),
    
                              ],
                            )
                          );
                        },
                        );
                      }
                    ),
                  ),
                  
                ],
              ),
            ),
            // loading?Lottie.asset("assets/Animation/Ani1.json"):Container(),
          ],
        ),
      ),
    );
  }
}