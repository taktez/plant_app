import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant/constant/constant.dart';
import 'package:plant/models/models.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:plant/screens/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  final List<Plant> _plantList = Plant.plantList;
  bool toggleIsFavorit(bool isFavorites) {
    return !isFavorites;
  }

  final List<String> _plantType = [
    "| پیشنهادی |",
    "| آپارتمانی |",
    "| محل‌کار |",
    "| گل‌باغچه‌ای|",
    "| گل‌سمی |",
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          //Search Box
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: size.width * 0.9,
                decoration: BoxDecoration(
                  color: Constant.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: const Row(
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
          ),
          ////////////////////////////////////////////////////////////Category
          Container(
            margin: const EdgeInsets.only(right: 20, top: 10),
            height: 50,
            width: size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _plantType.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Text(
                      _plantType[index],
                      style: TextStyle(
                          fontWeight: selectedIndex == index
                              ? FontWeight.bold
                              : FontWeight.w300,
                          color: selectedIndex == index
                              ? Constant.primaryColor
                              : Colors.grey),
                    ),
                  ),
                );
              },
            ),
          ),
          ///////////////////////////////////////////////////////////Product One
          SizedBox(
            height: size.height * 0.3,
            width: size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _plantList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                            child: DetailPage(
                              plantId: _plantList[index].plantId,
                            ),
                            type: PageTransitionType.rightToLeft),
                      );
                    },
                    child: Container(
                      width: 200.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: const Color.fromARGB(255, 21, 171, 26)),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10,
                            right: 15,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  bool isFavorited = toggleIsFavorit(
                                      (_plantList[index].isFavorated));
                                  _plantList[index].isFavorated = isFavorited;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(40)),
                                child: Icon(
                                    _plantList[index].isFavorated == true
                                        ? Icons.favorite
                                        : Icons.favorite_border_outlined,
                                    color: Constant.primaryColor),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 50.0,
                            right: 50.0,
                            left: 50.0,
                            bottom: 50.0,
                            child: Image.asset(
                              _plantList[index].imageURL,
                            ),
                          ),
                          Positioned(
                            bottom: 50,
                            right: 15,
                            child: Text(
                              _plantList[index].category,
                              style: const TextStyle(
                                  color: Colors.white, fontFamily: 'YekanBakh'),
                            ),
                          ),
                          Positioned(
                            right: 15,
                            bottom: 25,
                            child: Text(
                              _plantList[index].plantName,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          Positioned(
                            left: 15,
                            bottom: 25,
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                    "${_plantList[index].price.toString()}\$")),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          ////////////////////گیاهان جدبد
          Container(
            padding: const EdgeInsets.only(right: 18, top: 20, bottom: 20),
            alignment: Alignment.centerRight,
            child: const Text(
              "گیاهان‌جدید",
              style: TextStyle(fontFamily: 'YekanBakh'),
            ),
          ),
          ///////////////////////////Product Two
          SizedBox(
            height: size.height * 0.3,
            child: ListView.builder(
              itemCount: _plantList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                            child: DetailPage(
                              plantId: _plantList[index].plantId,
                            ),
                            type: PageTransitionType.rightToLeft),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.only(right: 1, left: 10),
                      decoration: BoxDecoration(
                        color: Constant.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 80,
                      width: size.width,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Constant.primaryColor,
                                ),
                              ),
                              Positioned(
                                bottom: 5.0,
                                left: 0,
                                right: 0,
                                child: SizedBox(
                                  height: 80,
                                  child: Image.asset(
                                    _plantList[index].imageURL,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(width: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _plantList[index].category,
                                style: const TextStyle(fontFamily: 'YekanBakh'),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                _plantList[index].plantName,
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Text(
                                _plantList[index]
                                    .price
                                    .toString()
                                    .toPersianDigit(),
                                style: TextStyle(
                                    color: Constant.primaryColor,
                                    fontFamily: 'YekanBakh',
                                    fontSize: 24),
                              ),
                              const SizedBox(width: 4),
                              Image.asset(
                                'assets/images/PriceUnit-green.png',
                                height: 20,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}
