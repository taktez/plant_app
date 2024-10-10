import 'package:flutter/material.dart';
import 'package:plant/constant/constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: size.width * 0.9,
                decoration: BoxDecoration(
                  color: Constant.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 5.0),
                    Expanded(
                        child: TextField(
                      style: TextStyle(fontFamily: 'YekanBakh'),
                      decoration: InputDecoration(
                          hintText: 'جستجو...',
                          border: InputBorder.none,
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 12)),
                    )),
                    Icon(Icons.mic),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
