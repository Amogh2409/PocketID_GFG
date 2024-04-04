// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String firstname = 'John';
  String lastname = 'Doe';
  String email = "";
  String gender = "";
  String dob = "24-09-2002";
  String profileUrl = "empty";

  Container builtContainer(title, info) {
    return Container(
      height: 68,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${title}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Text(
                  '${info}',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.edit,
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ProfileModel(),
      child: Scaffold(
        appBar: AppBar(
            title: Text(
              'My Profile',
            ),
            backgroundColor: Color.fromARGB(255, 55, 14, 201)),
        body: Column(
          children: [
            ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                color: Color.fromARGB(255, 55, 14, 201),
                height: 165,
                width: double.infinity,
              ),
            ),
            Transform.translate(
              offset: Offset(0, -70),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      print('Change Profile Picture');
                    },
                    child: CircleAvatar(
                      radius: 68,
                      backgroundColor: Colors.grey[300],
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: FutureBuilder(
                            future: futureFunction(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else {
                                if (snapshot.data == "empty") {
                                  return Icon(
                                    Icons.add_a_photo,
                                    color: Colors.grey,
                                  );
                                } else {
                                  return CachedNetworkImage(
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    imageUrl: "${profileUrl}",
                                    fit: BoxFit.cover,
                                  );
                                }
                              }
                            }),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'First Name',
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 0.5,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Container(
                height: 255,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(103, 104, 103, 103),
                      blurRadius: 5,
                      spreadRadius: 2.5,
                      offset: Offset(2, 1),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 0,
                      spreadRadius: 0,
                      offset: Offset(0, 0),
                    )
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    builtContainer("DOB", "$dob"),
                    Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    builtContainer(
                      "Gender",
                      "$gender",
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    builtContainer(
                      "Email",
                      "$email",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileModel with ChangeNotifier {
  String url = "empty";
  var _pickedImage;

  void pickImageCamera(context) async {
    print('Camera');
  }
}

Future<String> futureFunction() async {
  String url = "empty";
  return url;
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();
    path.lineTo(0, h);
    path.quadraticBezierTo(
      w * 0.5,
      h,
      w,
      h - 70,
    );
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
