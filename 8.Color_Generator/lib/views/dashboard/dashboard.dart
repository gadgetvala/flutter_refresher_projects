import 'package:flutter/material.dart';

import './../../helpers/generateColor.dart';
import './widgets/inputForm.dart';
import './widgets/colorPalateContainer.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String hexCode = '65177e';

  void setCode(String data) {
    setState(() {
      hexCode = data.substring(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorArray = generateColor(hexCode);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Color Generator',
          style: TextStyle(
            color: Color(0xff192837),
            letterSpacing: 2,
            wordSpacing: 2,
            fontSize: 30,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xffF1F5F9),
      ),
      body: Container(
        color: Color(0xffF1F5F9),
        margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
        child: Column(
          children: [
            InputForm(setCode),
            Expanded(
              child: ColorPalateContainer(colorArray),
            )
          ],
        ),
      ),
    );
  }
}
