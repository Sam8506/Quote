import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuoteTypeSelection extends StatelessWidget {
  const QuoteTypeSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: TextStyle(fontFamily: GoogleFonts.ubuntu().fontFamily),
        title: const Text('Category',
        style: TextStyle(
        color: Colors.white,
        fontSize: 21),
        
      ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:[
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
              onTap: () => Navigator.pushNamed(context, 'love'),
              child: Container(
                height: MediaQuery.of(context).size.height/3-50,
                width:  MediaQuery.of(context).size.width/2-40,
                decoration:  BoxDecoration(
                  
                  color: Color(0xff060047).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'Love',
                  style: TextStyle(
                    fontFamily: GoogleFonts.pacifico().fontFamily,
                    color: Colors.white,
                    fontSize: 35),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.pushNamed(context, 'life'),
              child: Container(              
                height: MediaQuery.of(context).size.height/3-50,
                width:  MediaQuery.of(context).size.width/2-40,
                decoration:  BoxDecoration(
                  color: Color(0xffBAD7E9).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(child: Text('Life',
                style: TextStyle(
                    fontFamily: GoogleFonts.pacifico().fontFamily,
                    color: Colors.black,
                    fontSize: 35),
                )),
              ),
            ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
              onTap: () => Navigator.pushNamed(context, 'inspirational'),
              child: Container(            
                height: MediaQuery.of(context).size.height/3-50,
                width:  MediaQuery.of(context).size.width/2-40,

                decoration:  BoxDecoration(
                  color: Color(0xffBAD7E9).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(child: Text('Inspirational',
                style: TextStyle(
                    fontFamily: GoogleFonts.pacifico().fontFamily,
                    color: Colors.black,
                    fontSize: 24),)),
              ),
            ),InkWell(
              onTap: () => Navigator.pushNamed(context, 'quote'),
              child: Container(
                height: MediaQuery.of(context).size.height/3-50,
                width:  MediaQuery.of(context).size.width/2-40,

                decoration:  BoxDecoration(
                  color: Color(0xff060047).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(child: Text('Random',
                style: TextStyle(
                    fontFamily: GoogleFonts.pacifico().fontFamily,
                    color: Colors.white,
                    fontSize: 30),)),
              ),
            ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
              onTap: () => Navigator.pushNamed(context, 'book'),
              child: Container(
                height: MediaQuery.of(context).size.height/3-50,
                width:  MediaQuery.of(context).size.width/2-40,

                decoration:  BoxDecoration(
                  color: Color(0xff060047).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(child: Text('Book',
                style: TextStyle(
                    fontFamily: GoogleFonts.pacifico().fontFamily,
                    color: Colors.white,
                    fontSize: 35),)),
              ),
            ),
            InkWell(
              onTap: () => Navigator.pushNamed(context, 'reading'),
              child: Container(
                                height: MediaQuery.of(context).size.height/3-50,
                width:  MediaQuery.of(context).size.width/2-40,

                decoration:  BoxDecoration(
                  color: Color(0xffBAD7E9).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(child: Text('Reading',
                style: TextStyle(
                    fontFamily: GoogleFonts.pacifico().fontFamily,
                    color: Colors.black,
                    fontSize: 30),)),
              ),
            ),
              ],
            )
          ]
        ),
      ),
    );
  }
}