import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final List categorys;
  final Function setMenu;
  final String activeCategory;

  Category(
    this.categorys,
    this.setMenu,
    this.activeCategory,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView.builder(
        itemCount: categorys.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return InkWell(
            onTap: () {
              setMenu(categorys[index]);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                categorys[index],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffBF996D),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
