import 'package:cstar_image_clone/constants/route_Name.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomeIntroduce extends StatelessWidget {
  const HomeIntroduce(
      {Key? key,
      required this.screenWidth,
      required this.isSmallerThanTablet,
      required this.isSmallerThanDesktop,
      required this.isSmallerThanMobile})
      : super(key: key);

  final double screenWidth;
  final bool isSmallerThanTablet;
  final bool isSmallerThanDesktop;
  final bool isSmallerThanMobile;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: isSmallerThanMobile ? 30 : 60),
      Text('C S T A R',
          style: TextStyle(
              fontSize: isSmallerThanDesktop
                  ? isSmallerThanTablet
                      ? isSmallerThanMobile
                          ? 14
                          : 16
                      : screenWidth * 0.02
                  : 28,
              fontWeight: FontWeight.w300)),
      const SizedBox(height: 5),
      Text('INTRODUCE',
          style: TextStyle(
              fontSize: isSmallerThanDesktop
                  ? isSmallerThanTablet
                      ? isSmallerThanMobile
                          ? 18
                          : 24
                      : screenWidth * 0.03
                  : 36,
              fontWeight: FontWeight.bold)),
      const SizedBox(height: 10),
      SizedBox(
        width: screenWidth,
        child: Column(
          children: [
            introduceCardsBuilder(context, PageName.personalColor, PageName.certifications),
            SizedBox(height: isSmallerThanTablet ? 15 : 30),
            introduceCardsBuilder(context, PageName.purchasing, PageName.inquiry),
          ],
        ),
      )
    ]);
  }

  ResponsiveRowColumn introduceCardsBuilder(BuildContext context, PageName page1, PageName page2) {
    return ResponsiveRowColumn(
      layout: isSmallerThanMobile ? ResponsiveRowColumnType.COLUMN : ResponsiveRowColumnType.ROW,
      rowMainAxisAlignment: MainAxisAlignment.center,
      columnSpacing: isSmallerThanTablet ? 15 : 30,
      rowSpacing: isSmallerThanTablet ? 15 : 30,
      children: [
        ResponsiveRowColumnItem(
          child: IntroduceCard(
            pageName: page1,
            isSmallerThanMobile: isSmallerThanMobile,
            isSmallerThanDesktop: isSmallerThanDesktop,
            screenWidth: screenWidth,
          ),
        ),
        // SizedBox(width: 30 * sizeFactor),
        ResponsiveRowColumnItem(
          child: IntroduceCard(
            pageName: page2,
            isSmallerThanMobile: isSmallerThanMobile,
            isSmallerThanDesktop: isSmallerThanDesktop,
            screenWidth: screenWidth,
          ),
        )
      ],
    );
  }
}

class IntroduceCard extends StatelessWidget {
  IntroduceCard({
    Key? key,
    required this.pageName,
    required this.screenWidth,
    required this.isSmallerThanDesktop,
    required this.isSmallerThanMobile,
  }) : super(key: key);

  final PageName pageName;
  final ValueNotifier<bool> _colorChangeNotifier = ValueNotifier(false);
  final double screenWidth;
  final bool isSmallerThanDesktop;
  final bool isSmallerThanMobile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        routeWithPageName(pageName, context);
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (PointerEvent details) => _colorChangeNotifier.value = true,
        onExit: (PointerEvent details) => _colorChangeNotifier.value = false,
        child: Stack(
          children: [
            ValueListenableBuilder<bool>(
              valueListenable: _colorChangeNotifier,
              builder: (context, value, child) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                child: Image.asset(
                  'assets/images/homepage/${_getImages(pageName)}',
                  width: isSmallerThanDesktop
                      ? isSmallerThanMobile
                          ? screenWidth - 80
                          : (screenWidth - 100) / 2
                      : 550,
                  height: isSmallerThanMobile ? (screenWidth - 100) * 0.4 : null,
                  fit: BoxFit.cover,
                  color: _colorChangeNotifier.value ? Colors.black38 : Colors.transparent,
                  colorBlendMode: BlendMode.luminosity,
                  filterQuality: FilterQuality.low,
                ),
              ),
            ),
            Positioned(
              top: isSmallerThanDesktop ? 13 : 20,
              left: isSmallerThanDesktop ? 13 : 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(_getTitles(pageName),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: isSmallerThanDesktop
                                  ? isSmallerThanMobile
                                      ? screenWidth * 0.04
                                      : screenWidth * 0.025
                                  : 35,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(width: 5),
                      Container(
                        padding: isSmallerThanMobile ? null : const EdgeInsets.only(top: 5),
                        child: Icon(
                          Icons.arrow_circle_right,
                          color: Colors.white,
                          size: isSmallerThanDesktop
                              ? isSmallerThanMobile
                                  ? screenWidth * 0.04
                                  : screenWidth * 0.03
                              : 30,
                        ),
                      ),
                    ],
                  ),
                  if (!isSmallerThanMobile) SizedBox(height: isSmallerThanDesktop ? screenWidth * 0.015 : 30),
                  if (!isSmallerThanMobile)
                    Text(
                      _getContents(pageName),
                      style: TextStyle(
                          fontSize: isSmallerThanDesktop
                              ? isSmallerThanMobile
                                  ? screenWidth * 0.022
                                  : screenWidth * 0.015
                              : 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getTitles(PageName pageName) {
    switch (pageName) {
      case PageName.personalColor:
        return '퍼스널컬러진단';
      case PageName.certifications:
        return '컬러자격증과정';
      case PageName.purchasing:
        return '컬러교구구입';
      case PageName.inquiry:
        return '기업교육 및 강의문의';
      default:
        return 'CSTAR 이미지';
    }
  }

  String _getContents(PageName pageName) {
    switch (pageName) {
      case PageName.personalColor:
        return 'CSTAR 퍼스널컬러진단을 \n안내해 드립니다.';
      case PageName.certifications:
        return 'CSTAR 컬러자격증과정을 \n안내해 드립니다.';
      case PageName.purchasing:
        return 'STAR 컬러교구구입을 \n안내해 드립니다.';
      case PageName.inquiry:
        return 'CSTAR 기업교육 및 강의문의를 \n안내해 드립니다.';
      default:
        return 'CSTAR 이미지';
    }
  }

  String? _getImages(PageName pageName) {
    switch (pageName) {
      case PageName.personalColor:
        return 'IntroduceCard_PersonalColor.jpg';
      case PageName.certifications:
        return 'IntroduceCard_Certification.jpg';
      case PageName.purchasing:
        return 'IntroduceCard_Purchasing.jpg';
      case PageName.inquiry:
        return 'IntroduceCard_Inquiry.jpg';
      default:
        return null;
    }
  }
}
