import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/provider/providers.dart';
import 'package:quiz/utils/textBuilder.dart';

Widget popupMenu(BuildContext context){
  final p=Provider.of<quizProvider>(context,listen: false);
  return PopupMenuButton<String>(itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: textBuilder(
                    text: "Home",
                    color: Colors.indigo,
                  ),
                  value: 'home',
                  onTap: () {
                    p.handlePopUpMenu('home');
                  },
                ),
                PopupMenuItem(
                  child: textBuilder(
                    text: "View history",
                    color: Colors.indigo,
                  ),
                  value: 'history',
                  onTap: () {
                    p.handlePopUpMenu('history');
                  },
                ),
                PopupMenuItem(
                  child: textBuilder(
                    text: "Quit",
                    color: Colors.indigo,
                  ),
                  value: 'quit',
                  onTap: () {
                    p.handlePopUpMenu("quit");
                  },
                ),
              ];
            });
}