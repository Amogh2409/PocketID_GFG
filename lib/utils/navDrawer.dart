import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pocketid_gfg/menuItems/about.dart';
import 'package:pocketid_gfg/menuItems/settings.dart';
import 'package:pocketid_gfg/utils/themeChanger.dart';
import 'package:pocketid_gfg/utils/users.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import '../menuItems/myProfile.dart';
class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key, required this.email, required this.username});
  final String email;
  final String username;

  @override
  State<NavDrawer> createState() => NavDrawerState();
}

class NavDrawerState extends State<NavDrawer> {
  String themeNow = "dark";
  String profile = "empty";

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              padding: EdgeInsets.zero,
              child: Container(
                child: Stack(
                  // fit: StackFit.expand,
                  children: [
                    Container(
                      color: const Color.fromARGB(255, 55, 14, 201),
                    ),
                    Transform.translate(
                      offset: const Offset(16, 20),
                      child: CircleAvatar(
                        radius: 58,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Transform.rotate(
                              angle: math.pi / 0.299,
                              child: const Icon(
                                Icons.account_balance_wallet_outlined,
                                color: Colors.white,
                                size: 50,
                              ),
                            ),
                            const Text(
                              "PocketID",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(250, 25),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromARGB(26, 0, 0, 0),
                                  blurRadius: 2.0,
                                  spreadRadius: -2.0),
                            ],
                            borderRadius: BorderRadius.circular(50),
                            color: const Color.fromARGB(56, 255, 255, 255)),
                        child: Consumer<ThemeProvider>(
                          builder: (context, ThemeProvider, child) {
                            return GestureDetector(
                              onTap: (() {
                                var theme = ThemeProvider.currentTheme;
                                if (theme == "system" || theme == "light") {
                                  ThemeProvider.changeTheme("dark");
                                } else {
                                  ThemeProvider.changeTheme("light");
                                }
                              }),
                              child: (ThemeProvider.currentTheme == "light")
                                  ? const Icon(Icons.sunny,
                                      size: 28, color: Colors.white)
                                  : const Icon(
                                      Icons.nightlight_outlined,
                                      size: 28,
                                      color: Colors.white,
                                    ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              )),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: const Icon(
              Icons.person_outline_rounded,
              size: 30,
            ),
            title: const Text(
              'My Profile',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
            ),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyProfile()))
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.info_outline_rounded,
              size: 30,
            ),
            title: const Text(
              'About',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
            ),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const About()))
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings_outlined,
              size: 30,
            ),
            title: const Text(
              'Settings',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
            ),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()))
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.help_outline_rounded,
              size: 30,
            ),
            title: const Text(
              'Help',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
            ),
            onTap: () => {
              
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.logout_rounded,
              size: 30,
            ),
            title: const Text(
              'Logout',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
            ),
            onTap: () => {UserManagement().logOut(context)},
          ),
        ],
      ),
    );
  }
}
