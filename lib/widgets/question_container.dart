import 'package:flutter/material.dart';

import '../res/styles.dart';

class QuestionContainer extends StatelessWidget {
  QuestionContainer({
    super.key,
    required this.q,
    required this.isChecked,
  });
  String q;
  bool isChecked;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Text(q),
          ),
          if (isChecked)
            Positioned(
              right: 30,
              child: CircleAvatar(
                backgroundColor: orange1,
                radius: 12,
                child: Icon(Icons.check, color: Colors.white),
              ),
            )
        ],
      ),
    );
  }
}
