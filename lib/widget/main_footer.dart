import 'package:cstar_image_clone/widget/launch_url.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MainFooter extends StatelessWidget {
  const MainFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widgetWidth;
    if (ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)) {
      widgetWidth = MediaQuery.of(context).size.width;
    } else {
      widgetWidth = MediaQuery.of(context).size.width - 350;
    }
    return Container(
      padding: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
          ? const EdgeInsets.only(top: 5, bottom: 5)
          : const EdgeInsets.only(top: 15, bottom: 10),
      color: Colors.black,
      height: ResponsiveWrapper.of(context).isSmallerThan(MOBILE) ? 120 : 100,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: widgetWidth,
                  child: Text(
                    '씨스타이미지 | 서울 용산구 한강로 2가 71, 백두드레곤 402 | 06588 (구:137-840)',
                    textAlign: !ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                        ? TextAlign.start
                        : TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: widgetWidth,
                  child: RichText(
                      maxLines: 2,
                      textAlign: !ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                          ? TextAlign.start
                          : TextAlign.center,
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: '사업자 등록번호: 191-93-00249 | 대표자: 이주영',
                            style: TextStyle(color: Colors.white),
                          ),
                          if (!ResponsiveWrapper.of(context).isSmallerThan(DESKTOP))
                            const TextSpan(
                              text: ' | ',
                              style: TextStyle(color: Colors.white),
                            ),
                          if (ResponsiveWrapper.of(context).isSmallerThan(DESKTOP))
                            const TextSpan(
                              text: '\n',
                              style: TextStyle(color: Colors.white),
                            ),
                          const TextSpan(
                            text:
                                'TEL: 02.6482.2890 | H.P: 010.9340.2890 | 이메일: cstarimage@naver.com',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: widgetWidth,
                  child: Text(
                    'Copyright @ 2020 CSTAR All rights reversed.',
                    style: const TextStyle(color: Colors.white),
                    textAlign: !ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                        ? TextAlign.start
                        : TextAlign.center,
                  ),
                ),
              ],
            ),
            if (!ResponsiveWrapper.of(context).isSmallerThan(DESKTOP))
              Row(
                children: const [
                  RouteButton(url: URLs.facebookPage),
                  SizedBox(
                    width: 30,
                  ),
                  RouteButton(url: URLs.instaPage)
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class RouteButton extends StatefulWidget {
  const RouteButton({Key? key, required this.url}) : super(key: key);

  final URLs url;

  @override
  State<RouteButton> createState() => _RouteButtonState();
}

class _RouteButtonState extends State<RouteButton> {
  bool isInRegion = false;
  final LaunchURl _launchURl = LaunchURl();

  @override
  Widget build(BuildContext context) {
    String image;
    if (widget.url == URLs.facebookPage) {
      image = 'assets/images/footer/icon_facebook.png';
    } else {
      image = 'assets/images/footer/icon_instagram.png';
    }
    return MouseRegion(
      onEnter: (event) => setState(() {
        isInRegion = true;
      }),
      onExit: (event) => setState(() {
        isInRegion = false;
      }),
      child: GestureDetector(
        onTap: () => _launchURl.selectUrlMethod(widget.url),
        child: Image.asset(
          image,
          fit: BoxFit.fitHeight,
          filterQuality: FilterQuality.high,
          color: isInRegion ? const Color.fromRGBO(197, 198, 199, 1) : Colors.white,
          height: 30,
        ),
      ),
    );
  }
}
