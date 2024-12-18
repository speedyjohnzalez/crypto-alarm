import 'package:flutter/material.dart';
import 'package:crypto_alarm/shared/custom-app-bar.dart';
import "package:crypto_alarm/features/crypto-page/searchbar-functionality.dart";

class Crypto_market_screen extends StatefulWidget {
  const Crypto_market_screen({super.key});

  @override
  State<Crypto_market_screen> createState() => _Crypto_market_screenState();
}

class _Crypto_market_screenState extends State<Crypto_market_screen> {
  TextEditingController _controller = TextEditingController();

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
                  left: screenWidth * .05, right: screenWidth * .05),
              // Body margins
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: 1,
                  (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.03),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        //Column fitting all widgets on screen
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            width: screenWidth * 1,
                            height: screenHeight * .04,
                            child: TextField(
                              autocorrect: false,
                              keyboardType: TextInputType.text,
                              controller: _controller,
                              onChanged: (text) {
                                setState(() {});
                              },
                              decoration: InputDecoration(
                                  hintText: 'Search Crypto Market',
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.search)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: screenHeight * 0.03),
                            child: Container(
                              height: screenHeight * 0.8,
                              width: screenWidth * 1,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Placeholder(),
                            ),
                          ),
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
