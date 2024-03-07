import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pocketid_gfg/utils/reusable.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 55, 14, 201),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 70,
              ),
              const Icon(
                Icons.account_balance_wallet_outlined,
                color: Colors.white,
                size: 90,
              ),
              const Text(
                "PocketID",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.normal),
              ),
              Center(
                child: Column(
                  children: [
                    SafeArea(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: Container(
                        height: 360,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          children: <Widget>[
                            const SizedBox(
                              height: 40,
                            ),
                            reusableTextField("Email", Icons.person, false,
                                _emailTextController),
                            const SizedBox(
                              height: 15,
                            ),
                            reusableTextField("Password", Icons.lock, true,
                                _passwordTextController),
                            const SizedBox(
                              height: 25,
                            ),
                            Container(
                              height: 35,
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              height: 43,
                              width: 150,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 55, 14, 201),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Already have an account?",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "Sign In",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 55, 14, 201),
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              
                              ],
                            )
                          ],
                        ),
                      ),
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
