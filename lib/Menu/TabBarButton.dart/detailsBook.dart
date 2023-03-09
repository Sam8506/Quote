import 'dart:convert';

import 'package:flutter/material.dart';

class detailBook extends StatelessWidget {
  final List book;
  final int index;
  const detailBook({Key? key, required this.book, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.yellow,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color.fromARGB(255, 143, 5, 223),
        elevation: 0.0,
        title: Text(
          book[index]["title"],
          style: TextStyle(
              color: Color.fromARGB(255, 235, 238, 29),
              fontWeight: FontWeight.bold,
              wordSpacing: 2.5),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.07),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(40, 50),
                      bottomRight: Radius.elliptical(40, 50))),
              child: Image.network(book[index]["image"]),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
                child: SingleChildScrollView(
                    child: Container(
                        color: Colors.grey.withOpacity(0.07),
                        child: Text(
                          book[0]["summary"],
                          style: TextStyle(),
                        ))))
          ],
        ),
      ),
    );
  }
}
