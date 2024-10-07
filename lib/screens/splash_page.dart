import 'package:flutter/material.dart';
import 'package:plant/constant/constant.dart';
import 'package:plant/screens/root.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int pageIndex = 0;

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      margin: const EdgeInsets.only(right: 5.0),
      height: 10.0,
      width: isActive ? 20.0 : 8.0,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < 3; i++) {
      if (pageIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          const SizedBox(width: 10),
          TextButton(
              onPressed: () {},
              child: const Text(
                "رد کردن",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          const Spacer(),
        ],
      ),
      body: Stack(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  pageIndex = page;
                });
              },
              children: <Widget>[
                PageViewMaker(
                  title: Constant.titleOne,
                  img: "assets/images/pic1.png",
                  description: Constant.descriptionOne,
                  indicators: _buildIndicator(),
                ),
                PageViewMaker(
                  title: Constant.titleTwo,
                  img: "assets/images/pic2.png",
                  description: Constant.descriptionTwo,
                  indicators: _buildIndicator(),
                ),
                PageViewMaker(
                  title: Constant.titleThree,
                  img: "assets/images/pic4.png",
                  description: Constant.descriptionThree,
                  indicators: _buildIndicator(),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 80.0,
            left: 30.0,
            child: Row(
              children: _buildIndicator(),
            ),
          ),
          Positioned(
            bottom: 50.0,
            right: 30.0,
            child: IconButton(
              onPressed: () {
                setState(() {
                  if (pageIndex < 2) {
                    pageIndex++;
                    if (pageIndex < 3) {
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    }
                  } else {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RootPage(),
                        ));
                  }
                });
              },
              icon: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Icon(Icons.arrow_back)),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class PageViewMaker extends StatelessWidget {
  final String title;
  final String img;
  final String description;
  final List<Widget> indicators;

  const PageViewMaker({
    super.key,
    required this.title,
    required this.img,
    required this.description,
    required this.indicators,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 350,
            child: Image.asset(
              img,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
                color: Constant.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 22),
          ),
          const SizedBox(height: 20),
          Text(
            description,
            style: TextStyle(color: Constant.hintText),
          ),
        ],
      ),
    );
  }
}
