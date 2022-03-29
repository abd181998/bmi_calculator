import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_app/modules/bmi_reuslt/bmi_reuslt_screen.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  _BimScreenState createState() => _BimScreenState();
}

class _BimScreenState extends State<BmiScreen> {
  bool isMale = true;
  double height = 120;
  int weight = 40;
  int age = 15;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Culculator'),
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.male,
                            size: 80,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Male',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: isMale ? Colors.cyan : Colors.grey[400],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = false;
                      });
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.female,
                            size: 80,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Female',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: isMale ? Colors.grey[400] : Colors.cyan),
                    ),
                  ),
                ),
              ],
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '${height.round()}',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'CM',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  Slider(
                      value: height,
                      max: 220,
                      min: 80,
                      onChanged: (valu) {
                        setState(() {
                          height = valu;
                        });
                        print(valu.round());
                      })
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[400],
              ),
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        Text(
                          '${weight}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 50),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              heroTag: 'weight-',
                              mini: true,
                              child: Icon(Icons.remove),
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              heroTag: 'weight+',
                              mini: true,
                              child: Icon(Icons.add),
                            )
                          ],
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[400]),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        Text(
                          '${age}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 50),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              heroTag: 'age-',
                              mini: true,
                              child: Icon(Icons.remove),
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              heroTag: 'age+',
                              mini: true,
                              child: Icon(Icons.add),
                            )
                          ],
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[400]),
                  ),
                ),
              ],
            ),
          )),
          Container(
            width: double.infinity,
            color: Colors.cyan,
            child: MaterialButton(
              onPressed: () {
                var result = weight / pow (height/100,2);
                print(result.round());
                Navigator.push(context,MaterialPageRoute(
                    builder: (context)=> BmiResult(
                      age: age,
                      result: result,
                      isMale: isMale,

                    ),),);
              },
              height: 50,
              child: Text(
                'CALCULATE',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
