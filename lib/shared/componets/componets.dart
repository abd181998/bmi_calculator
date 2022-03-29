import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultBotton({ double width =double.infinity,
   Color background = Colors.cyan,
     required Function,
  required String text,
  double radius =15.0,
  bool isUpperCase =true,

   }) =>Container(
  height: 50,
width: width ,
child: MaterialButton(
onPressed:Function,
child: Text(
isUpperCase? text.toUpperCase():text,
style: TextStyle(color: Colors.white),
),
),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: background,

  ),

);


Widget defaultFromField({
  required TextEditingController controller,
  required TextInputType type,
  required Function validate,
   required Function onSubmit ,
  required  String label,
  required Icon prefix,
}) => TextFormField(
  controller: controller,
  keyboardType: type,
  validator: validate(),
  decoration: InputDecoration(
      labelText: label,
      prefixIcon: prefix,
      border: OutlineInputBorder()),
);


