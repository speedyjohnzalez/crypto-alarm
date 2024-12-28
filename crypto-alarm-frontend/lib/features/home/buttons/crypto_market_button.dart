import 'package:flutter/material.dart';
import 'package:crypto_alarm/features/crypto_section/screen_crypto_market.dart';

class CryptoMarketButton extends StatelessWidget {
  const CryptoMarketButton({super.key});

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
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CryptoMarketScreen()),
            );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * .015),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Image.asset(
                  'assets/xlm.png',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * .01),
              child: Text(
                'Crypto Market',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
