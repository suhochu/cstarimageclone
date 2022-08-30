import 'dart:ui';

import 'package:cstar_image_clone/widget/launch_url.dart';
import 'package:flutter/material.dart';
import '../../../widget/slide_show.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.width;
    bool isSmallerThanDesktop = ResponsiveWrapper.of(context).isSmallerThan(DESKTOP);
    bool isSmallerThanMobile = ResponsiveWrapper.of(context).isSmallerThan(MOBILE);

    return Stack(children: [
      Container(
        color: Colors.blueGrey,
        child: ImageSlideshow(
          width: isSmallerThanDesktop ? screenSize : 1200,
          height: isSmallerThanDesktop
              ? isSmallerThanMobile
                  ? screenSize * 3 / 5
                  : screenSize * 2 / 5
              : 480,
          initialPage: 0,
          autoPlayInterval: 3000,
          isLoop: true,
          children: [
            Image.asset('assets/images/homepage/vis01.jpeg', fit: BoxFit.fill, filterQuality: FilterQuality.low,),
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
                        ? screenSize * 0.5
                        : screenSize * 0.3
                    : 400,
                color: const Color.fromRGBO(255, 255, 255, 0.95),
                filterQuality: FilterQuality.high,
                colorBlendMode: BlendMode.modulate,
                isAntiAlias: true,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 20),
            const KakaoTalkButton(),
          ],
        ),
      )
    ]);
  }
}

class KakaoTalkButton extends StatefulWidget {
  const KakaoTalkButton({
    Key? key,
  }) : super(key: key);

  @override
  State<KakaoTalkButton> createState() => _KakaoTalkButtonState();
}

class _KakaoTalkButtonState extends State<KakaoTalkButton> with SingleTickerProviderStateMixin {
  bool isInRegion = false;
  LaunchURl launchURl = LaunchURl();
  late Animation<Color?> boxAnimation;
  late Animation<Color?> textAnimation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    boxAnimation = ColorTween(begin: Colors.yellow, end: const Color.fromRGBO(55, 30, 32, 1))
        .animate(animationController);
    textAnimation = ColorTween(begin: const Color.fromRGBO(55, 30, 32, 1), end: Colors.yellow)
        .animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isSmallerThanTablet = ResponsiveWrapper.of(context).isSmallerThan(TABLET);
    bool isSmallerThanDesktop = ResponsiveWrapper.of(context).isSmallerThan(DESKTOP);
    bool isSmallerThanMobile = ResponsiveWrapper.of(context).isSmallerThan(MOBILE);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (PointerEvent details) {
        setState(() {
          animationController.forward();
        });
      },
      onExit: (PointerEvent details) {
        setState(() {
          animationController.reverse();
        });
      },
      child: AnimatedBuilder(
          animation: boxAnimation,
          builder: (context, child) {
            return Container(
              padding: isSmallerThanDesktop
                  ? isSmallerThanMobile
                      ? const EdgeInsets.symmetric(vertical: 10, horizontal: 10)
                      : const EdgeInsets.symmetric(vertical: 15, horizontal: 15)
                  : const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(color: boxAnimation.value),
              child: GestureDetector(
                onTap: launchURl.launchKakaoChannel,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/homepage/mtxt_bn.png',
                      fit: BoxFit.fitWidth,
                      width: isSmallerThanDesktop
                          ? isSmallerThanMobile
                              ? screenWidth * 0.05
                              : screenWidth * 0.033
                          : 35,
                    ),
                    const SizedBox(width: 15),
                    AnimatedBuilder(
                      animation: textAnimation,
                      builder: (context, child) {
                        return Text(
                          '카카오톡 문의',
                          style: TextStyle(
                              color: textAnimation.value,
                              fontWeight: FontWeight.bold,
                              fontSize: isSmallerThanDesktop ? isSmallerThanMobile ? screenWidth * 0.03 : screenWidth * 0.02 : 22),
                        );
                      },
                    ),
                    // const SizedBox(width: 15),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
