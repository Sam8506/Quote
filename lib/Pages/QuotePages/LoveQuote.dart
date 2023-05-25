// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

class LovequatePage extends StatefulWidget {
  const LovequatePage({super.key});
  
  @override
  State<LovequatePage> createState() => _LovequatePageState();
}

class _LovequatePageState extends State<LovequatePage> {
    List LoveQuates = [];
    List authors = [];
    bool isLoad = true;
  @override
  void initState() {
    // TODO: implement initState
    getLoveQuates();
    super.initState();
  }

  getLoveQuates() async{
    String url = "https://quotes.toscrape.com/tag/love/";
    http.Response response = await http.get(Uri.parse(url));
    dom.Document document = parser.parse(response.body);
    final LoveQuateClass = document.getElementsByClassName("quote");
    for(int i=0;i<LoveQuateClass.length;i++){
      //LoveQuates.add(LoveQuateClass[0].getElementsByClassName("text")[0].innerHtml);
      LoveQuates = LoveQuateClass.map((e) => e.getElementsByClassName('text')[0].innerHtml).toList();
      authors = LoveQuateClass.map((e) => e.getElementsByClassName('author')[0].innerHtml).toList();
      // print(LoveQuates);
      // print(authors);
      setState(() {
        isLoad = false;
      });
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // drawer:  const drawerHomePage(),
      appBar: AppBar(
        centerTitle: true,
      
        flexibleSpace: Container(
          decoration: BoxDecoration(
           color: Colors.red
          ),
        ),
        title: const Text('Love Quotes'),
      ),
    
      body: isLoad == true? Center(child: Lottie.asset(
        "assets/Animation/quateLoadAnimation.json",
        height: 200,
        width: 200,
        repeat: true

      )
      )
      :
       ListView.builder(
        physics: const BouncingScrollPhysics(),
         shrinkWrap: true,
         itemCount: LoveQuates.length,
         itemBuilder: (context, index) {
         return  Container(
                     decoration: BoxDecoration(            
                         color: index %2 == 0?const Color(0xffA084DC) : const Color(0xffEBC7E6),
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
                     LoveQuates[index],
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
                                 Share.share(LoveQuates[index]);
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