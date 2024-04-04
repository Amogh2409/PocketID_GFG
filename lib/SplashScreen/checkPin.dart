import 'package:flutter/material.dart';
import 'package:get/get.dart';

String CorrectPin = "";
final snackBar = SnackBar(
  content: const Text('Error '),
  behavior: SnackBarBehavior.floating,
  action: SnackBarAction(
    label: 'Undo',
    textColor: Colors.yellow,
    onPressed: () {
      // Some code to undo the change.
    },
  ),
);

class CheckPin extends StatefulWidget {
  const CheckPin({super.key});

  @override
  State<CheckPin> createState() => _CheckPinState();
}

class _CheckPinState extends State<CheckPin> {
  @override
  Widget build(BuildContext context) {
    return const OtpScreenState();
  }
}

class OtpScreenState extends StatefulWidget {
  const OtpScreenState({super.key});

  @override
  State<OtpScreenState> createState() => _OtpScreenStateState();
}

class _OtpScreenStateState extends State<OtpScreenState> {
  List<String> currentPin = ["", "", "", ""];
  TextEditingController pinOneController = TextEditingController();
  TextEditingController pinTwoController = TextEditingController();
  TextEditingController pinThreeController = TextEditingController();
  TextEditingController pinFourController = TextEditingController();

  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(color: Colors.white),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: <Widget>[
        Expanded(
          child: Container(
            alignment: const Alignment(0, 0.5),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize:
                  MainAxisSize.min, // To make the column as small as possible
              children: <Widget>[
                buildSecurityText(),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ),
        buidNumberPad(),
      ],
    ));
  }

  buidNumberPad() {
    return Expanded(
      child: Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.only(bottom: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                keyboardNumber(
                  n: 1,
                  onPressed: () {},
                ),
                keyboardNumber(
                  n: 2,
                  onPressed: () {},
                ),
                keyboardNumber(
                  n: 3,
                  onPressed: () {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                keyboardNumber(
                  n: 4,
                  onPressed: () {},
                ),
                keyboardNumber(
                  n: 5,
                  onPressed: () {},
                ),
                keyboardNumber(
                  n: 6,
                  onPressed: () {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                keyboardNumber(
                  n: 7,
                  onPressed: () {},
                ),
                keyboardNumber(
                  n: 8,
                  onPressed: () {},
                ),
                keyboardNumber(
                  n: 9,
                  onPressed: () {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  width: 60,
                  child: MaterialButton(
                    onPressed: null,
                    child: SizedBox(),
                  ),
                ),
                keyboardNumber(n: 0, onPressed: () {}),
                SizedBox(
                  width: 60,
                  child: MaterialButton(
                    height: 60,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60)),
                    onPressed: () {},
                    child: const Icon(
                      Icons.backspace_outlined,
                      color: Colors.deepOrange,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  buildSecurityText() {
    return const Text(
      "Enter Security Pin",
      style: TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  setPin(int n, String text) {
    switch (n) {
      case 1:
        pinOneController.text = text;
        break;
      case 2:
        pinTwoController.text = text;
        break;
      case 3:
        pinThreeController.text = text;
        break;
      case 4:
        pinFourController.text = text;
        break;
    }
  }

  buildPinRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PinNumber(
            controller: pinOneController,
            outlineInputBorder: outlineInputBorder),
        PinNumber(
            controller: pinTwoController,
            outlineInputBorder: outlineInputBorder),
        PinNumber(
            controller: pinThreeController,
            outlineInputBorder: outlineInputBorder),
        PinNumber(
            controller: pinFourController,
            outlineInputBorder: outlineInputBorder),
      ],
    );
  }

  buildExitButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8),
          child: MaterialButton(
            onPressed: () {},
            height: 50,
            minWidth: 50,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            child: const Icon(
              Icons.clear,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class keyboardNumber extends StatelessWidget {
  const keyboardNumber({super.key, required this.n, required this.onPressed});

  final int n;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: Colors.blueAccent.withOpacity(0.1)),
      alignment: Alignment.center,
      child: MaterialButton(
        padding: const EdgeInsets.all(8),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
        height: 90,
        child: Text(
          "$n",
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 24,
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class PinNumber extends StatelessWidget {
  const PinNumber(
      {super.key, required this.controller, required this.outlineInputBorder});

  final TextEditingController controller;
  final OutlineInputBorder outlineInputBorder;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: TextField(
        controller: controller,
        enabled: false,
        obscureText: true,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16),
          border: outlineInputBorder,
          filled: true,
          fillColor: Color.fromARGB(51, 255, 255, 255),
        ),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
