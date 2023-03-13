import 'dart:async';

import 'package:flutter/material.dart';
import 'package:virtoxed_text/utils/colors.dart';
import 'package:virtoxed_text/utils/const.dart';
import 'package:virtoxed_text/views/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    function();
  }

  function() async {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhiteColor,
      body: SizedBox(
          height: heigth(context),
          child: const Center(
            child: Text(
              'Logo',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: kblackColor),
            ),
          )),
    );
  }
}
