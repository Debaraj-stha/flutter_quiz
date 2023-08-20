import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:quiz/pages/levelPage.dart';
import 'package:quiz/provider/providers.dart';
import 'package:quiz/utils/popupmenuButton.dart';
import 'package:quiz/utils/textBuilder.dart';

class resultPage extends StatefulWidget {
  const resultPage({super.key});

  @override
  State<resultPage> createState() => _resultPageState();
}

class _resultPageState extends State<resultPage> {
  @override
  Widget build(BuildContext context) {
    final p = Provider.of<quizProvider>(context, listen: false);
    final score = p.score;
    return Scaffold(
        appBar: AppBar(
          leading: null,
          backgroundColor: Colors.indigo,
          elevation: 0,
          actions: [
            popupMenu(context)
          ],
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.indigo),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
          child: Column(
            children: [
              textBuilder(
                text: "Congratulation!!!,You have score ${score} out of 20",
                weight: FontWeight.w700,
                size: 30.0,
              ),
              SizedBox(
                height: 40,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => levelPage()));
                  debugPrint("no more question");
                },
                child: textBuilder(
                  text: "Play again",
                  color: Colors.indigo,
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white, padding: EdgeInsets.all(10)),
              )
            ],
          ),
        ));
  }
}
