import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../models/questions.dart';
import '../res/styles.dart';
import '../widgets/question_container.dart';
import 'category_page.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = -1;
  int q = 0;
  Timer? timer;
  int time = 0;
  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (time < 60) {
          time = time + 1;
        } else {
          time = 0;
        }
        timeNow = now.add(Duration(seconds: time));
      });
    });
    super.initState();
  }

  var now = DateTime(2020, 1, 1, 0, 0, 0);
  var timeNow = DateTime(2020, 1, 1, 0, 0, 0);
  @override
  Widget build(BuildContext context) {
    var list = [];
    for (var i = 0; i < Questions.base.entries.toList()[q].value.length; i++) {
      list.add(InkWell(
        onTap: () => setState(() {
          index = i;
        }),
        child: QuestionContainer(
            q: Questions.base.entries.toList()[q].value[i],
            isChecked: index == i),
      ));
    }
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.school, size: 0),
            label: '',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: pirple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school, size: 0),
            label: '',
            backgroundColor: Colors.purple,
          ),
        ],
        currentIndex: 1,
        selectedItemColor: pirple,
        onTap: (val) {
          if (val == 1) Get.offAll(() => CategoryPage());
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Programming Test',
                      style: h12w400,
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Container(
                        width: 280,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            )),
                        child: LinearPercentIndicator(
                          alignment: MainAxisAlignment.center,
                          width: 200,
                          animation: true,
                          lineHeight: 20.0,
                          animationDuration: 2000,
                          percent: (q + 1) * 100 / 5 / 100,
                          trailing: Text("${(q + 1) * 100 / 5}.0%"),
                          linearStrokeCap: LinearStrokeCap.roundAll,
                          progressColor: orange1,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 140,
                      child: CircularPercentIndicator(
                        radius: 60.0,
                        animation: true,
                        animationDuration: 0,
                        lineWidth: 8.0,
                        percent: time * 100 / 60 / 100,
                        center: Container(
                          child: Column(
                            children: [
                              SizedBox(height: 25),
                              Text(
                                DateFormat('mm:ss').format(timeNow),
                                style: new TextStyle(
                                  color: pirple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                              Text(
                                'Coundown',
                                style: h12w400.copyWith(color: orange),
                              )
                            ],
                          ),
                        ),
                        circularStrokeCap: CircularStrokeCap.butt,
                        backgroundColor: orange1,
                        progressColor: pirple,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'Question - ${q + 1}',
                  style: new TextStyle(
                    color: pirple,
                    fontWeight: FontWeight.bold,
                    fontSize: 26.0,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  Questions.base.entries.toList()[q].key,
                  style: new TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18.0,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ...list,
              SizedBox(height: 60),
              InkWell(
                onTap: () => setState(() {
                  q = q + 1;
                  index = -1;
                  time = 0;
                  if (q == 4) {
                    Get.offAll(CategoryPage());
                  }
                }),
                child: Container(
                  height: 50,
                  margin: EdgeInsets.all(60),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: pirple,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'NEXT QUESTIONS'.toUpperCase(),
                    style: h12w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
