import 'package:flutter/material.dart';

class Alarm_button extends StatelessWidget {
  const Alarm_button({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60), color: Colors.white),
      width: screenWidth * .375,
      height: screenHeight * .14,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: screenHeight * .015),
            child: Container(
              child: InkWell(
                onTap: () {
                  print('Crypto');
                },
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  'assets/alarm-icon-3.png',
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: screenHeight * .01),
            child: Text(
              'Alarms',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
