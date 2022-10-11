import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:typed_data';
import 'package:share_plus/share_plus.dart';//share strings using share_plus
import 'package:share_files_and_screenshot_widgets/share_files_and_screenshot_widgets.dart';//share files

import 'package:selectable/selectable.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:toast/toast.dart';

void main(){
  runApp(const MaterialApp(
      home : NinjaRK()
  ));
}

class NinjaRK extends StatefulWidget{
  const NinjaRK({Key? key}) : super(key: key);

  @override
  State<NinjaRK> createState() => _NinjaRKState();
}

String quoteText = 'Be happy, it drives people crazy.';
String mail = 'tejasrafale1@gmail.com';
String resumeText = 'Ravi Kant Resume';
String resumeLink = 'https://drive.google.com/file/d/165uggULctWzKa_xT2MMAi9k8aUN9y5nz/view';
String githubText = 'Ravi Kant GitHub Profile';
String githubLink = 'https://github.com/daggeraxe172';
String linkedinText = 'Ravi Kant LinkedIn Profile';
String  linkedinLink= 'https://linkedin.com/in/ravi-kant-989ab7164';

class _NinjaRKState extends State<NinjaRK> {
  final String _content =
      '$quoteText'
      '\n'
      '\n$resumeText : $resumeLink'
      '\n$githubText : $githubLink'
      '\n$linkedinText : $linkedinLink';

  void _shareContent() {
    Share.share(_content);
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context); //TOAST CONTEXT

    const appBarTitle = 'Ravi Kant - Flutter Developer';
    const nameText = 'NAME';
    const name = 'RAVI KANT';
    const about = 'ABOUT';
    const aboutText = 'AN ENTHUSIASTIC PERSON WITH HUMBLE APPROACH TOWARDS LEARNING THE PRINCIPLES OF LIFE AND TECHNOLOGY';
    const detailButtonText = 'SHARE DETAILS';
    const shareButtonText = 'SHARE THIS CARD';
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: const Text(appBarTitle),
        centerTitle: true,
        backgroundColor: Colors.grey.shade800,
        elevation: 0.0,
      ),
      body: Selectable(
        child: Stack(
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
                              nameText,
                              style: TextStyle(
                                color: Colors.grey,
                                letterSpacing: 2.0,
                              ),
                            ),
                            SizedBox(width:10.0,),
                            Text(
                              name,
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
                              about,
                              style: TextStyle(
                                color: Colors.grey,
                                letterSpacing: 2.0,
                              ),
                            ),
                            SizedBox(width:10.0,),
                            Flexible(
                              child: Text(
                                aboutText,
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
                            Linkify(
                              text: mail,
                              //text: "Made by https://cretezy.com\n\nMail: example@gmail.com",
                              onOpen: _onOpen,
                              linkStyle: const TextStyle(
                                fontSize: 20.0,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.card_giftcard,
                              color: Colors.amber[400],
                            ),
                            const SizedBox(width: 10.0,),
                            Linkify(
                              text: githubLink,
                              onOpen: _onOpen,
                              linkStyle: const TextStyle(
                                fontSize: 20.0,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.border_clear,
                              color: Colors.amber[400],
                            ),
                            const SizedBox(width: 10.0,),
                            Linkify(
                              text: linkedinLink,
                              onOpen: _onOpen,
                              linkStyle: const TextStyle(
                                fontSize: 20.0,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          height: 30.0,
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
                                detailButtonText,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
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
                                    "Ravi Kant Profile", "Ravi_Kant_Card.jpg", list, "image/jpg",
                                    text: "This is the Digital Card For RAVI KANT !!");
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue),
                              ),
                              child: const Text(
                                shareButtonText,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ],
                        ),
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
      ),
    );
  }

  Future<void> _onOpen(LinkableElement link) async {
      try{
        await launch(link.url);
      }
      catch(e){
        //e.toString()
        Toast.show("Download App to Send Mail",duration: Toast.lengthLong);
      }
  }
}