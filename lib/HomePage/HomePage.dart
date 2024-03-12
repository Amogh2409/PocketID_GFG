import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final docList = [
    "empty",
    "aadhar",
    "pan",
    "voter",
    "driving",
    "vaccine",
    "passport"
        "birth",
    "income",
  ];

  final imageList = [
    "assets/navback.png",
    "assets/img1.jpg",
  ];

  String firstName = "Loading...";
  String lastName = "Loading...";
  String email = "Loading...";
  String docName = "Loading...";

  Container headingContainer({text, double? size}) {
    return Container(
      height: 40,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "${text}",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: size,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          (text == "Quick Links")
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: const Color.fromARGB(255, 55, 14, 201),
                      width: 1,
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    child: Text(
                      "View All",
                      style: TextStyle(
                        color: Color.fromARGB(255, 55, 14, 201),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                )
              : (text != "Whats New")
                  ? const Text(
                      "View All",
                      style: TextStyle(
                        color: Color.fromARGB(255, 55, 14, 201),
                        fontSize: 15,
                      ),
                    )
                  : const Text(""),
        ],
      ),
    );
  }

  Container quickLinks({text, icon, Function? ontap}) {
    return Container(
      width: 147,
      height: 50,
      child: GestureDetector(
        onTap: (() => ontap!()),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black54),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: const Color.fromARGB(31, 158, 158, 158),
                child: Icon(
                  icon,
                  size: 20,
                  color: const Color.fromARGB(101, 0, 0, 0),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: const Color.fromARGB(255, 55, 14, 201),
        title: Row(
          children: [
            Transform.rotate(
              angle: math.pi / 0.299,
              child: const Icon(
                Icons.account_balance_wallet_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            const Text(
              "| PocketID",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.normal),
            )
          ],
        ),
      ),
      // drawer: NewDrawer(
      //   username : firstName,
      //   email: email,
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 80,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Hello,",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    "John",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 55, 14, 201),
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Text(
                                "Welcome back to PocketID",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    CircleAvatar(
                      radius: 23,
                      backgroundColor: const Color.fromARGB(255, 55, 14, 201),
                      child: Container(
                        height: 37,
                        width: 37,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const CircularProgressIndicator(),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                headingContainer(text: "What's New", size: 15),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    height: 200,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 55, 14, 201),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListView(
                      children: [
                        CarouselSlider(
                          items: [
                            Container(
                              height: 250,
                              child: Image.asset(
                                imageList[0],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              height: 250,
                              child: Image.asset(
                                imageList[1],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                          options: CarouselOptions(
                              autoPlay: true,
                              height: 200,
                              autoPlayCurve: Curves.easeOut,
                              enableInfiniteScroll: true,
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 1800),
                              viewportFraction: 1),
                        ),
                        
                      ],
                    ),
                  ),
                ),
                headingContainer(text: "Issued Documents", size: 16),
                SizedBox(
                  height: 190,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                    SizedBox(
                      width: 15,
                    ),
                    // remaining elements
                    ],
                  ),
                ),
                headingContainer(text: "Other Documents", size: 16),
                SizedBox(
                  height: 220,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                    SizedBox(
                      width: 15,
                    ),
                    // remaining elements
                    ],
                  ),
                ),
                headingContainer(text: "Quick Links", size: 18),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        quickLinks(
                            text: "My Profile",
                            icon: Icons.person_add_alt_1_outlined,
                            ontap: () {}),
                        const SizedBox(
                          width: 25,
                        ),
                        quickLinks(
                            text: "Forget Pin",
                            icon: Icons.help_outline_rounded,
                            ontap: () {}),
                        const SizedBox(
                          width: 25,
                        ),
                        quickLinks(
                            text: "About",
                            icon: Icons.info_outline_rounded,
                            ontap: () {}),
                        const SizedBox(
                          width: 25,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
