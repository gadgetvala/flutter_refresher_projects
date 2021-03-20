import 'package:flutter/material.dart';

import './widgets/birthday_header.dart';
import './../../models/data.dart';
import './widgets/birthday_card.dart';
import './widgets/controlls.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List appData = data;

  void removeDataFromAppData(String id, String method) {
    if (method == "single") {
      List newAppData =
          appData.where((card) => card['id'].toString() != id).toList();
      setState(() {
        appData = newAppData;
      });
    }

    if (method == "all") {
      setState(() {
        appData = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;

    AppBar appBar = AppBar(
      title: Text(
        'Birthday Remindar',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Color(0xffF289B1),
    );

    return Scaffold(
      appBar: appBar,
      backgroundColor: Color(0xffF289B1),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 4,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
            color: Colors.white,
          ),
          height: (mq.height - appBar.preferredSize.height) - 50,
          width: (mq.width - 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BirthdayHeader(appData.length.toString()),
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      return BirthdayCard(
                        appData[index]['id'].toString(),
                        appData[index]['image'],
                        appData[index]['name'],
                        appData[index]['age'].toString(),
                        removeDataFromAppData,
                      );
                    },
                    itemCount: appData.length,
                  ),
                ),
              ),
              Controlls(removeDataFromAppData)
            ],
          ),
        ),
      ),
    );
  }
}
