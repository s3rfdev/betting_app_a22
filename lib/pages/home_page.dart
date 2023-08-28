import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../res/styles.dart';
import 'category_page.dart';
import 'main_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset('images/bg1.png'),
            InkWell(
              onTap: () => Get.to(CategoryPage()),
              child: Container(
                height: 50,
                margin: EdgeInsets.all(60),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: orange,
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Start',
                  style: h12w700,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
