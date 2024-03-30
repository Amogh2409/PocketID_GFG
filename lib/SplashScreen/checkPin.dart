import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                keyboardNumber(n: 0,
                    onPressed: () {}),

                SizedBox(
                  width: 60,
                  child: MaterialButton(
                    height: 60,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60)
                    ),
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
