// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:pocketid_gfg/menuItems/myProfile.dart';
import 'package:provider/provider.dart';

import '../menuItems/about.dart';
import '../menuItems/settings.dart';
import '../utils/navDrawer.dart';

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

  Future<String> getDocInfo(String doc) async {
    // get the document info from the database
    // return the document name if it exists
    // else return "empty"
    return "empty";
  }

    Future<String> getProfile() async {
    return "empty";
  }

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
                "$text",
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

  SizedBox quickLinks({text, icon, Function? ontap}) {
    return SizedBox(
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

  SizedBox extractedContainer({text, image, doc, isSaved}) {
    bool showDoc = false;
    return SizedBox(
      width: 320,
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 280,
            height: 170,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                foregroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.white;
                  } else {
                    return Colors.white;
                  }
                }),
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.white;
                  } else {
                    return Colors.white;
                  }
                }),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 70,
                        width: 70,
                        child: Image.asset("$image"),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$text",
                            style: const TextStyle(
                                letterSpacing: 0.8,
                                fontFamily: "Poppins-Reg",
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "XXXX-XXXX-XXXX",
                            style: TextStyle(
                              color: Colors.black45,
                              fontFamily: "Lato-Reg",
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FutureBuilder(
                    future: getDocInfo(doc),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text(
                          "Save Now",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        );
                      } else {
                        if (snapshot.data == "empty") {
                          return Container(
                            height: 45,
                            width: 219,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 55, 14, 201),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Center(
                              child: Text(
                                "Save Now",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            height: 45,
                            width: 219,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 55, 14, 201),
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: const Color.fromARGB(255, 55, 14, 201),
                                width: 1,
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                "View Now",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 55, 14, 201),
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          );
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox extractedBox({text, image}) {
    return SizedBox(
      height: 200,
      width: 230,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 185,
            width: 195,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(130, 158, 158, 158),
                  spreadRadius: 0,
                  blurRadius: 0,
                  offset: Offset(1, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 23,
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: const Color.fromARGB(255, 55, 14, 201),
                  child: Container(
                    height: 100,
                    width: 100,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Image.asset(
                      "$image",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "$text",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      letterSpacing: 0.8,
                      fontFamily: "Poppins-Reg",
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
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
      drawer: NavDrawer(
        username : firstName,
        email: email,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            // color: Colors.white,
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 80,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Hi,",
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            // color: Colors.black
                                          ),
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          "${firstName}",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 55, 14, 201),
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    Text(
                                      "Welocome back to PocketID",
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            ChangeNotifierProvider<ProfileModel>(
                              create: (context) => ProfileModel(),
                              builder: (context, child) {
                                return CircleAvatar(
                                  radius: 23,
                                  backgroundColor:
                                      Color.fromARGB(255, 55, 14, 201),
                                  child: Consumer<ProfileModel>(
                                    builder: (context, ProfileModel, child) {
                                      return Container(
                                        height: 37,
                                        width: 37,
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: FutureBuilder(
                                          future: getProfile(),
                                          builder: ((context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return CircularProgressIndicator();
                                            } else {
                                              if (snapshot.data == "empty") {
                                                return Container();
                                              } else {
                                                return Image.network(
                                                  "${snapshot.data}",
                                                  fit: BoxFit.cover,
                                                );
                                              }
                                            }
                                          }),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                headingContainer(text: "What's New?", size: 15.0),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2.0,
                              blurRadius: 3.0,
                              color: Color.fromARGB(182, 158, 158, 158))
                        ]),
                    height: 200,
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
                                child: Image.asset(
                                  imageList[1],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                            options: CarouselOptions(
                              autoPlay: true,
                              height: 200,
                              autoPlayCurve: Curves.elasticOut,
                              enableInfiniteScroll: true,
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 1800),
                              viewportFraction: 1,
                            ))
                      ],
                    ),
                  ),
                ),
                headingContainer(text: "Issued Documents", size: 15.0),
                Container(
                  height: 190,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      extractedContainer(
                          text: "Aadhaar Card",
                          image: "assets/aadhaar.png",
                          doc: "aadhaar",
                          isSaved: 1),
                      extractedContainer(
                          text: "PAN Card",
                          image: "assets/pan.png",
                          doc: "pan",
                          isSaved: 2),
                      extractedContainer(
                          text: "Driving License",
                          image: "assets/others.png",
                          doc: "driving",
                          isSaved: 3),
                      extractedContainer(
                          text: "Covid Vaccine",
                          image: "assets/others.png",
                          doc: "vaccine",
                          isSaved: 4)
                    ],
                  ),
                ),
                headingContainer(text: "Other Documents", size: 15.0),
                Container(
                    // color: Colors.white,
                    height: 220,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        extractedBox(
                            text: "Vehicle Registraion",
                            image: "assets/vregistration.jpg"),
                        extractedBox(
                            text: "Birth Ceritificate",
                            image: "assets/birthcertificate.png"),
                        extractedBox(
                            text: "Income Certificate",
                            image: "assets/income-certificate.jpg")
                      ],
                    )),
                headingContainer(text: "Quick Links", size: 18.0),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        quickLinks(
                            text: "My Profile",
                            icon: Icons.person_add_alt_1_outlined,
                            ontap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MyProfile()));
                            }),
                        SizedBox(
                          width: 25,
                        ),
                        quickLinks(
                            text: "Forgit PIN",
                            icon: Icons.help_outline_rounded,
                            ontap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SettingsPage()));
                            }),
                        SizedBox(
                          width: 25,
                        ),
                        quickLinks(
                            text: "About",
                            icon: Icons.info_outline_rounded,
                            ontap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const About()));
                            }),
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

class DocContainer extends StatelessWidget {
  const DocContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[];
        },
        body: ListView.builder(
          itemCount: 30,
          padding: EdgeInsets.all(10),
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 50,
              child: Center(
                child: Text('Item $index'),
              ),
            );
          },
        ),
      ),
    );
  }
}
