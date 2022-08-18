import 'package:cstar_image_clone/widget/launch_url.dart';
import 'package:flutter/material.dart';

class MainFooter extends StatelessWidget {
  const MainFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 100, right: 150),
      color: Colors.black,
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  '씨스타이미지 | 서울 용산구 한강로 2가 71, 백두드레곤 402 | 06588 (구:137-840)',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '사업자 등록번호: 191-93-00249 | 대표자: 이주영 | TEL: 02.6482.2890 | H.P: 010.9340.2890 | 이메일: cstarimage@naver.com',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Copyright @ 2020 CSTAR All rights reversed.',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Row(
              children: const [
                RouteButton(url: URLs.facebookPage),
                SizedBox(width: 30,),
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
    if(widget.url == URLs.facebookPage){
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
