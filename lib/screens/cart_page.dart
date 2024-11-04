import 'package:flutter/material.dart';
import 'package:plant/models/models.dart';

class CartPage extends StatefulWidget {
  final List<Plant> addToCardPlant;
  const CartPage({super.key, required this.addToCardPlant});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("CartPage"),
      ),
    );
  }
}
