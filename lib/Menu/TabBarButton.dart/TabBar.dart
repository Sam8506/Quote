// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TabBar1 extends StatelessWidget {
  final Color color;
  final String string;

  const TabBar1({super.key, required this.color, required this.string});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width / 3.5,
      height: 45,
      // ignore: sort_child_properties_last
      child: Text(
        string,
        // ignore: prefer_const_constructors
        style: TextStyle(color: Colors.white),
      ),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10),
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
            BoxShadow(
              color: Colors.grey,
              //blurRadius: 7,
              offset: Offset(0, 0),
            )
          ]),
    );
  }
}
