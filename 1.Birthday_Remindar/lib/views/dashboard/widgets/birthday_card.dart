import 'package:flutter/material.dart';

class BirthdayCard extends StatelessWidget {
  final String id;
  final String image;
  final String name;
  final String age;
  final Function removeDataFromAppData;

  BirthdayCard(
    this.id,
    this.image,
    this.name,
    this.age,
    this.removeDataFromAppData,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                    width: 65,
                    height: 65,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    age,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
              icon: Icon(
                Icons.delete_outlined,
                color: Color(0xffF289B1),
                size: 30,
              ),
              onPressed: () {
                removeDataFromAppData(id, "single");
              },
            ),
          )
        ],
      ),
    );
  }
}
