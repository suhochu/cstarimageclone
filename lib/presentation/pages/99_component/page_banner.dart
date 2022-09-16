import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class PageBanner extends StatelessWidget {
  const PageBanner({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.width;
    bool isSmallerThanDesktop = ResponsiveWrapper.of(context).isSmallerThan(DESKTOP);
    bool isSmallerThanMobile = ResponsiveWrapper.of(context).isSmallerThan(MOBILE);
    return Stack(
      children: [
        SizedBox(
            width: isSmallerThanDesktop ? screenSize : 1200,
            height: isSmallerThanDesktop
                ? isSmallerThanMobile
                ? screenSize * 2.5 / 5
                : screenSize * 2 / 5
                : 480,
            child: Image.asset(
              'assets/images/common/0.jpg',
              fit: BoxFit.fill,
            )),
        Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isSmallerThanDesktop
                      ? isSmallerThanMobile
                      ? screenSize * 0.06
                      : screenSize * 0.05
                      : 62,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ))
      ],
    );
  }
}
