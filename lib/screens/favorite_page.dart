import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:plant/constant/constant.dart';
import 'package:plant/models/models.dart';
import 'package:plant/screens/detail_page.dart';
import 'package:plant/screens/home_page.dart';
import 'package:plant/screens/root.dart';

class FavoritePage extends StatefulWidget {
  final List<Plant> favoritPlant;
  const FavoritePage({super.key, required this.favoritPlant});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  int selectedIndex = 0;
  final List<Plant> _plantList = Plant.plantList;
  bool toggleIsFavorit(bool isFavorites) {
    return !isFavorites;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: widget.favoritPlant.isEmpty
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RootPage(),
                            ),
                          );
                        },
                        child: Image.asset('assets/images/favorited.png')),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "ظاهر به هیچی علاقه نداری...",
                    style: TextStyle(
                        color: Constant.primaryColor, fontFamily: 'YekanBakh'),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: widget.favoritPlant.length,
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
    );
  }
}
