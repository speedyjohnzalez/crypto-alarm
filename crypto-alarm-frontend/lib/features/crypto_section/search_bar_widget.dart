import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
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
    );
  }
}
