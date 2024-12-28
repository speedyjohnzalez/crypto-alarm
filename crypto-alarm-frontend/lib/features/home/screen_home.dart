import 'package:flutter/material.dart';
import '../shared/scaffold.dart';
import 'package:crypto_alarm/features/home/buttons/alarm_button.dart';
import 'package:crypto_alarm/features/home/buttons/crypto_market_button.dart';
import 'package:crypto_alarm/features/home/buttons/market_news_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    return ScaffoldScreen(
      childrenInput: [
        Padding(
          padding: EdgeInsets.only(top: screenHeight * .20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AlarmButton(),
                  CryptoMarketButton(),
                ],
              ),
              MarketNewsButton()
            ],
          ),
        )
      ],
    );
  }
}
