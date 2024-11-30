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
            //App bar
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
          SliverPadding(
            //App screen background structure
            padding: EdgeInsets.only(
                left: screenWidth * .05,
                right: screenWidth * .05), // Body margins
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 1,
                (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        top: screenHeight * .2, bottom: screenHeight * .2),
                    child: Column(
                      //Column fitting all widgets on screen
                      children: [
                        Container(
                          child: Row(
                            //First row widgets
                            children: [
                              Container(
                                //Alarms widget whole selection
                                width: screenWidth * .45,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom: screenHeight * .015),
                                      child: Container(
                                        child: InkWell(
                                          onTap: () {
                                            print('Crypto');
                                          },
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Image.asset(
                                            'assets/alarm-icon.png',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text('Alarms')
                                  ],
                                ),
                              ),
                              Container(
                                //Crypto Market widget whole section
                                width: screenWidth * .45,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom: screenHeight * .015),
                                      child: Container(
                                        child: InkWell(
                                          onTap: () {
                                            print('Crypto');
                                          },
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Image.asset(
                                              'assets/crypto-coin.png'),
                                        ),
                                      ),
                                    ),
                                    Text('Crypto Market')
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          //News widget whole section
                          width: screenWidth * .45,
                          child: Padding(
                            padding: EdgeInsets.only(top: screenHeight * .05),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    print('Crypto');
                                  },
                                  borderRadius: BorderRadius.circular(50),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        bottom: screenHeight * 0.015),
                                    child: Image.asset(
                                        'assets/newspaper-icon.png'),
                                  ),
                                ),
                                Text('Market News')
                              ],
                            ),
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
    );
  }
}
