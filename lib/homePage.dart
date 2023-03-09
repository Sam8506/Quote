// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison, prefer_if_null_operators

import 'dart:convert';

import 'package:e_book1/Menu/BOOKS/detailTrending.dart';
import 'package:e_book1/Menu/TabBarButton.dart/TabBar.dart';
import 'package:e_book1/Menu/TabBarButton.dart/drawerHomePage.dart';
import 'package:e_book1/Menu/TabBarButton.dart/homeContent.dart';
import 'package:e_book1/Theme/AppColor.dart' as AppColor;
import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  static late List popularBooks;
  const homepage({super.key});
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage>
    with SingleTickerProviderStateMixin {
  
  final GlobalKey<ScaffoldState> homePageKey= GlobalKey<ScaffoldState>();
  late ScrollController _scrollController;
  late TabController _tabController;

  // ignore: non_constant_identifier_names
  void LoadData() async {
    await DefaultAssetBundle.of(context)
        .loadString('assets/JSON/bookData.json')
        .then((s) {
      setState(() {
        homepage.popularBooks = json.decode(s);
      });
    });
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController();
    LoadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.background,
      child: SafeArea(
        child: Scaffold(
          key:homePageKey,
          drawer: drawerHomePage(),
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     IconButton(
                      onPressed: (){
                      homePageKey.currentState!.openDrawer();
                     },
                      icon:Icon(
                      Icons.menu,
                      size: 24,
                    ),
                      ),
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        // ignore: prefer_const_constructors
                        ImageIcon(AssetImage('assets/images/search.png')),
                        SizedBox(
                          width: 15,
                        ),
                        ImageIcon(AssetImage('assets/images/notification.png')),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: const Text(
                      'Deal of the day',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 18,
              ),
              SizedBox(
                height: 220,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: -200,
                      right: 0,
                      child: Container(
                        //color: Color.fromARGB(255, 190, 228, 241),
                        height: 220,
                        child: PageView.builder(
                            controller: PageController(
                                initialPage: 0, viewportFraction: 0.3),
                            itemCount: homepage.popularBooks.length == null
                                ? 0
                                : homepage.popularBooks.length,
                            itemBuilder: (_, i) {
                              return InkWell(
                                onTap: (){
                                   Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => detailTrending(tbook: homepage.popularBooks, index: i),
                ),
              );
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 0),
                                  height: 220,
                                  width: MediaQuery.of(context).size.width / 1.2,
                                  // decoration: BoxDecoration(
                                  //   //borderRadius: BorderRadius.circular(20),
                                  //   image:   DecorationImage(
                                  //     image: NetworkImage(homepage.popularBooks[i]["imageLink"]),
                                  //     fit: BoxFit.contain
                                  //     )
                                  // ),
                                  child: Column(
                                    children: [
                                      Image.network(
                                        homepage.popularBooks[i]["imageLink"],
                                        height: 180,
                                        fit: BoxFit.contain,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        homepage.popularBooks[i]["price"],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: NestedScrollView(
                controller: _scrollController,
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      backgroundColor: Colors.white,
                      pinned: true,
                      bottom: PreferredSize(
                          preferredSize: Size.fromHeight(20),
                          child: Container(
                            margin: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: TabBar(
                              indicatorPadding: EdgeInsets.all(0),
                              indicatorSize: TabBarIndicatorSize.label,
                              labelPadding: EdgeInsets.only(right: 10),
                              controller: _tabController,
                              isScrollable: true,
                              indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // ignore: prefer_const_literals_to_create_immutables
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.transparent,
                                      //blurRadius: 7,
                                      offset: Offset(0, 0),
                                    )
                                  ]),
                              // ignore: prefer_const_literals_to_create_immutables
                              tabs: [
                                TabBar1(color: Colors.red, string: 'Home'),
                                TabBar1(
                                  color: Colors.green,
                                  string: 'Popular',
                                ),
                                TabBar1(
                                    color: Color.fromARGB(255, 40, 46, 219),
                                    string: 'Trending')
                              ],
                            ),
                          )),
                    )
                  ];
                },
                body: TabBarView(
                  controller: _tabController,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    homeContent(),
                    Material(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey,
                        ),
                        title: Text('Content'),
                      ),
                    ),
                    Material(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey,
                        ),
                        title: Text('Content'),
                      ),
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
