import 'package:cstar_image_clone/constants/urls.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PageFooter extends StatelessWidget {
  const PageFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (){
              launchUrl(Uri.parse(kakaoChannel));
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Image.asset(
                'assets/images/common/15.jpeg',
                fit: BoxFit.fitWidth,
                width: 530,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: (){
              print('phone call');
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Image.asset(
                'assets/images/common/14.jpeg',
                fit: BoxFit.fitWidth,
                width: 530,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
