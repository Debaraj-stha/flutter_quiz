import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../utils/popupmenuButton.dart';
import '../utils/textBuilder.dart';
import 'package:quiz/pages/quizSection.dart';
class levelPage extends StatefulWidget {
  const levelPage({super.key});

  @override
  State<levelPage> createState() => _levelPageState();
}

class _levelPageState extends State<levelPage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
        appBar: AppBar(
          title: textBuilder(text: "Difficulty Level"),
          leading: BackButton(color: Colors.white),
          elevation: 0,
           actions: [
          popupMenu(context)
        ],
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.indigo,
          ),
          child: Column(
            children: [
              InkWell(child: customList("Easy"),onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>quizSection(level:"easy")));

              },),
               InkWell(child: customList("Medium"),onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>quizSection(level:"medium")));

              },),
              InkWell(child: customList("Hard"),onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>quizSection(level:"hard")));

              },),
            ],
          ),
        )
   );
  }
  Widget customList(String text) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
      child: textBuilder(
        text: text,
        color: Colors.indigo,
        size: 20,
        weight: FontWeight.w600,
      ),
    );
  }
}