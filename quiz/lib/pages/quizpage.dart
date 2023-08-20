import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:quiz/model/model.dart';
import 'package:quiz/pages/resultpage.dart';
import 'package:quiz/provider/providers.dart';
import 'package:quiz/utils/message.dart';
import 'package:quiz/utils/textBuilder.dart';

class quizPage extends StatefulWidget {
  const quizPage({super.key, required this.section});
  final String section;
  @override
  State<quizPage> createState() => _quizPageState();
}

class _quizPageState extends State<quizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        elevation: 0,
        title: textBuilder(text: widget.section),
      ),
      body: Container(
          color: Colors.indigo,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Consumer<quizProvider>(
            builder: (context, value, child) {
              int currentIndex = value.currentIndex;
              if (value.questions.length == 0) {
                return CircularProgressIndicator(
                  color: Colors.white,
                );
              }
              if (value.questions.isEmpty) {
                return Center(
                  child: textBuilder(
                    text: "No question to display",
                    color: Colors.white,
                  ),
                );
              }
              final QuizQuestion questions = value.questions[currentIndex];
              return ListView(
                padding: EdgeInsets.all(10),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: textBuilder(
                      text: "Question:",
                      weight: FontWeight.w700,
                      size: 20,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: textBuilder(
                      text: questions.question,
                      color: Colors.indigo,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: textBuilder(
                      text: "Options:",
                      weight: FontWeight.w700,
                      size: 20,
                    ),
                  ),
                  Column(
                    children: questions.answers.entries.map((entry) {
                      final optionKey = entry.key;
                      final optionValue = entry.value;

                      if (optionValue != null) {
                        return InkWell(
                          onTap: () {
                            if (!value.isAlreadyAnswer) {
                              value.selectAnswer(
                                entry.key,
                                questions.correctAnswers,
                              );
                            } else {
                              messageToUser("You have already answered this question");
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            decoration: BoxDecoration(
                              color: value.selectedAnswerKey == entry.key
                                  ? (value.isCorrect
                                      ? Colors.green
                                      : Colors.red)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(bottom: 20),
                            child: textBuilder(
                              text: "$optionKey: $optionValue",
                              color: value.selectedAnswerKey == entry.key
                                  ? (value.isCorrect
                                      ? Colors.white
                                      : Colors.white)
                                  : Colors.indigo,
                            ),
                          ),
                        );
                      } else {
                        return SizedBox(); // Skip rendering when optionValue is null
                      }
                    }).toList(),
                  ),
                  questions.description != null && value.isAlreadyAnswer
                      ? Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: textBuilder(
                            text: questions.explanation ?? "",
                            color: Colors.indigo,
                          ),
                        )
                      : Container(),
                  TextButton(
                    onPressed: () {
                      if(!(value.isAlreadyAnswer)){
                      messageToUser("You can not answer next question without answering this question");
                      }
                      else if (currentIndex + 1 < value.questions.length)
                        value.increaseCurrentidex();
                      else {
                        messageToUser("No more questions to answer");
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>resultPage()));
                       
                      }
                    },
                    child: textBuilder(
                      text: "Next",
                      color: Colors.indigo,
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white, padding: EdgeInsets.all(10)),
                  )
                ],
              );
            },
          )),
    );
  }
}
