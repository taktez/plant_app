import 'package:flutter/material.dart';
import 'package:plant/constant/constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(onPressed: () {}, child: const Text("رد کردن")),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  pageIndex = page;
                });
              },
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 350,
                        child: Image.asset(
                          "assets/images/pic1.png",
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        Constant.titleOne,
                        style: TextStyle(
                            color: Constant.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        Constant.descriptionOne,
                        style: TextStyle(color: Constant.hintText),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 350,
                      child: Image.asset(
                        "assets/images/pic2.png",
                      ),
                    ),
                    Text(Constant.titleOne),
                    Text(Constant.descriptionOne),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
