import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
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
                      right: MediaQuery.of(context).size.width * 0.03,
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
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Color(0xFFEEE5DA),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: Offset(0, 4),
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
                padding: const EdgeInsets.only(left: 4.0),
                child: TabBar(
                  labelColor: Colors.white,
                  indicatorColor: Color(0XFF8D510A),
                  unselectedLabelStyle: TextStyle(color: Color(0XFFC09E77)),
                  tabs: [
                    Container(
                      height: 30,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Color(0XFF8D510A),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Cappuccino",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold, // Optional
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Color(0XFFEEE5DA),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Latte",
                          style: TextStyle(
                            fontSize: 11,

                            fontWeight: FontWeight.bold, // Optional
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Color(0XFFEEE5DA),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Americano",
                          style: TextStyle(
                            fontSize: 11,

                            fontWeight: FontWeight.bold, // Optional
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Color(0XFFEEE5DA),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Expresso",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold, // Optional
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    Center(child: Text("All Coffees")),
                    Center(child: Text("Hot Coffees")),
                    Center(child: Text("Cold Coffees")),
                    Center(child: Text("Cold Coffees")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
