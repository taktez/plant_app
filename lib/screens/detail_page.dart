import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:plant/constant/constant.dart';
import 'package:plant/models/models.dart';

class DetailPage extends StatefulWidget {
  final int plantId;
  const DetailPage({super.key, required this.plantId});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> plantLiast = Plant.plantList;
    return Scaffold(
      body: Stack(
        children: [
          //App Bar//////////////////
          Positioned(
            top: 30,
            right: 20,
            left: 20,
            child: Row(
              children: [
                // favorite/////////////
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Constant.primaryColor.withOpacity(0.15),
                  ),
                  child: Icon(
                    plantLiast[widget.plantId].isFavorated == true
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    size: 24,
                    color: Constant.primaryColor,
                  ),
                ),
                const Spacer(),
                //Close///////////////////////////
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Constant.primaryColor.withOpacity(0.15),
                    ),
                    child: Icon(
                      Icons.close,
                      size: 24,
                      color: Constant.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Bag Buy button
          Positioned(
            top: size.height * 0.46,
            child: Container(
              height: size.height,
              width: size.width,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(183, 118, 130, 150),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 80),
                      child: Text(
                        plantLiast[widget.plantId].plantName,
                        style: TextStyle(
                            color: Constant.primaryColor,
                            fontFamily: 'YekanBakh',
                            fontSize: 28),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          plantLiast[widget.plantId]
                              .price
                              .toString()
                              .toPersianDigit(),
                          style: const TextStyle(
                              fontFamily: 'YekanBakh',
                              fontSize: 24,
                              color: Colors.black54),
                        ),
                        const SizedBox(width: 4),
                        Image.asset(
                          'assets/images/PriceUnit-green.png',
                          height: 20,
                        ),
                        const Spacer(),
                        Text(
                          plantLiast[widget.plantId]
                              .rating
                              .toString()
                              .toPersianDigit(),
                          style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'YekanBakh',
                              color: Constant.primaryColor),
                        ),
                        const SizedBox(width: 5),
                        Icon(Icons.star,
                            size: 24, color: Constant.primaryColor),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SingleChildScrollView(
                      child: Text(
                        style: const TextStyle(height: 2),
                        plantLiast[widget.plantId].decription,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //Flower and Text
          Positioned(
            top: 100,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              height: size.height,
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("اندازه‌گیاه"),
                  Text(plantLiast[widget.plantId].size),
                  const SizedBox(height: 20),
                  const Text("رطویت‌هوا"),
                  Text(plantLiast[widget.plantId].humidity.toString()),
                  const SizedBox(height: 20),
                  const Text("دمای نگهداری"),
                  Text(plantLiast[widget.plantId].temperature.toString()),
                ],
              ),
            ),
          ),
          //Image Flower/////////////////
          Positioned(
            top: 130,
            left: 40,
            child: SizedBox(
              height: 300,
              child: Image.asset(plantLiast[widget.plantId].imageURL),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: size.width * 0.9,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Constant.primaryColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0.0, 1.1),
                      blurRadius: 5.0,
                      color: Constant.primaryColor.withOpacity(0.3),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    "افزودن به سبد خرید",
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'YekanBakh'),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Constant.primaryColor.withOpacity(0.5),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0.0, 1.1),
                    blurRadius: 5.0,
                    color: Constant.primaryColor.withOpacity(0.3),
                  ),
                ],
              ),
              child: const Icon(Icons.shopping_cart, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
