import 'package:flutter/material.dart';

import './views/dashboard/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery Bud',
      home: Dashboard(),
    );
  }
}
