import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class detailTrending extends StatelessWidget {
   final index;
   final List tbook;

  const detailTrending({super.key,required this.index, required this.tbook});

  

  _launchURL() async {
  var url = tbook[index]["link"].toString();
  if (await launch(url)) {
    await canLaunch(url);
  } else {
    throw 'Could not launch $url';
  }
}
  

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
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
          tbook[index]["title"],
          style: const TextStyle(
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
              child: Image.network(tbook[index]["imageLink"]),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
                child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text('Author Name:  ${tbook[index]["author"]}'),
                        Text('Country ${tbook[index]["country"]}'),
                        Text('Langauge  ${tbook[index]["language"]}'),
                        Text('Pages ${tbook[index]["pages"]}'),
                        TextButton(
                          onPressed: _launchURL,
                         child: Text('Read Book')
                         ),
                        
                      ],
                    )
                  )
                )
          ],
        ),
      ),
    );
  }
  
}