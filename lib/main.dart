import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';//share strings using share_plus
import 'package:share_files_and_screenshot_widgets/share_files_and_screenshot_widgets.dart';

void main(){
  runApp(const MaterialApp(
      home : NinjaRK()
  ));
}

class NinjaRK extends StatelessWidget{
  const NinjaRK({Key? key}) : super(key: key);

  final String _content =
      'Be happy, it drives people crazy.';

  void _shareContent() {
    Share.share(_content);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: const Text('Ravi Kant - Flutter Developer'),
        centerTitle: true,
        backgroundColor: Colors.grey.shade800,
        elevation: 0.0,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          //background Image and Bottom Content
          Column(
            children: [
              Container(//BACKGROUND PROFILE
                //stretch image in container
                height: 150.0,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment(-0.2,0),
                      image: ExactAssetImage('assets/background.jpg'),
                      fit: BoxFit.cover,
                    )
                ),
              ),
              const SizedBox(height:75.0,),
              Container(//BODY
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child : Column(
                    children: [
                      Row(
                        children: const [
                          Text(
                            'NAME',
                            style: TextStyle(
                              color: Colors.grey,
                              letterSpacing: 2.0,
                            ),
                          ),
                          SizedBox(width:10.0,),
                          Text(
                            'RAVI KANT',
                            style: TextStyle(
                              color: Colors.amberAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ],
                      ),
                      const Divider(color: Colors.white,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'ABOUT',
                            style: TextStyle(
                              color: Colors.grey,
                              letterSpacing: 2.0,
                            ),
                          ),
                          SizedBox(width:10.0,),
                          Flexible(
                            child: Text(
                              'AN ENTHUSIASTIC PERSON WITH HUMBLE APPROACH TOWARDS LEARNING THE PRINCIPLES OF LIFE AND TECHNOLOGY',
                              style: TextStyle(
                                color: Colors.amberAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 22.0,
                                letterSpacing: 2.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(color: Colors.white,),
                      Row(
                        children: [
                          Icon(
                            Icons.email_rounded,
                            color: Colors.amber[400],
                          ),
                          const SizedBox(width: 10.0,),
                          Text(
                            'tejasrafale1@gmail.com',
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 20.0,
                              letterSpacing: 1.0,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.card_giftcard,
                            color: Colors.amber[400],
                          ),
                          const SizedBox(width: 10.0,),
                          Text(
                            'github.com/daggeraxe172',
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 20.0,
                              letterSpacing: 1.0,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.border_clear,
                            color: Colors.amber[400],
                          ),
                          const SizedBox(width: 10.0,),
                          Text(
                            'linkedin.com/in/ravi-kant-989ab7164',
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 20.0,
                              letterSpacing: 1.0,
                            ),
                          )
                        ],
                      ),
                      Divider(
                        height: 10.0,
                        color: Colors.grey[800],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children :[
                          ElevatedButton(
                            onPressed: _shareContent,//sharing STRING
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue),
                            ),
                            child: const Text(
                              'SHARE QUOTE',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10.0,),
                          ElevatedButton(
                            onPressed: () async { //SHARING IMAGE
                              ByteData bytes =
                              await rootBundle.load('assets/card.jpg');
                              Uint8List list = bytes.buffer.asUint8List();
                              ShareFilesAndScreenshotWidgets().shareFile(
                                  "Title", "Name.jpg", list, "image/jpg",
                                  text: "This is the caption!");
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue),
                            ),
                            child: const Text(
                              'SHARE THIS CARD',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
              ),
            ],
          ),
          //POSITIONED : A widget that controls where a child of a Stack is positioned. A Positioned widget must be a descendant of a Stack, and the path from the Positioned widget
          Positioned( //PROFILE IMAGE
            top: 100.0, //(background container size) - (circle height / 2)
            child: Container(
              height: 100.0,
              width: 100.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image : ExactAssetImage('assets/rkprofile.jpg'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}