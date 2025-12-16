import 'package:flutter/material.dart';
import '../widgets/product_card.dart';
import '../models/product.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Product> products = [
      Product(name: "Fah Laptop", price: "6000 THB", icon: Icons.laptop_mac),
      Product(name: "Chogun", price: "00 THB", icon: Icons.man),
    ];
    return Scaffold(
      appBar: AppBar(title: Text('My Shop')),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          // --- ส่วนที่ 1: Header (Banner) ---
          _buildHeader(),
          SizedBox(height: 20),
          // --- ส่วนที่ 2: Section Title ---
          Text('New Arrivals', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),

          // --- ส่วนที่ 3: Product Items (Card) ---
          // สินค้าชิ้นที่ 1
          for (var product in products)
            ProductCard(
              name: product.name,
              price: product.price,
              icon: product.icon,
            )

          // ProductCard(
          //   name: "Fah Laptop",
          //   price: "6000 THB",
          //   icon: Icons.laptop_mac,
          // ),
          // // สินค้าชิ้นที่ 2
          // ProductCard(
          //   name: "Chogun",
          //   price: "00 THB",
          //   icon: Icons.man,
          // )
        ],
      ),
    );
  }
}
Widget _buildHeader() {
  return Container(
    height: 150,
    width: double.infinity,
    decoration: BoxDecoration(
    color: Colors.blueAccent,
    borderRadius: BorderRadius.circular(15),
    ),
    child: Center(
      child: Text(
        'Welcome to IT Shop',
         style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ),
  );
}