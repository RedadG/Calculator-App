import 'package:flutter/material.dart';

class LogicApp {
  double mediaQueryFontSize(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final double mobileHeightSafeArea = mediaQuery.size.height - mediaQuery.padding.top - mediaQuery.padding.bottom;

    if (mobileHeightSafeArea < 850) {
      return 22;
    } 

    if (mobileHeightSafeArea < 950) {
      return 26;
    }

    return 29;
  }

  bool limitNumbers(numsAbove, BuildContext context) {
    if (numsAbove.length >= 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(239, 75, 75, 75),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  child: Text(
                    'No es posible introducir mas de 10 digitos.',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
          duration: Duration(seconds: 1),
        ),
      );

      return true;
    }

    return false;
  }

}
