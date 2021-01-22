import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:my_portfolio/constants.dart';

class AboutTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            CircleAvatar(
              radius: screenSize.aspectRatio > 1.0
                  ? screenSize.height * 0.15
                  : screenSize.width * 0.18,
              backgroundColor: Colors.black54,
              backgroundImage: Image.asset("assets/images/dp.jpg").image,
            ),
            SizedBox(height: screenSize.height * 0.02),
            Text(
              "Rahul Badgujar",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: screenSize.aspectRatio > 1
                    ? screenSize.width * 0.025
                    : screenSize.height * 0.03,
              ),
            ),
            SizedBox(height: screenSize.height * 0.01),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: screenSize.width * 0.75,
                maxHeight: screenSize.height * 0.03,
              ),
              child: Marquee(
                text:
                    "| 3-star on Codechef | FlutterFire Developer | C++ Programmer |",
                velocity: 30,
                blankSpace: screenSize.width * 0.1,
                fadingEdgeEndFraction: 0.1,
                fadingEdgeStartFraction: 0.1,
                showFadingOnlyWhenScrolling: true,
                style: TextStyle(
                  fontSize: screenSize.aspectRatio > 1
                      ? screenSize.width * 0.016
                      : screenSize.height * 0.02,
                  color: secondaryTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
