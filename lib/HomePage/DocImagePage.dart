import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DocImagePage extends StatefulWidget {
  const DocImagePage({super.key, required this.docName, required this.text});

  final String docName;
  final String text;

  @override
  State<DocImagePage> createState() => _DocImagePageState();
}

class _DocImagePageState extends State<DocImagePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
          foregroundColor: const Color.fromARGB(255, 55, 14, 201),
          elevation: 0,
          centerTitle: true,
          title: Text(
            widget.docName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: 725,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(71, 158, 158, 158),
                          offset: Offset(
                            1.0,
                            1.0,
                          ),
                          blurRadius: 20.0,
                          spreadRadius: 3.0,
                        ), //BoxShadow
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 70,
                              width: 70,
                              child: Image.asset("assets/others.png"),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            height: 210,
                            width: 350,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(103, 104, 103, 103),
                                    offset: Offset(
                                      2.0,
                                      1.0,
                                    ),
                                    blurRadius: 5.0,
                                    spreadRadius: 2.0,
                                  ), //BoxShadow
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ),
                                ]),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: const Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Add Document",
                                      style: TextStyle(
                                        fontSize: 17,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.add_box_outlined,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "Document updated?",
                                  style: TextStyle(fontSize: 15),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 55, 14, 201),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: const Icon(
                                      Icons.camera_alt_rounded,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 55, 14, 201),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: const Icon(
                                      Icons.photo_rounded,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 55, 14, 201),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: const Icon(
                                      Icons.delete_rounded,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
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
