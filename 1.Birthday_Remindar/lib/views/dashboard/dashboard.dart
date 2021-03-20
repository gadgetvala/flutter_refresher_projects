import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

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
  final _formKey = GlobalKey<FormState>();

  String formName;
  String formAge;
  String formImageLink;

  Future<void> takeDataFromUser(BuildContext ctx) async {
    return await showDialog(
      context: ctx,
      builder: (builderContext) {
        return AlertDialog(
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  onSaved: (String value) {
                    formName = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please provide a name";
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Enter Name",
                  ),
                ),
                TextFormField(
                  onSaved: (String value) {
                    formImageLink = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please provide an image link";
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Enter Image Link",
                  ),
                ),
                TextFormField(
                  onSaved: (String value) {
                    formAge = value;
                  },
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    RegExp _numeric = RegExp(r'^-?[0-9]+$');

                    if (value.isEmpty) {
                      return "Please provide age";
                    }

                    if (!_numeric.hasMatch(value)) {
                      return "Please Provide valid Number";
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Enter Age",
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                "Save",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffF289B1),
                ),
              ),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();

                  addNewDataToList(
                      Uuid().v4(), formName, formImageLink, formAge);
                  Navigator.of(builderContext).pop();
                }
              },
            ),
            TextButton(
              child: Text(
                "Cancle",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () {
                Navigator.of(builderContext).pop();
              },
            )
          ],
        );
      },
    );
  }

  void addNewDataToList(String id, String name, String imageLink, String age) {
    setState(() {
      appData.add({
        'id': id,
        "name": name,
        "image": imageLink,
        "age": age,
      });
    });
  }

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
              Controlls(takeDataFromUser, removeDataFromAppData)
            ],
          ),
        ),
      ),
    );
  }
}
