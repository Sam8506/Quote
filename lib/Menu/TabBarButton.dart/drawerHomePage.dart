// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:e_book1/Pages/QuotePages/quatePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class drawerHomePage extends StatefulWidget {
  const drawerHomePage({super.key});

  @override
  State<drawerHomePage> createState() => _drawerHomePageState();
}

class _drawerHomePageState extends State<drawerHomePage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.pink),
              accountName: const Text("Samir Patel"),
              accountEmail: const Text("sam90@gmail.com"),
              currentAccountPicture: GestureDetector(
                child:  CircleAvatar(
                  child:  Text(
                    "SP",
                    style: TextStyle(
                        color: Colors.pink,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                onTap: (){Navigator.popAndPushNamed(context, "home");},
                leading: const Icon(Icons.home, color: Colors.pink),
                title:const  Text("Home Page"),
              ),
            ),
            InkWell(
              onTap: null,
              child: ListTile(
                onTap: (){},
                leading: Icon(Icons.person, color: Colors.black),
                title: Text("My Profile"),
              ),
            ),
            InkWell(
              onTap: (){
               
              },
              child: ListTile(
                onTap: (){ 
                  Navigator.pushNamed(context, 'selectQuote');
                },
                leading: Icon(Icons.shopping_basket, color: Colors.red),
                title: Text("Quate"),
              ),
            ),
            InkWell(
              child:ListTile
              (title
              : const Text('Saved Quate')) ,
            ),
            Divider(),
            InkWell(
              onTap: null,
              child: ListTile(
                leading: Icon(Icons.help, color: Colors.green),
                title: Text("About"),
              ),
            ),
            InkWell(
              onTap: null,
              child: ListTile(
                leading: Icon(
                  Icons.power_settings_new,
                  color: Colors.black,
                ),
                title: Text("Log out"),
              ),
            )
          ],
        ),
      );
  }
}