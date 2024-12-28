import 'package:flutter/material.dart';
import 'package:crypto_alarm/features/shared/app_bar_custom.dart';

/// Custom scaffold widget for background color, screen division, and custom app bar
class ScaffoldScreen extends StatelessWidget {
  final List<Widget> childrenInput;

  /// Custom scaffold widget constructor. Takes in a list of child widgets (children: [])
  const ScaffoldScreen({super.key, required this.childrenInput});

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
            CustomAppBar(),
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
                      padding: EdgeInsets.only(top: screenHeight * 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //Column fitting all widgets on screen
                        children: childrenInput
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