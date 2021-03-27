import 'package:flutter/material.dart';

class Tabs extends StatelessWidget {
  final List companies;
  final int currentValue;
  final Function setValue;

  Tabs(
    this.companies,
    this.currentValue,
    this.setValue,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 38,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      alignment: Alignment.center,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: companies.length,
        itemBuilder: (_, index) {
          return InkWell(
            onTap: () => setValue(index),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                companies[index],
                style: TextStyle(
                  fontSize: 17,
                  color: currentValue == index ? Color(0xff2CB0BD) : null,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
