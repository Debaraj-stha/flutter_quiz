import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class textBuilder extends StatelessWidget {
  const textBuilder({super.key,required this.text,this.color=const Color.fromARGB(255, 247, 247, 247),this.size=18.0,this.weight=FontWeight.normal});
final String text;
final double size;
final Color color;
final FontWeight weight;
  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(color: color,fontSize: size,fontWeight: weight),);
  }
}