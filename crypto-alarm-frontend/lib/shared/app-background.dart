import 'package:flutter/material.dart';
import 'package:crypto_alarm/shared/custom-app-bar.dart';

class Crypto_page extends StatelessWidget {
  const Crypto_page({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Scaffold(
      body: Container(
        //Code for gradient
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Color.fromARGB(255, 18, 37, 39)],
          ),
        ),
        child: CustomScrollView(
          slivers: [
            Custom_app_bar(),
            SliverPadding(
              //App screen background structure
              padding: EdgeInsets.only(
                  left: screenWidth * .05,
                  right: screenWidth * .05),
                  // Body margins
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: 1,
                  (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(top: screenHeight * .2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //Column fitting all widgets on screen
                        children: [
                          //INSERT WIDGETS HERE
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}