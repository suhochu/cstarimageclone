import 'package:cstar_image_clone/widget/launch_url.dart';
import 'package:flutter/material.dart';

class PageFooter extends StatelessWidget {
  PageFooter({Key? key}) : super(key: key);
  final LaunchURl _launchURl = LaunchURl();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: _launchURl.launchKakaoChannel,
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
            onTap: () {
              // Todo implement this at android and IOS
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
