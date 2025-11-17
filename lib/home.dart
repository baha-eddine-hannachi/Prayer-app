import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final double culatitude;
  final double culongitude;
  final String city;
  

  const Home({required this.city,required this.culongitude,required this.culatitude,super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var today =
      "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}";
  Map pray = {};
  final List<String> lp = [
    "Fajr",
    "Sunrise",
    "Dhuhr",
    "Asr",
    "Maghrib",
    "Isha",
  ];

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        timenow();
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    var url = Uri.parse(
      "http://api.aladhan.com/v1/timings/$today?latitude=${widget.culatitude}&longitude=${widget.culongitude}&method=18",
    );
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Stack(
        children: [
          Image.asset("images/bg1.png"),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100),
                Center(
                  child: Text(
                    timenow(),
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Spacer(),
                Text("${widget.city}"
                  ,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 20),
                FutureBuilder(
                  future: get(url),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      );
                    }
                    var result = snapshot.data;
                    if (result!.statusCode == 200) {
                      var jsondata = jsonDecode(result.body);
                      pray.addAll(jsondata);
                    } else {
                      return Center(child: Text("Error"));
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          " ${pray["data"]["meta"]["method"]["name"]}",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          "Date : ${pray["data"]["date"]["readable"]}",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          "Hijri : ${pray["data"]["date"]["hijri"]["day"]}${pray["data"]["date"]["hijri"]["month"]["en"]} ${pray["data"]["date"]["hijri"]["year"]}  ",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),

                        ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Text(
                                  lp[index].toString().toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "${pray['data']['timings'][lp[index]]}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider();
                          },
                          itemCount: lp.length,
                        ),
                      ],
                    );
                  },
                ),

                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String timenow() {
    DateTime now = DateTime.now();
    late String seconde = now.second.toString();
    late String min = now.minute.toString();
    late String hour = now.hour.toString();
    late String ampm = now.hour >= 12 ? "PM" : "AM";
    late String time = " $hour:$min:$seconde $ampm";
    return time;
  }
}
