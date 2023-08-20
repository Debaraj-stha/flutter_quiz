import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:quiz/pages/quizpage.dart';
import 'package:quiz/utils/textBuilder.dart';

import '../provider/providers.dart';
import '../utils/popupmenuButton.dart';

class quizSection extends StatefulWidget {
  const quizSection({super.key, required this.level});
  final String level;
  @override
  State<quizSection> createState() => _quizSectionState();
}

class _quizSectionState extends State<quizSection> {
  @override
  Widget build(BuildContext context) {
    final p = Provider.of<quizProvider>(context, listen: false);
    final quizSection = p.quizSection;
    return Scaffold(
        appBar: AppBar(
          title: textBuilder(text: "Quiz Section"),
          leading: BackButton(color: Colors.white),
          elevation: 0,
          actions: [popupMenu(context)],
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.indigo,
          ),
          child: Wrap(
            children: List.generate(quizSection.length, (index) {
              return InkWell(
                child: customList(index, quizSection[index]),
                onTap: () {
                  p.fetchQuestion(quizSection[index], widget.level);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => quizPage(
                                section: quizSection[index],
                              )));
                },
              );
            }),
          ),
        ));
  }

  Widget customList(int index, String text) {
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
