import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Container settingsContainer(IconData icon, text, Color color, Color color2) {
    return Container(
      height: 75,
      child: Row(
        children: [
          Container(
            height: 54,
            width: 54,
            decoration: BoxDecoration(
              color: color2,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              icon,
              color: color,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Settings',
          style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            // Row(
            //   children: [
            //     Text(
            //       'Settings',
            //       style: TextStyle(
            //         fontSize: 26,
            //         fontWeight: FontWeight.bold,
            //         color: Colors.grey[800],
            //       ),
            //     ),
            //   ],
            // ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'General app settings',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            settingsContainer(Icons.lock_outline, 'Change Pin', Colors.green,
                const Color.fromARGB(40, 76, 175, 79)),
            settingsContainer(Icons.password, 'Change Password', Colors.blue,
                const Color.fromARGB(60, 255, 153, 0)),
          ],
        ),
      ),
    );
  }
}
