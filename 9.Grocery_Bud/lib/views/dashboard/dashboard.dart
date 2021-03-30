import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

import './widgets/inputBar.dart';
import './widgets/displayContainer.dart';
import './widgets/clearAllList.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Map<String, String>> data = [];
  bool isEditing = false;
  String editingID = '';
  String editingText = '';

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

  // Editing
  void setEditing(String method, String editingIDParams, String newText) {
    if (method == 'start') {
      List textObject =
          data.where((el) => el['id'] == editingIDParams).toList();

      setState(() {
        isEditing = true;
        editingID = editingIDParams;
        editingText = textObject[0]['text'];
      });
    }

    if (method == 'end') {
      List<Map<String, String>> newData = data.map((el) {
        if (el['id'] == editingIDParams) {
          return {
            'id': editingIDParams,
            'text': newText,
          };
        }
        return el;
      }).toList();

      setState(() {
        isEditing = false;
        editingID = '';
        editingText = '';
        data = newData;
      });

      showSnackBar(
        'Item Updated',
        Colors.green,
        Icon(
          Icons.update_outlined,
          color: Colors.green,
        ),
      );
    }
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
              InputBar(
                setData: setData,
                setEditing: setEditing,
                isEditing: isEditing,
                editingID: editingID,
                editingText: editingText,
              ),
              Expanded(
                child: DisplayContainer(
                  data: data,
                  deleteData: deleteData,
                  setEditing: setEditing,
                ),
              ),
              if (data.length > 0) ClearAllList(clearList: clearList),
            ],
          ),
        ),
      ),
    );
  }
}
