import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/pages/homepage.dart';
import 'package:quiz/pages/resultpage.dart';
import 'package:quiz/provider/providers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => quizProvider(),
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.indigo,
            ),
            home: resultPage()));
  }
}
