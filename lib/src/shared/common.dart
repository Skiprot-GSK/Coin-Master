import 'package:flutter/material.dart';

const Color deepOrange = Colors.deepOrange;
const Color black = Colors.black;
// Color white = Colors.white;
const Color grey = Colors.grey;
 const Color red = Colors.red;


// methods
void changeScreen(BuildContext context, Widget widget){
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void changeScreenReplacement(BuildContext context, Widget widget){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => widget));
}

