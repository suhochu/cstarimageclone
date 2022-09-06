import 'package:cstar_image_clone/widget/launch_url.dart';
import 'package:flutter/material.dart';

class CstarImageCenter extends StatelessWidget {
  const CstarImageCenter({Key? key, required this.screenWidth, required this.isSmallerThanTablet, required this.isSmallerThanDesktop, required this.isSmallerThanMobile}) : super(key: key);
  final double screenWidth;
  final bool isSmallerThanTablet;
  final bool isSmallerThanDesktop;
  final bool isSmallerThanMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(255, 255, 255, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
          Text('CUSTOMER CENTER',
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
            width: isSmallerThanDesktop ? screenWidth - 80 : 1140,
            height: isSmallerThanDesktop
                ? isSmallerThanTablet
                    ? screenWidth * 2 / 3
                    : screenWidth / 3
                : 400,
            child: isSmallerThanTablet
                ? centerInfoContentsColumn(context, spacing: isSmallerThanMobile ? 5 : 15)
                : centerInfoContentsRow(context),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget centerInfoContentsRow(BuildContext context) => Row(
        children: [
          Expanded(flex: 1, child: customerService(context)),
          const SizedBox(width: 30),
          Expanded(flex: 2, child: directions(context)),
        ],
      );

  Widget centerInfoContentsColumn(BuildContext context, {double? spacing = 15}) => Column(
        children: [
          Expanded(flex: 8, child: customerService(context)),
          SizedBox(height: spacing),
          Expanded(flex: 15, child: directions(context)),
        ],
      );

  Container directions(BuildContext context) {
    return Container(
      height: 400,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: const Color.fromRGBO(26, 73, 165, 1),
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: GestureDetector(
              onTap: () => LaunchURl.selectUrlMethod(URLs.cstarDirection),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('DIRECTIONS',
                      style: TextStyle(
                          fontSize: isSmallerThanDesktop ? screenWidth * 0.02 : 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ],
              ),
            ),
          ),
          Expanded(child: naverMap(context))
        ],
      ),
    );
  }

  Widget naverMap(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => LaunchURl.selectUrlMethod(URLs.naverMap),
          child: Stack(
            children: [
              Image.asset(
                'assets/images/common/naverMap.png',
                width: constraints.maxWidth,
                height: constraints.maxWidth,
                fit: BoxFit.fill,
              ),
              Positioned(
                  right: isSmallerThanMobile ? 5 : 20,
                  top: isSmallerThanTablet
                      ? isSmallerThanMobile
                          ? 35
                          : 90
                      : 70,
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Text(
                        '한강로 2가 71,\n백두드레곤 402',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: isSmallerThanTablet
                                ? isSmallerThanMobile
                                    ? 8
                                    : 14
                                : 12),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      );
    });
  }

  Container customerService(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(245, 76, 76, 1),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!isSmallerThanTablet)
            Column(children: [
              Icon(Icons.phone_in_talk,
                  color: Colors.white, size: isSmallerThanDesktop ? screenWidth * 0.05 : 60),
              const SizedBox(height: 30),
            ]),
          Text('CUSTOMER SERVICE',
              style: customServiceTextStyle(isSmallerThanDesktop
                  ? isSmallerThanTablet
                      ? screenWidth * 0.025
                      : screenWidth * 0.019
                  : 25)),
          if (isSmallerThanTablet)
            Column(children: [
              const SizedBox(
                height: 10,
              ),
              Text('010.9340.2890 | 02.482.2890',
                  style: customServiceTextStyle(screenWidth * 0.025)),
              const SizedBox(
                height: 10,
              )
            ]),
          if (!isSmallerThanTablet)
            Column(
              children: [
                const SizedBox(height: 15),
                Text('010.9340.2890',
                    style: customServiceTextStyle(isSmallerThanDesktop ? screenWidth * 0.02666 : 32)),
                const SizedBox(height: 5),
                Text('02.482.2890',
                    style: customServiceTextStyle(isSmallerThanDesktop ? screenWidth * 0.02666 : 32)),
                const SizedBox(height: 15),
              ],
            ),
          Text('궁금한사항 있으시면 언제든 문의주세요!',
              style: TextStyle(
                  fontSize: isSmallerThanDesktop
                      ? isSmallerThanTablet
                          ? screenWidth * 0.019
                          : screenWidth * 0.013
                      : 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  TextStyle customServiceTextStyle(double fontSize, {double letterSpacing = 3}) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        letterSpacing: letterSpacing);
  }

  Container noticeBoard() {
    return Container(
      color: const Color.fromRGBO(43, 180, 186, 1),
      width: 330,
      height: 250,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '빠른상담은',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Text(
                    '유선으로 연결해주세요.',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )
                ],
              ),
              Image.asset(
                'assets/images/homepage/campaign.png',
                color: Colors.white,
                width: 60,
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              color: Colors.white,
              child: const Text('게시물이 없습니다.'),
            ),
          )
        ],
      ),
    );
  }
}
