import 'package:coffee_shop/common/card.dart';
import 'package:flutter/material.dart';
import 'package:coffee_shop/common/bottom_nav_bar.dart'; // Import BottomNavBar

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4, // Number of tabs
        child: Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: const CusBottomNavBar(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "Assets/images/Vector.jpg",
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.02,
                      top: 0,
                      bottom: 10,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: Offset(1, 4),
                          ),
                        ],
                      ),
                      child: const CircleAvatar(
                        backgroundImage:
                            AssetImage("Assets/images/profile_img.jpg"),
                        radius: 20,
                      ),
                    ),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Text(
                  "Hi AsadUllah,",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFFEEE5DA),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Find your Favorite Coffee",
                    hintStyle: TextStyle(color: Color(0XFFC09E77)),
                    prefixIcon: Icon(Icons.search, color: Color(0XFFC09E77)),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: TabBar(
                  labelColor: Colors.white,
                  indicatorColor: Color(0XFF8D510A),
                  unselectedLabelStyle: TextStyle(color: Color(0XFFC09E77)),
                  tabs: [
                    _buildTabItem("Cappuccin", true),
                    _buildTabItem("Latte", false),
                    _buildTabItem("Americano", false),
                    _buildTabItem("Espresso", false),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, bottom: 0, top: 10, right: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomCard(),
                          Container(
                            height: 100,
                            width: 320,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Image.asset(
                              'Assets/images/offer.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 18),
                              child: Text(
                                'Popular Shops',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Image.asset(
                              'Assets/images/shop 1.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabItem(String text, bool isSelected) {
    return Container(
      height: 30,
      width: 120,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0XFF8D510A) : const Color(0XFFEEE5DA),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
