import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  final List _menuData;

  Menu(this._menuData);

  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        itemCount: _menuData.length,
        itemBuilder: (_, index) {
          return Container(
            child: Column(
              children: [
                Container(
                  width: mq.width,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffBF996D),
                      width: 5,
                    ),
                    borderRadius: BorderRadius.circular(1),
                  ),
                  child: Image.asset(
                    'assets/${_menuData[index]["img"]}',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      _menuData[index]["title"],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '\$${_menuData[index]["price"].toString()}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffBF996D),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  _menuData[index]["desc"],
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          );
        },
      ),
    );
  }
}
