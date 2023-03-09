import 'package:e_book1/Pages/QuotePages/BooksQuote.dart';
import 'package:e_book1/Pages/QuotePages/LifeQuote.dart';
import 'package:e_book1/Pages/QuotePages/LoveQuote.dart';
import 'package:e_book1/Pages/QuotePages/ReadingQuote.dart';
import 'package:e_book1/Pages/QuotePages/inspirationalQuote.dart';
import 'package:e_book1/Pages/QuotePages/quatePage.dart';
import 'package:e_book1/Pages/QuoteTypeSelection.dart';
import 'package:e_book1/homePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "E Book",
      debugShowCheckedModeBanner: false,
      initialRoute: "home",
      routes: {
        'home': (context) => const homepage(),
        'selectQuote' :(context) => const QuoteTypeSelection(),
        'quote':(context) => const quatePage(), 
        'love':(context) => const LovequatePage(),
        'inspirational':(context) => const InspirationalquatePage(),  
        'life':(context) => const LifequatePage(),
        'book':(context) => const BookquatePage(),
        'reading':(context) => const ReadingquatePage(),
      },
    );
  }
}
