// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:e_book1/Menu/TabBarButton.dart/detailsBook.dart';
import 'package:flutter/material.dart';

class homeContent extends StatefulWidget {
  const homeContent({super.key});

  @override
  State<homeContent> createState() => _homeContentState();
}

class _homeContentState extends State<homeContent> {
  late List itBook;
  loadITBook() async {
    await DefaultAssetBundle.of(context)
        .loadString('assets/JSON/ITBook.json')
        .then((s) {
      setState(() {
        itBook = json.decode(s);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    loadITBook();
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: itBook.length == null ? 0 : itBook.length,
        itemBuilder: ((context, i) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => detailBook(book: itBook, index: i),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.all(10),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10),
                        // ignore: prefer_const_literals_to_create_immutables
                        boxShadow: [
                      BoxShadow(
                          blurRadius: 2,
                          offset: Offset(0, 0),
                          color: Colors.grey.withOpacity(0.7))
                    ]),
                child: Container(
                    color: Color.fromARGB(255, 243, 239, 239),
                    child: Row(
                      children: [
                        Container(
                          //padding: EdgeInsets.all(8),
                          height: 160,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // ignore: prefer_const_literals_to_create_immutables
                          ),
                          child: Image.network(
                            itBook[i]["image"],
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                itBook[i]["title"],
                                // ignore: prefer_const_constructors
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                                maxLines: 5,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                itBook[i]["subtitle"],
                                // ignore: prefer_const_constructors

                                maxLines: 5,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    // ignore: prefer_const_constructors
                                    Icon(
                                      Icons.star,
                                      color: const Color.fromARGB(
                                          255, 248, 232, 91),
                                      size: 28,
                                    ),
                                    Text(
                                      itBook[i]["rating"],
                                      // ignore: prefer_const_constructors
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 120,
                                    ),
                                    Text(itBook[i]["price"])
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          );
        }));
  }
}
