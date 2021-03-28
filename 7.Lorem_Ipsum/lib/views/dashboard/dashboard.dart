import 'package:flutter/material.dart';

import 'widgets/formContainer.dart';
import './../../models/data.dart';
import 'widgets/displayContainer.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int number;
  String renderPara = "Please Enter Number of paragraph you want";

  void setNumber(String paraNumber) {
    int newNumber = int.parse(paraNumber);
    if (newNumber <= 0) newNumber = 1;
    if (newNumber > 8) newNumber = 8;
    String newPara = text.sublist(0, newNumber).join('\n\n');
    setState(() {
      renderPara = newPara;
      number = newNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lorem Ipsum",
          style: TextStyle(
            color: Color(0xff08334F),
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xffF1F5F9),
      ),
      body: Container(
        color: Color(0xff08334F),
        child: Column(
          children: <Widget>[
            FormContainer(setNumber),
            Expanded(child: DisplayContainer(renderPara))
          ],
        ),
      ),
    );
  }
}
