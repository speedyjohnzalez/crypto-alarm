import 'package:flutter/material.dart';

class Custom_app_bar extends StatelessWidget {
  const Custom_app_bar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SliverAppBar(
        //App bar
        leading: ModalRoute.of(context)?.isFirst ?? false
            ? null // Don't show back button if it's the first screen
            : IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
        pinned: true,
        title: Text(
          'CryptoAlarm',
          style: TextStyle(
            color: Color(0xffffffff),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0), // Height of the line
          child: Container(
            color: const Color.fromARGB(255, 255, 255, 255), // Line color
            height: 1.0, // Thickness of the line
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              print('Button Pressed');
            },
            highlightColor: Color(0xff000000),
            borderRadius: BorderRadius.circular(50),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xffffffff),
              ),
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
          ),
        ],
      ),
    );
  }
}
