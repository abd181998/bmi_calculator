import 'package:flutter/material.dart';

 class BmiResult extends StatefulWidget {
   //const BmiResult({Key? key}) : super(key: key);
   final double result ;
   final bool isMale;
    final int age;
   BmiResult({
     required this.result,
     required this.isMale,
     required this.age,
 });
  @override
  State<BmiResult> createState() => _BmiResultState();
}

class _BmiResultState extends State<BmiResult> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text('Bmi Result'),

       ),
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
           Text(('Gender : male'
           ),style: TextStyle(
             fontWeight: FontWeight.bold,
             fontSize: 25
           ),),
           Text(('Result : 22'
           ),style: TextStyle(
             fontWeight: FontWeight.bold,
             fontSize: 25
           ),),
           Text(('AGE : 29'
           ),style: TextStyle(
             fontWeight: FontWeight.bold,
             fontSize: 25
           ),),


         ],),
       ),
     );
   }
}
