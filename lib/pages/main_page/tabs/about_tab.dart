import 'package:flutter/material.dart';

class AboutTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          CircleAvatar(
            radius: screenSize.width < 500
                ? screenSize.width * 0.5
                : screenSize.width * 0.12,
            backgroundColor: Colors.black54,
            backgroundImage: Image.asset("assets/images/dp.jpg").image,
          ),
          SizedBox(height: screenSize.height * 0.02),
          Text(
            "Rahul Badgujar",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: screenSize.width * 0.03,
            ),
          ),
          SizedBox(height: screenSize.height * 0.01),
          Text(
            "3-star on Codechef | FlutterFire Developer | C++ Programmer",
            style: TextStyle(
              fontSize: screenSize.width * 0.016,
              color: Colors.black.withOpacity(0.65),
            ),
          ),
        ],
      ),
    );
  }
}
