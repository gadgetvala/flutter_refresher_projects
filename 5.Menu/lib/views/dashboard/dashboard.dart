import 'package:flutter/material.dart';

import './../../models/data.dart';
import './widgets/category.dart';
import './widgets/menu.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List categorys = [
    'All',
    ...new Set.from(data.map((el) => el["category"])).toList()
  ];
  List menus = [...data];
  String activeCategory = 'All';

  void setMenu(String menu) {
    if (menu == 'All') {
      setState(() {
        activeCategory = 'All';
        menus = data;
      });
      return;
    }

    List newMenu = data.where((el) => el['category'] == menu).toList();
    setState(() {
      activeCategory = menu;
      menus = newMenu;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Our Menu",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 26,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xffF1F5F9),
      ),
      body: Container(
        width: double.infinity,
        color: Color(0xffF1F5F9),
        child: Column(
          children: <Widget>[
            Category(categorys, setMenu, activeCategory),
            Expanded(child: Menu(menus)),
          ],
        ),
      ),
    );
  }
}
