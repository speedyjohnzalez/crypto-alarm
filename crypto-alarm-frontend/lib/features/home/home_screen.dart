import 'package:flutter/material.dart';
import '../shared/scaffold.dart';
import 'package:crypto_alarm/features/home/buttons/alarm_button.dart';
import 'package:crypto_alarm/features/home/buttons/cryptomarket_button.dart';
import 'package:crypto_alarm/features/home/buttons/market_news_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldScreen(childrenInput: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AlarmButton(),
          CryptoMarketButton(),
        ],
      ),
      MarketNewsButton()
    ]);
  }
}
