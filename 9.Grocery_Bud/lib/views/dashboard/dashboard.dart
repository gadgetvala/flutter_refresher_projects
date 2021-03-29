import 'package:flutter/material.dart';

import './widgets/inputBar.dart';
import './widgets/displayContainer.dart';
import 'package:another_flushbar/flushbar.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Map<String, String>> data = [];

  // Clear All List
  void clearList() {
    setState(() => data = []);

    showSnackBar(
      'Item Cleared',
      Colors.red,
      Icon(
        Icons.clear_all,
        color: Colors.red,
      ),
    );
  }

  // Delete Data from List
  void deleteData(id) {
    List<Map<String, String>> newData =
        data.where((el) => el['id'] != id).toList();

    setState(() {
      data = newData;
    });

    showSnackBar(
      'Item Removed',
      Colors.red,
      Icon(
        Icons.delete_forever_sharp,
        color: Colors.red,
      ),
    );
  }

  // Add new Data to List
  void setData(text) {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    List<Map<String, String>> newData = [
      ...data,
      {'id': id, 'text': text}
    ];

    setState(() {
      data = newData;
    });

    showSnackBar(
      'Item Added',
      Colors.green,
      Icon(
        Icons.add_outlined,
        color: Colors.green,
      ),
    );
  }

  // Show SnackBar
  void showSnackBar(String message, Color messageColor, Widget icon) {
    Flushbar(
      icon: icon,
      message: message,
      messageColor: messageColor,
      messageSize: 15,
      duration: Duration(seconds: 2),
    )..show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Grocery Bud',
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            letterSpacing: 2,
            wordSpacing: 2,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Color(0xffEFF3F6),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: Color(0xffEFF3F6),
        padding: const EdgeInsets.all(20),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: <Widget>[
              InputBar(setData: setData),
              Expanded(
                child: DisplayContainer(
                  data: data,
                  deleteData: deleteData,
                ),
              ),
              if (data.length > 0)
                GestureDetector(
                  onTap: () => clearList(),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.clear_all,
                          color: Colors.red,
                        ),
                        Text(
                          "Clear Items",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.red,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
