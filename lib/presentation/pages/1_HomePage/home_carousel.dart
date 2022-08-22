import 'dart:ui';
import 'package:cstar_image_clone/widget/launch_url.dart';
import 'package:flutter/material.dart';
import '../../../widget/slide_show.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double? sliderSizeFactor = ResponsiveValue(context, defaultValue: 1.0, valueWhen: [
      const Condition.smallerThan(name: DESKTOP, value: 2 / 3),
    ]).value;

    double? kakaoButtonSizeFactor = ResponsiveValue(context, defaultValue: 1.0, valueWhen: [
      const Condition.smallerThan(name: DESKTOP, value: 4 / 5),
    ]).value;

    return Stack(children: [
      Container(
        color: Colors.blueGrey,
        child: ImageSlideshow(
          width: MediaQuery.of(context).size.width,
          height: 600 * sliderSizeFactor!,
          initialPage: 0,
          autoPlayInterval: 3000,
          isLoop: true,
          children: [
            Image.asset('assets/images/homepage/vis01.jpeg', fit: BoxFit.fill),
            Image.asset('assets/images/homepage/vis02.jpeg', fit: BoxFit.fill),
            Image.asset('assets/images/homepage/vis03.jpeg', fit: BoxFit.fill),
          ],
        ),
      ),
      Positioned(
        left: 0,
        right: 0,
        top: 0,
        bottom: 0,
        child: SizedBox(
          height: 400 * kakaoButtonSizeFactor!,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 0.3, sigmaY: 0.3),
                child: Image(
                  image: const AssetImage('assets/images/homepage/mtxt.png'),
                  width: 300 * kakaoButtonSizeFactor,
                  color: const Color.fromRGBO(255, 255, 255, 0.95),
                  filterQuality: FilterQuality.high,
                  colorBlendMode: BlendMode.modulate,
                  isAntiAlias: true,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 20),
              KakaoTalkButton(sizeFactor: kakaoButtonSizeFactor),
            ],
          ),
        ),
      )
    ]);
  }
}

class KakaoTalkButton extends StatefulWidget {
  const KakaoTalkButton({Key? key, this.sizeFactor = 1.0}) : super(key: key);
  final double sizeFactor;

  @override
  State<KakaoTalkButton> createState() => _KakaoTalkButtonState();
}

class _KakaoTalkButtonState extends State<KakaoTalkButton> {
  bool isInRegion = false;

  // double sizeFactor = 1.3;
  LaunchURl launchURl = LaunchURl();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (PointerEvent details) {
        setState(() {
          isInRegion = true;
        });
      },
      onExit: (PointerEvent details) {
        setState(() {
          isInRegion = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 50 * widget.sizeFactor,
        width: 200 * widget.sizeFactor,
        color: isInRegion ? const Color.fromRGBO(55, 30, 32, 1) : Colors.yellow,
        child: MaterialButton(
          onPressed: launchURl.launchKakaoChannel,
          child: Row(
            children: [
              const Spacer(),
              Image.asset(
                'assets/images/homepage/mtxt_bn.png',
                fit: BoxFit.fill,
                width: 30 * widget.sizeFactor,
              ),
              SizedBox(
                width: 15 * widget.sizeFactor,
              ),
              AnimatedDefaultTextStyle(
                  style: TextStyle(
                      fontSize: 17 * widget.sizeFactor,
                      fontWeight: FontWeight.bold,
                      color: isInRegion ? Colors.yellow : const Color.fromRGBO(55, 30, 32, 1)),
                  duration: const Duration(milliseconds: 300),
                  child: const Text('카카오톡 문의')),
              SizedBox(
                width: 15 * widget.sizeFactor,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
