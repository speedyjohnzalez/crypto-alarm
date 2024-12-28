import 'package:flutter/material.dart';
import '../shared/scaffold.dart';
import 'search_bar_widget.dart';
import './search_results_container.dart';


class CryptoMarketScreen extends StatefulWidget {
  const CryptoMarketScreen({super.key});

  @override
  State<CryptoMarketScreen> createState() => _CryptoMarketScreenState();
}

class _CryptoMarketScreenState extends State<CryptoMarketScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    

    return ScaffoldScreen(
      childrenInput: [
        Padding(
          padding: EdgeInsets.only(top: screenHeight * .025),
          child: SearchBarWidget(),
        ),
        Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.03),
            child: SearchResultsContainer()),
      ],
    );
  }
}
