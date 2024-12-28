import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';

class SearchResultsContainer extends StatefulWidget {
  const SearchResultsContainer({super.key});

  @override
  State<SearchResultsContainer> createState() => _SearchResultsContainerState();
}

class _SearchResultsContainerState extends State<SearchResultsContainer> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    final channel = WebSocketChannel.connect(
      Uri.parse('ws://10.0.2.2:8080'),
    );
    var price = '0';
    return Container(
      height: screenHeight * 0.8,
      width: screenWidth * 1.0,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: channel.stream,
              builder: (context, snapshot) {
                var search = 'XLM-USD';
                dynamic cryptoData = jsonDecode(utf8.decode(snapshot.data));
                // print(cryptoData);
                if (cryptoData['product_id'] == search) {
                  price = cryptoData['price'];
                  return Column(
                    children: [
                      Text(
                        cryptoData['product_id'],
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      Text(
                        '${cryptoData['price']}',
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      Text(
                        search,
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      Text(
                        price,
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
