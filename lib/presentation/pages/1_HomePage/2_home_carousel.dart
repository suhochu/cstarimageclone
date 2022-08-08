import 'dart:ui';
import 'package:flutter/material.dart';
// import 'package:responsive_framework/responsive_framework.dart';
import '../../../widget/slideshow.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double? sizeFactor = ResponsiveValue(context, defaultValue: 1.0, valueWhen: [
    //   const Condition.smallerThan(name: TABLET, value: 0.4),
    //   const Condition.largerThan(name: TABLET, value: 1.4),
    // ]).value;
    return Stack(children: [
      Container(
        color: Colors.blueGrey,
        child: ImageSlideshow(
          width: double.infinity,
          height: 400,
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
        child: SizedBox(
          height: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 0.3, sigmaY: 0.3),
                child: const Image(
                  image: AssetImage('assets/images/homepage/mtxt.png'),
                  width: 200 ,
                  color: Color.fromRGBO(255, 255, 255, 0.95),
                  colorBlendMode: BlendMode.modulate,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const KakaoTalkButton(sizeFactor: 1),
            ],
          ),
        ),
      )
    ]);
  }
}

class KakaoTalkButton extends StatefulWidget {
  const KakaoTalkButton({Key? key, required this.sizeFactor}) : super(key: key);
  final double? sizeFactor;

  @override
  State<KakaoTalkButton> createState() => _KakaoTalkButtonState();
}

class _KakaoTalkButtonState extends State<KakaoTalkButton> {
  bool isInRegion = false;
  double sizeFactor = 1.0;

  @override
  Widget build(BuildContext context) {
    if (widget.sizeFactor != null) {
      sizeFactor = widget.sizeFactor!;
    }
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
        height: 50 * sizeFactor,
        width: 200 * sizeFactor,
        color: isInRegion ? const Color.fromRGBO(55, 30, 32, 1) : Colors.yellow,
        child: Row(
          children: [
            const Spacer(),
            Image.asset(
              'assets/images/homepage/mtxt_bn.png',
              fit: BoxFit.fill,
              width: 30 * sizeFactor,
            ),
            SizedBox(width: 15 * sizeFactor),
            AnimatedDefaultTextStyle(
                style: TextStyle(
                    fontSize: 17 * sizeFactor,
                    fontWeight: FontWeight.bold,
                    color: isInRegion ? Colors.yellow : const Color.fromRGBO(55, 30, 32, 1)),
                duration: const Duration(milliseconds: 300),
                child: const Text('카카오톡 문의')),
            SizedBox(width: 15 * sizeFactor),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
