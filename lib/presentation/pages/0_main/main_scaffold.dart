import 'dart:async';

import 'package:cstar_image_clone/util/launch_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:routemaster/routemaster.dart';
import '../all_pages_out.dart';

class CstarImageHomePage extends StatefulWidget {
  const CstarImageHomePage({Key? key, required this.child}) : super(key: key);
  final Widget child;

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

    // final indexedPage = IndexedPage.of(context);
    return Scaffold(
      appBar: const TopTabBar(),
      body: widget.child,
    );
  }
}

class OverlayWidget extends StatefulWidget {
  const OverlayWidget({Key? key}) : super(key: key);

  @override
  State<OverlayWidget> createState() => _OverlayWidgetState();
}

class _OverlayWidgetState extends State<OverlayWidget> {
  bool isClicked = false;

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
    _timer = Timer(const Duration(milliseconds: 4000), () {
      setState(() {
        isClicked = false;
      });
    });
    super.initState();
    phoneIcon = const SideButton(url: URLs.phoneCall);
    kakaoTalkIcon = const SideButton(url: URLs.kakaoChannel);
    naverTalkTalk = const SideButton(url: URLs.naverTalkTalk);
    instargramIcon = const SideButton(url: URLs.instaPage);
    naverBlog = const SideButton(url: URLs.naverBlog);
    faceBook = const SideButton(url: URLs.facebookPage);
    naverMaps = const SideButton(url: URLs.naverMap);
  }

  void setTimer() {
    if (_timer.isActive) stopTimer();
    _timer = Timer(const Duration(milliseconds: 4000), () {
      setState(() {
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
                if (isClicked == false) {
                  isClicked = true;
                  setTimer();
                } else {
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
                        child: Text('QUICK MENU',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: isSmallerThanMobile ? 8 : 16)),
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
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: isSmallerThanMobile ? 400 : 600,
                width: isClicked
                    ? isSmallerThanMobile
                        ? 50
                        : 80
                    : 0,
                color: Colors.black54,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return (constraints.minWidth >= 20)
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              sideButtonLayout(isMobile: isSmallerThanMobile, child: phoneIcon),
                              sideButtonLayout(isMobile: isSmallerThanMobile, child: kakaoTalkIcon),
                              sideButtonLayout(isMobile: isSmallerThanMobile, child: naverTalkTalk),
                              sideButtonLayout(isMobile: isSmallerThanMobile, child: instargramIcon, scale: 0.55),
                              sideButtonLayout(isMobile: isSmallerThanMobile, child: naverBlog),
                              sideButtonLayout(isMobile: isSmallerThanMobile, child: faceBook, scale: 0.67),
                              sideButtonLayout(isMobile: isSmallerThanMobile, child: naverMaps),
                            ],
                          )
                        : Column();
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget sideButtonLayout({required bool isMobile, required Widget child, double scale = 0.5}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isClicked
          ? isMobile
              ? 50 * scale
              : 80 * scale
          : 0,
      height: isMobile ? 25 : 40,
      child: child,
    );
  }
}

class SideButton extends StatelessWidget {
  const SideButton({
    Key? key,
    required this.url,
  }) : super(key: key);
  final URLs url;

  @override
  Widget build(BuildContext context) {
    Widget image;
    switch (url) {
      case URLs.naverTalkTalk:
        image = SvgPicture.asset('assets/images/SVG/navertalktalk.svg', fit: BoxFit.cover);
        break;
      case URLs.kakaoChannel:
        image = SvgPicture.asset('assets/images/SVG/bgkakaoTalk.svg', fit: BoxFit.cover);
        break;
      case URLs.instaPage:
        image = SvgPicture.asset('assets/images/SVG/instagram.svg', fit: BoxFit.cover);
        break;
      case URLs.naverBlog:
        image = SvgPicture.asset('assets/images/SVG/naverBlog.svg', fit: BoxFit.cover);
        break;
      case URLs.cstarDirection:
        image = SvgPicture.asset('assets/images/SVG/naverMaps.svg', fit: BoxFit.cover);
        break;
      case URLs.facebookPage:
        image = SvgPicture.asset('assets/images/SVG/facebook.svg', fit: BoxFit.cover);
        break;
      case URLs.naverMap:
        image = SvgPicture.asset('assets/images/SVG/naverMaps.svg', fit: BoxFit.cover);
        break;
      case URLs.phoneCall:
        image = SvgPicture.asset('assets/images/SVG/PhoneIcon.svg', fit: BoxFit.cover);
        break;
    }
    return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => LaunchURl.selectUrlMethod(url),
          child: image,
        ));
  }
}
