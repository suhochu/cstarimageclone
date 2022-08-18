import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:routemaster/routemaster.dart';
import 'package:url_launcher/url_launcher.dart';
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
    entry = OverlayEntry(
      opaque: false,
      builder: (context) => Positioned(
        right: 0,
        top: (MediaQuery.of(context).size.height / 2) - 300,
        bottom: (MediaQuery.of(context).size.height / 2) - 300,
        child: const OverlayWidget(),
      ),
    );
    overlay!.insert(entry!);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showOverlay();
    });
  }

  @override
  Widget build(BuildContext context) {
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

class _OverlayWidgetState extends State<OverlayWidget> {
  bool isClicked = false;
  late Timer _timer;

  void setTimer() {
    _timer = Timer(const Duration(milliseconds: 2000), () {
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
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isClicked = !isClicked;
              setTimer();
            });
          },
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12), topLeft: Radius.circular(12)),
            child: Material(
              child: Container(
                padding: const EdgeInsets.all(3),
                color: Colors.purple.shade600,
                height: 180,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    isClicked
                        ? const Icon(Icons.arrow_forward_ios_outlined, color: Colors.white)
                        : const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                    const SizedBox(height: 15),
                    const RotatedBox(
                      quarterTurns: 3,
                      child: Text('QUICK MENU',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Material(
          child: Column(
            children: [
              MouseRegion(
                onEnter: (event) => stopTimer(),
                onExit: (event) => setTimer(),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  color: Colors.black87,
                  width: isClicked ? 80 : 0,
                  height: 600,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      SideButton(
                          thumbNail: 'PhoneIcon.svg',
                          url: 'https://pf.kakao.com/_lPGBd',
                          svg: true),
                      SideButton(
                          thumbNail: 'kakaoTalk.svg',
                          url: 'https://pf.kakao.com/_lPGBd',
                          svg: true),
                      SideButton(
                          thumbNail: 'st2_con_img02.png',
                          url:
                              'https://nid.naver.com/nidlogin.login?svctype=64&url=https%3A%2F%2Ftalk.naver.com%2Fct%2Fwc4qzd%3Fnidref%3Dhttp%253A%252F%252Fcstar2.79.ypage.kr%252F%23nafullscreen'),
                      SideButton(
                          thumbNail: 'st2_con_img03.png',
                          url: 'https://www.instagram.com/cstarimagemaker/'),
                      SideButton(
                          thumbNail: 'st2_con_img04.png', url: 'https://blog.naver.com/wnduddl55'),
                      SideButton(
                          thumbNail: 'facebook.svg',
                          url: 'https://www.facebook.com/cstarimage/',
                          svg: true),
                      SideButton(
                          thumbNail: 'GoogleMaps.svg',
                          url:
                              'https://www.google.com/maps/place/%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C+%EC%9A%A9%EC%82%B0%EA%B5%AC+%ED%95%9C%EA%B0%95%EB%A1%9C2%EA%B0%80+71/data=!3m1!4b1!4m5!3m4!1s0x357ca219bd6b5c59:0xfd906902750883e6!8m2!3d37.5301773!4d126.9716487?hl=ko',
                          svg: true),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SideButton extends StatelessWidget {
  const SideButton({Key? key, required this.url, required this.thumbNail, this.svg = false})
      : super(key: key);
  final String url;
  final String thumbNail;
  final bool svg;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: MaterialButton(
        onPressed: () {
          launchUrl(Uri.parse(url));
        },
        child: Container(
            margin: svg
                ? const EdgeInsets.symmetric(horizontal: 8, vertical: 8)
                : const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: svg
                ? SvgPicture.asset(
                    'assets/images/SVG/$thumbNail',
                    height: 45,
                    width: 45,
                    fit: BoxFit.fill,
                  )
                : Image.asset(
                    'assets/images/homepage/$thumbNail',
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fill,
                    height: 65,
                    width: 65,
                  )),
      ),
    );
  }
}
