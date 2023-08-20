import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:quiz/pages/levelPage.dart';
import 'package:quiz/pages/quizSection.dart';
import 'package:quiz/utils/popupmenuButton.dart';

import '../utils/textBuilder.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:textBuilder(text: "Programming Quiz App",),
        elevation: 1,
        actions: [
          popupMenu(context)
        ],
      ),
      body:Container(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 15),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("asset/bg1.jpg"),fit: BoxFit.fill)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 20,horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 5,
                      offset: Offset(0, -3),
                      blurStyle: BlurStyle.outer,
                      blurRadius: 1
                    )
                  ]
                ),
                child:               textBuilder(text: "Lets play quiz and improve your knowlwdge on programming language",size:25,color: Colors.indigo,weight: FontWeight.w700,),

              ),
            SizedBox(height: 30,),
              TextButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.indigo,
                  padding: EdgeInsets.all(8)
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>levelPage()));
              }, child: textBuilder(text: "Play Now",color: Colors.white,))
            ],
        ),
      )
    );
  }
}