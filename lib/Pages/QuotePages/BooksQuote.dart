// ignore_for_file: non_constant_identifier_names, camel_case_types, depend_on_referenced_packages

import 'dart:math';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

class BookquatePage extends StatefulWidget {
  const BookquatePage({super.key});
  
  @override
  State<BookquatePage> createState() => _BookquatePageState();
}

class _BookquatePageState extends State<BookquatePage> {
    List BookQuates = [];
    List authors = [];
    bool isLoad = true;
  @override
  void initState() {
    // TODO: implement initState
    getBookQuates();
    super.initState();
  }

  getBookQuates() async{
    String url = "https://quotes.toscrape.com/tag/books/";
    http.Response response = await http.get(Uri.parse(url));
    dom.Document document = parser.parse(response.body);
    final BookQuateClass = document.getElementsByClassName("quote");
    for(int i=0;i<BookQuateClass.length;i++){
      //BookQuates.add(BookQuateClass[0].getElementsByClassName("text")[0].innerHtml);
      BookQuates = BookQuateClass.map((e) => e.getElementsByClassName('text')[0].innerHtml).toList();
      authors = BookQuateClass.map((e) => e.getElementsByClassName('author')[0].innerHtml).toList();
      // print(BookQuates);
      // print(authors);
      setState(() {
        isLoad = false;
      });
    }
  }
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

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // drawer:  const drawerHomePage(),
      appBar: AppBar(
        centerTitle: true,
      
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [colors[Random().nextInt(7)],colors[Random().nextInt(7)]]),
          ),
        ),
        title: const Text('Book Quotes'),
      ),
    
      body: isLoad == true?  Center(child: Lottie.asset(
        "assets/Animation/quateLoadAnimation.json",
        height: 200,
        width: 200,
        repeat: true

      )
      ):
       ListView.builder(
        physics: const BouncingScrollPhysics(),
         shrinkWrap: true,
         itemCount: BookQuates.length,
         itemBuilder: (context, index) {
         return  Container(
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
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.end,
                       mainAxisAlignment: MainAxisAlignment. spaceAround,
                       children: [
                       Padding(
                         padding: const EdgeInsets.all(16.0),
                         child: ExpandableText(
                     BookQuates[index],
                      maxLines: 5,
                         textAlign: TextAlign.center,
                         
                         style:  GoogleFonts.vollkorn(

                     fontSize: 25,
                     fontWeight: FontWeight.bold
                         ), expandText: '',),
                       ),
                       Padding(
                     padding: const EdgeInsets.only(right:8.0),
                     child: Text(
                       '-${authors[index]}',
                       textAlign: TextAlign.end,
                      style: GoogleFonts.roboto(
                       fontSize: 18
                      ),
                       ),
                       ),
                     Padding(
                       padding: const EdgeInsets.all(0.0),
                       child: Row(
                         
                         crossAxisAlignment: CrossAxisAlignment.end,
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         // ignore: prefer_const_literals_to_create_immutables
                         children: [
                            IconButton(
                             onPressed: (){
                               // flag = !flag;
                             },
                             // icon: flag ? Icon(Icons.favorite) :
                              icon:Icon(Icons.favorite_border_rounded),
                              ),
                            IconButton(
                             onPressed: (){
                               
                             },
                             icon: Icon(Icons.bookmark)),
                            IconButton(
                             onPressed:(){
                                 Share.share(BookQuates[index]);
                             },
                             icon:const Icon(Icons.share)
                             )
                         ],
                       ),
                     )
                       ],
                     )
                   );
       },),
    );
  }
}