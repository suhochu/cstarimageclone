import 'dart:ui';

import 'package:cstar_image_clone/widget/launch_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../widget/slide_show.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({Key? key, required this.isSmallerThanDesktop, required this.isSmallerThanMobile, required this.screenWidth}) : super(key: key);
  final bool isSmallerThanDesktop;
  final bool isSmallerThanMobile;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {

    return Stack(children: [
      Container(
        color: Colors.blueGrey,
        child: ImageSlideshow(
          width: isSmallerThanDesktop ? screenWidth : 1200,
          height: isSmallerThanDesktop
              ? isSmallerThanMobile
                  ? screenWidth * 3 / 5
                  : screenWidth * 2 / 5
              : 480,
          initialPage: 0,
          autoPlayInterval: 3000,
          isLoop: true,
          children: [
            Image.asset(
              'assets/images/homepage/vis01.jpeg',
              fit: BoxFit.fill,
              filterQuality: FilterQuality.low,
            ),
            Image.asset('assets/images/homepage/vis02.jpeg', fit: BoxFit.fill, filterQuality: FilterQuality.low),
            Image.asset('assets/images/homepage/vis03.jpeg', fit: BoxFit.fill, filterQuality: FilterQuality.low),
          ],
        ),
      ),
      Positioned(
        left: 0,
        right: 0,
        top: 0,
        bottom: 0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 0.3, sigmaY: 0.3),
              child: Image(
                image: const AssetImage('assets/images/homepage/mtxt.png'),
                width: isSmallerThanDesktop
                    ? isSmallerThanMobile
                        ? screenWidth * 0.5
                        : screenWidth * 0.3
                    : 400,
                color: const Color.fromRGBO(255, 255, 255, 0.95),
                filterQuality: FilterQuality.high,
                colorBlendMode: BlendMode.modulate,
                isAntiAlias: true,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 20),
            KakaoTalkButton(),
          ],
        ),
      )
    ]);
  }
}

class KakaoTalkButton extends StatelessWidget {
  KakaoTalkButton({
    Key? key,
  }) : super(key: key);

  final ValueNotifier<bool> _colorChangeNotifier = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isSmallerThanDesktop = ResponsiveWrapper.of(context).isSmallerThan(DESKTOP);
    bool isSmallerThanMobile = ResponsiveWrapper.of(context).isSmallerThan(MOBILE);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (PointerEvent details) => _colorChangeNotifier.value = true,
      onExit: (PointerEvent details) => _colorChangeNotifier.value = false,
      child: ValueListenableBuilder<bool>(
        valueListenable: _colorChangeNotifier,
        builder: (context, value, child) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: isSmallerThanDesktop
                ? isSmallerThanMobile
                    ? const EdgeInsets.symmetric(vertical: 5, horizontal: 10)
                    : const EdgeInsets.symmetric(vertical: 8, horizontal: 15)
                : const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(color: _colorChangeNotifier.value == false ? const Color.fromRGBO(255, 202, 40, 1) : const Color.fromRGBO(55, 30, 32, 1)),
            child: GestureDetector(
              onTap: () => LaunchURl.selectUrlMethod(URLs.kakaoChannel),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/images/SVG/kakaoTalk.svg',
                    fit: BoxFit.fitWidth,
                    width: isSmallerThanDesktop
                        ? isSmallerThanMobile
                            ? screenWidth * 0.05
                            : screenWidth * 0.033
                        : 35,
                  ),
                  const SizedBox(width: 15),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    child: Text(
                      '카카오톡 문의',
                      style: TextStyle(
                          color: _colorChangeNotifier.value == true ? const Color.fromRGBO(255, 202, 40, 1) : const Color.fromRGBO(55, 30, 32, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: isSmallerThanDesktop
                              ? isSmallerThanMobile
                                  ? screenWidth * 0.03
                                  : screenWidth * 0.02
                              : 22),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
