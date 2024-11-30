import 'package:flutter/material.dart';

class Market_news_button extends StatelessWidget {
  const Market_news_button({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Container(decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60), color: Colors.white),
      width: screenWidth * .375,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                print('Crypto');
              },
              borderRadius: BorderRadius.circular(50),
              child: Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 0.015),
                child: Image.asset('assets/newspaper-icon.png'),
              ),
            ),
            Padding(
            padding: EdgeInsets.only(bottom: screenHeight * .01),
            child: Text(
              'Market News',
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
