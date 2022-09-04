import 'dart:async';

import 'package:cstar_image_clone/widget/launch_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:routemaster/routemaster.dart';
import '../all_pages_out.dart';

class CstarImageHomePage extends StatefulWidget {
  const CstarImageHomePage({Key? key}) : super(key: key);

  @override
  State<CstarImageHomePage> createState() => _CstarImageHomePageState();
}

class _CstarImageHomePageState extends State<CstarImageHomePage> {
  OverlayEntry? entry;

  void showOverlay() async {
    final overlay = Overlay.of(context);
    bool isSmallerThanMobile = ResponsiveWrapper.of(context).isSmallerThan(MOBILE);
    double screenHeight = MediaQuery.of(context).size.height;
    entry = null;
    entry = OverlayEntry(
      opaque: false,
      builder: (context) => Positioned(
        right: 0,
        top: isSmallerThanMobile ? (screenHeight / 2) - 200 : (screenHeight / 2) - 300,
        bottom: isSmallerThanMobile ? (screenHeight / 2) - 200 : (screenHeight / 2) - 300,
        child: const OverlayWidget(),
      ),
    );
    overlay!.insert(entry!);
  }

  void rebuildOverlay() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showOverlay();
    });
  }

  void hideOverlay() {
    entry!.remove();
    entry = null;
  }

  @override
  void initState() {
    super.initState();
    rebuildOverlay();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (entry!.mounted) {
        hideOverlay();
        showOverlay();
      }
    });

    final indexedPage = IndexedPage.of(context);
    return Scaffold(
      appBar: const TopTabBar(),
      body: PageStackNavigator(
        stack: indexedPage.currentStack,
      ),
    );
  }
}

class OverlayWidget extends StatefulWidget {
  const OverlayWidget({Key? key}) : super(key: key);

  @override
  State<OverlayWidget> createState() => _OverlayWidgetState();
}

class _OverlayWidgetState extends State<OverlayWidget> with SingleTickerProviderStateMixin {
  bool isClicked = false;

  late Animation<double?> boxAnimation;
  late Animation<double?> boxAnimationForMobile;
  late AnimationController animationController;

  late Widget phoneIcon;
  late Widget kakaoTalkIcon;
  late Widget naverTalkTalk;
  late Widget instargramIcon;
  late Widget naverBlog;
  late Widget faceBook;
  late Widget naverMaps;

  late Timer _timer;

  @override
  void initState() {
    _timer = Timer(const Duration(milliseconds: 2000), () {
      setState(() {
        isClicked = false;
      });
    });
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    boxAnimation = Tween(begin: 0.0, end: 80.0).animate(animationController);
    boxAnimationForMobile = Tween(begin: 0.0, end: 60.0).animate(animationController);
    phoneIcon = SvgPicture.asset('assets/images/SVG/PhoneIcon.svg', fit: BoxFit.cover);
    kakaoTalkIcon = SvgPicture.asset('assets/images/SVG/kakaoTalk.svg', fit: BoxFit.cover);
    naverTalkTalk = SvgPicture.asset('assets/images/SVG/naverTalkTalk.svg', semanticsLabel: 'NaverTalkTalk', fit: BoxFit.cover);
    instargramIcon = SvgPicture.asset('assets/images/SVG/instagram.svg', fit: BoxFit.cover);
    naverBlog = SvgPicture.asset('assets/images/SVG/naverBlog.svg', fit: BoxFit.cover);
    faceBook = SvgPicture.asset('assets/images/SVG/facebook.svg', fit: BoxFit.cover);
    naverMaps = SvgPicture.asset('assets/images/SVG/naverMaps.svg', fit: BoxFit.cover);
  }

  void setTimer() {
    if (_timer.isActive) stopTimer();
    _timer = Timer(const Duration(milliseconds: 2000), () {
      setState(() {
        animationController.reverse();
        isClicked = false;
      });
    });
  }

  void stopTimer() {
    _timer.cancel();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isSmallerThanMobile = ResponsiveWrapper.of(context).isSmallerThan(MOBILE);

    return Row(
      children: [
        Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                if (animationController.value == 0) {
                  animationController.forward();
                  isClicked = true;
                  setTimer();
                } else {
                  animationController.reverse();
                  isClicked = false;
                  stopTimer();
                }
              });
            },
            child: ClipRRect(
              borderRadius: isSmallerThanMobile
                  ? const BorderRadius.only(bottomLeft: Radius.circular(6), topLeft: Radius.circular(6))
                  : const BorderRadius.only(bottomLeft: Radius.circular(12), topLeft: Radius.circular(12)),
              child: Material(
                child: Container(
                  padding: const EdgeInsets.all(3),
                  color: Colors.purple.shade600,
                  height: isSmallerThanMobile ? 100 : 180,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      isClicked
                          ? Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.white,
                              size: isSmallerThanMobile ? 14 : 30,
                            )
                          : Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                              size: isSmallerThanMobile ? 14 : 30,
                            ),
                      SizedBox(height: isSmallerThanMobile ? 10 : 15),
                      RotatedBox(
                        quarterTurns: 3,
                        child: Text('QUICK MENU', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: isSmallerThanMobile ? 8 : 16)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Column(
          children: [
            MouseRegion(
              onEnter: (event) => stopTimer(),
              onExit: (event) => setTimer(),
              child: AnimatedBuilder(
                animation: isSmallerThanMobile ? boxAnimationForMobile : boxAnimation,
                builder: (context, child) => Container(
                  color: Colors.black87,
                  height: isSmallerThanMobile ? 400 : 600,
                  width: isSmallerThanMobile ? boxAnimationForMobile.value : boxAnimation.value,
                  child: (boxAnimation.value! > 20)
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            sideButtonLayout(isMobile: isSmallerThanMobile, child: SideButton(icon: phoneIcon, url: URLs.phoneCall)),
                            sideButtonLayout(isMobile: isSmallerThanMobile, child: SideButton(icon: kakaoTalkIcon, url: URLs.kakaoChannel)),
                            sideButtonLayout(isMobile: isSmallerThanMobile, child: SideButton(icon: naverTalkTalk, url: URLs.naverTalkTalk)),
                            sideButtonLayout(isMobile: isSmallerThanMobile, child: SideButton(icon: instargramIcon, url: URLs.instaPage), scale: 0.55),
                            sideButtonLayout(isMobile: isSmallerThanMobile, child: SideButton(icon: naverBlog, url: URLs.naverBlog)),
                            sideButtonLayout(isMobile: isSmallerThanMobile, child: SideButton(icon: faceBook, url: URLs.facebookPage), scale: 0.65),
                            sideButtonLayout(isMobile: isSmallerThanMobile, child: SideButton(icon: naverMaps, url: URLs.naverMap)),
                          ],
                        )
                      : null,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget sideButtonLayout({required bool isMobile, required Widget child, double scale = 0.5}) {
    return SizedBox(
      width: isMobile ? boxAnimationForMobile.value! * scale : boxAnimation.value! * scale,
      height: isMobile ? 30 : 40,
      child: child,
    );
  }
}

class SideButton extends StatelessWidget {
  SideButton({
    Key? key,
    required this.url,
    required this.icon,
  }) : super(key: key);
  final URLs url;
  final Widget icon;
  final LaunchURl _launchURl = LaunchURl();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => _launchURl.selectUrlMethod(url),
          child: icon,
        ));
  }
}
