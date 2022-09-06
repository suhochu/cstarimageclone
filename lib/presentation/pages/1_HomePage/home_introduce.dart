import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../all_pages_out.dart';

class HomeIntroduce extends StatelessWidget {
  HomeIntroduce({Key? key, required this.screenWidth, required this.isSmallerThanTablet, required this.isSmallerThanDesktop, required this.isSmallerThanMobile})
      : super(key: key);
  final List<String> titles = [
    '퍼스널컬러진단',
    '컬러자격증과정',
    '컬러교구구입',
    '기업교육 및 강의문의',
  ];
  final List<String> contents = ['CSTAR 퍼스널컬러진단을 \n안내해 드립니다.', 'CSTAR 컬러자격증과정을 \n안내해 드립니다.', 'CSTAR 컬러교구구입을 \n안내해 드립니다.', 'CSTAR 기업교육 및 강의문의를 \n안내해 드립니다.'];

  final List<String> routePages = [
    '/${PersonalColorDiagnosisPage.routeName}',
    '/${CertificationPage.routeName}?query=1',
    '/${PurchasingTeachingToolPage.routeName}',
    '/${InquiryEducationOrLecturePage.routeName}',
  ];

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
            introduceCardsBuilder(context, 0, 1),
            SizedBox(height: isSmallerThanTablet ? 15 : 30),
            introduceCardsBuilder(context, 2, 3),
          ],
        ),
      )
    ]);
  }

  ResponsiveRowColumn introduceCardsBuilder(BuildContext context, int index1, int index2) {
    // bool isSmallerThanTablet = ResponsiveWrapper.of(context).isSmallerThan(TABLET);
    // bool isSmallerThanMobile = ResponsiveWrapper.of(context).isSmallerThan(MOBILE);
    return ResponsiveRowColumn(
      layout: isSmallerThanMobile ? ResponsiveRowColumnType.COLUMN : ResponsiveRowColumnType.ROW,
      rowMainAxisAlignment: MainAxisAlignment.center,
      columnSpacing: isSmallerThanTablet ? 15 : 30,
      rowSpacing: isSmallerThanTablet ? 15 : 30,
      children: [
        ResponsiveRowColumnItem(
          child: IntroduceCard(
            title: titles[index1],
            content: contents[index1],
            index: index1,
            route: routePages[index1],
            isSmallerThanMobile: isSmallerThanMobile,
            isSmallerThanDesktop: isSmallerThanDesktop,
            screenWidth: screenWidth,
          ),
        ),
        // SizedBox(width: 30 * sizeFactor),
        ResponsiveRowColumnItem(
          child: IntroduceCard(
            title: titles[index2],
            content: contents[index2],
            index: index2,
            route: routePages[index2],
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
    required this.title,
    required this.content,
    required this.index,
    required this.route,
    required this.screenWidth,
    required this.isSmallerThanDesktop,
    required this.isSmallerThanMobile,
  }) : super(key: key);

  final String title;
  final String content;
  final int index;
  final String route;

  final ValueNotifier<bool> _colorChangeNotifier = ValueNotifier(false);
  final double screenWidth;
  final bool isSmallerThanDesktop;
  final bool isSmallerThanMobile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Routemaster.of(context).push(route);
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
                // animation: boxAnimation,
                duration: const Duration(milliseconds: 300),
                child: Image.asset(
                  'assets/images/homepage/st1_con${index + 1}.jpg',
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
                      Text(title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: isSmallerThanDesktop
                                  ? isSmallerThanMobile
                                      ? screenWidth * 0.035
                                      : screenWidth * 0.025
                                  : 35,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(width: 5),
                      Container(
                          padding: const EdgeInsets.only(top: 5),
                          child: Icon(Icons.arrow_circle_right, color: Colors.white, size: isSmallerThanDesktop ? screenWidth * 0.03 : 30)),
                    ],
                  ),
                  SizedBox(height: isSmallerThanDesktop ? screenWidth * 0.015 : 30),
                  Text(
                    content,
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
}
