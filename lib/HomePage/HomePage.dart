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

  Container HeadingContainer({text, double? size}) {
    return Container(
      height: 40,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Column(
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
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                "View All",
                style: TextStyle(
                  color: Color.fromARGB(255, 55, 14, 201),
                  fontSize: 12,
                ),
              ),
            ),
          )
          : (text != "Whats New")
            ? const Text("View All",
              style: TextStyle(
                color: Color.fromARGB(255, 55, 14, 201),
                fontSize: 12,
              ),
            ): const Text(""),

        ],
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
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Row(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                HeadingContainer(text: "What's New", size: 15),

                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 55, 14, 201),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
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
                        ], options: CarouselOptions(
                          autoPlay: true,
                          height: 200,
                          autoPlayCurve: Curves.easeOut,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration: const Duration(milliseconds: 1800),
                          viewportFraction: 1
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
