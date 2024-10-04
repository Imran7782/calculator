

import 'package:calcu/calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main(){
  runApp(const Mycal());
}



class Mycal extends StatelessWidget{
  const Mycal({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(

    home:SimpleCalculator(),
    theme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
   );
  }
}