import 'package:cstar_image_clone/widget/launch_url.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MainFooter extends StatelessWidget {
  const MainFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSmallerThanTablet = ResponsiveWrapper.of(context).isSmallerThan(TABLET);
    bool isSmallerThanDesktop = ResponsiveWrapper.of(context).isSmallerThan(DESKTOP);
    bool isSmallerThanMobile = ResponsiveWrapper.of(context).isSmallerThan(MOBILE);

    double mobileFontSize() {
      return isSmallerThanMobile ? 8 : 14;
    }

    return Container(
      padding: isSmallerThanDesktop
          ? const EdgeInsets.only(top: 5, bottom: 5)
          : const EdgeInsets.only(top: 10, bottom: 10),
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Text(
                    '씨스타이미지 | 서울 용산구 한강로 2가 71, 백두드레곤 402 | 06588 (구:137-840)',
                    textAlign: !ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                        ? TextAlign.start
                        : TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: mobileFontSize()),
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  child: RichText(
                      maxLines: 2,
                      textAlign: isSmallerThanDesktop ? TextAlign.center : TextAlign.start,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '사업자 등록번호: 191-93-00249 | 대표자: 이주영',
                            style: TextStyle(color: Colors.white, fontSize: mobileFontSize()),
                          ),
                          if (!isSmallerThanDesktop)
                            TextSpan(
                              text: ' | ',
                              style: TextStyle(color: Colors.white, fontSize: mobileFontSize()),
                            ),
                          if (isSmallerThanDesktop)
                            TextSpan(
                              text: '\n',
                              style: TextStyle(color: Colors.white, fontSize: mobileFontSize()),
                            ),
                          TextSpan(
                            text:
                                'TEL: 02.6482.2890 | H.P: 010.9340.2890 | 이메일: cstarimage@naver.com',
                            style: TextStyle(color: Colors.white, fontSize: mobileFontSize()),
                          ),
                        ],
                      )),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  child: Text(
                    'Copyright @ 2020 CSTAR All rights reversed.',
                    style: TextStyle(color: Colors.white, fontSize: mobileFontSize()),
                    textAlign: isSmallerThanDesktop ? TextAlign.center : TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
          if (!isSmallerThanTablet)
            SizedBox(
              child: Row(
                children: const [
                  SizedBox(width: 30),
                  RouteButton(url: URLs.facebookPage),
                  SizedBox(width: 30),
                  RouteButton(url: URLs.instaPage),
                  SizedBox(width: 120),
                ],
              ),
            ),
        ],
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
