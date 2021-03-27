import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import './widgets/tabs.dart';
import './widgets/tabsDesc.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool loading = true;
  List data = [];
  int value = 0;

  @override
  void initState() {
    super.initState();

    new Future.delayed(Duration.zero, () async {
      List response = await fetchJobs();
      setState(() {
        data = response;
        loading = false;
      });
    });
  }

  Future<List> fetchJobs() async {
    try {
      Response response =
          await Dio().get('https://course-api.com/react-tabs-project');
      return response.data;
    } catch (err) {
      print(err);
      return [];
    }
  }

  void setValue(int index) {
    setState(() {
      value = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Expierence',
            style: TextStyle(
              fontSize: 28,
              color: Colors.black,
              letterSpacing: 2,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color(0xffF1F5F8),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 20),
              Text(
                "Fetching Data...",
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 2,
                  wordSpacing: 2,
                  color: Color(0xff647D98),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      );
    }

    List companies = data.map((el) => el['company']).toList();
    String title = data[value]['title'];
    String dates = data[value]['dates'];
    List duties = data[value]['duties'];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expierence',
          style: TextStyle(
            fontSize: 28,
            color: Colors.black,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xffF1F5F8),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Tabs(companies, value, setValue),
            Expanded(child: TabsDesc(title, dates, duties, companies[value])),
          ],
        ),
      ),
    );
  }
}
