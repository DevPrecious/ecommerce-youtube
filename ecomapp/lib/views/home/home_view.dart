import 'package:ecomapp/const/colors.dart';
import 'package:ecomapp/views/widgets/category_widget.dart';
import 'package:ecomapp/views/widgets/filter_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final categories = [
    ['Shoe', true],
    ['Clothes', false],
    ['Accessories', false],
    ['Bags', false],
    ['Watches', true],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Image.asset('assets/images/Hamburger.png', scale: 1.5),
        title: Image.asset('assets/images/Explore.png', scale: 1.8),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Image.asset("assets/images/bag-2.png", scale: 1.5),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FilterWidget(
              controller: TextEditingController(),
              hintText: 'Looking for shoes',
            ),
            SizedBox(height: 25),
            Text(
              'Select Catgory',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CategoryWidget(
                      text: categories[index][0].toString(),
                      isSelected: categories[index][1] as bool,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
