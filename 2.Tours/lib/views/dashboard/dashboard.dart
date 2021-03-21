import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import './widgets/detailCard.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final String api = "https://course-api.com/react-tours-project";
  bool isDataFetched = false;
  List data;

  @override
  void initState() {
    super.initState();

    new Future.delayed(Duration.zero, () async {
      final dataFromApi = await fetchData(api);
      setState(() {
        data = dataFromApi;
        isDataFetched = true;
      });
    });
  }

  void removeData(String id) {
    List newData = data.where((el) => el['id'] != id).toList();
    setState(() {
      data = newData;
    });
  }

  Future<dynamic> fetchData(String url) async {
    print('Api Get, url $url');
    var responseJson;
    try {
      setState(() {
        isDataFetched = false;
      });
      final response = await Dio().get(url);
      responseJson = response.data;
    } catch (error) {
      print(error);
    }
    return responseJson;
  }

  void fetchAndSetData() async {
    final dataFromApi = await fetchData(api);
    setState(() {
      data = dataFromApi;
      isDataFetched = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Our Tours",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 25,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xffF1F5F9),
      ),
      body: Container(
        child: isDataFetched
            ? data.length != 0
                ? ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (cxt, i) {
                      return DetailCard(
                        data[i]["id"],
                        data[i]["name"],
                        data[i]["price"],
                        data[i]["image"],
                        data[i]["info"],
                        removeData,
                      );
                    },
                  )
                : Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "NO Data",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2,
                            wordSpacing: 2,
                          ),
                        ),
                        SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            fetchAndSetData();
                          },
                          child: Text(
                            "Load Data Aagain",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 2,
                              wordSpacing: 2,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
