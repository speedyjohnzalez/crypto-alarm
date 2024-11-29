import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FrontPage(), // Set FrontPage as the main screen
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xffffffff),
          elevation: 0.0,
        ),
      ),
    );
  }
}

class FrontPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text('CryptoAlarm'),
            actions: [
              InkWell(
                onTap: () {
                  print('Button Pressed');
                },
                borderRadius: BorderRadius.circular(50),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text('Create alarm'),
                      Icon(Icons.add),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 1,
              (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                              width: screenWidth * .50,
                              height: screenHeight * .46,
                              //padding: EdgeInsets.all(10),
                              child: Image.asset('assets/suicidal-jamaican.png',
                                  fit: BoxFit.contain)),
                          Container(
                            width: screenWidth * .50,
                            height: screenHeight * .46,
                            child: Placeholder(), //Crypto widget
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Container(
                        width: screenWidth * .50,
                        height: screenHeight * .46,
                        child: Placeholder(), //Market News
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
