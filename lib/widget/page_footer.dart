import 'package:cstar_image_clone/widget/launch_url.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class PageFooter extends StatelessWidget {
  PageFooter({Key? key}) : super(key: key);
  final LaunchURl _launchURl = LaunchURl();

  @override
  Widget build(BuildContext context) {
    bool isSmallerThanTablet = ResponsiveWrapper.of(context).isSmallerThan(TABLET);
    bool isSmallerThanMobile = ResponsiveWrapper.of(context).isSmallerThan(MOBILE);
    bool isSmallerThanDesktop = ResponsiveWrapper.of(context).isSmallerThan(DESKTOP);
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      child: ResponsiveRowColumn(
        columnSpacing: isSmallerThanMobile ? 10 : 20,
        rowSpacing: 30,
        rowMainAxisAlignment: MainAxisAlignment.center,
        layout: isSmallerThanTablet ? ResponsiveRowColumnType.COLUMN : ResponsiveRowColumnType.ROW,
        children: [
          ResponsiveRowColumnItem(
            child: GestureDetector(
              onTap: _launchURl.launchKakaoChannel,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Image.asset(
                  'assets/images/common/15.jpeg',
                  fit: BoxFit.fitWidth,
                  width: isSmallerThanDesktop ?
                  isSmallerThanTablet
                      ? isSmallerThanMobile
                          ? screenWidth - 60
                          : 500
                      : screenWidth * (9 / 20) : 550,
                ),
              ),
            ),
          ),
          // const SizedBox(width: 20),
          ResponsiveRowColumnItem(
            child: GestureDetector(
              onTap: () {
                // Todo implement this at android and IOS
              },
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Image.asset(
                  'assets/images/common/14.jpeg',
                  fit: BoxFit.fitWidth,
                  width: isSmallerThanDesktop ? isSmallerThanTablet
                      ? isSmallerThanMobile
                          ? screenWidth - 60
                          : 500
                      : screenWidth * (9 / 20) : 550,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
