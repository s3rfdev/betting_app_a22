import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../res/styles.dart';
import 'main_page.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Text('Quiz', style: h26w700),
                  SizedBox(height: 40),
                  InkWell(
                    onTap: () => Get.to(MainPage()),
                    child: Image.asset('images/p1.png'),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () => Get.to(MainPage()),
                    child: Image.asset('images/p2.png'),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () => Get.to(MainPage()),
                    child: Image.asset('images/p3.png'),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () => Get.to(MainPage()),
                    child: Image.asset('images/p4.png'),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Expanded(child: SizedBox()),
            Column(
              children: [
                Divider(color: pirple),
                SizedBox(height: 10),
                Icon(
                  Icons.home_outlined,
                  color: pirple,
                  size: 30,
                ),
                Text('Home', style: h12w700.copyWith(color: pirple)),
                SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
