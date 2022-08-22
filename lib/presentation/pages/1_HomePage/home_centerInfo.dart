import 'package:cstar_image_clone/widget/launch_url.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class CstarImageCenter extends StatefulWidget {
  CstarImageCenter({Key? key}) : super(key: key);

  @override
  State<CstarImageCenter> createState() => _CstarImageCenterState();
}

class _CstarImageCenterState extends State<CstarImageCenter> {
  final LaunchURl _launchURl = LaunchURl();
  double scaleFactor = 1;

  void buildScreen() {
    if (MediaQuery.of(context).size.width <= 1200 && MediaQuery.of(context).size.width > 800) {
      setState(() {
        print('under Desktop');
        scaleFactor = 0.8;
      });
    } else if (MediaQuery.of(context).size.width <= 800 &&
        MediaQuery.of(context).size.width > 650) {
      setState(() {
        print('under Tablet');
        scaleFactor = 0.65;
      });
    } else {
      setState(() {
        print('default');
        scaleFactor = 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double? textSizeFactor = ResponsiveValue(context, defaultValue: 1.0, valueWhen: [
      const Condition.smallerThan(name: DESKTOP, value: 3 / 4),
    ]).value;

    buildScreen();

    return Container(
      color: const Color.fromRGBO(255, 255, 255, 1),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Text('C S T A R',
              style: TextStyle(fontSize: 25 * textSizeFactor!, fontWeight: FontWeight.w300)),
          const SizedBox(height: 5),
          Text('CUSTOMER CENTER',
              style: TextStyle(fontSize: 35 * textSizeFactor, fontWeight: FontWeight.bold)),
          const SizedBox(height: 30),
          ResponsiveRowColumn(
            layout: ResponsiveWrapper.of(context).isSmallerThan('MOBILE2')
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            rowMainAxisAlignment: MainAxisAlignment.center,
            columnSpacing: 20,
            rowSpacing: 20,
            children: [
              // noticeBoard(),
              ResponsiveRowColumnItem(child: customerService(context, scaleFactor)),
              ResponsiveRowColumnItem(child: directions(context, scaleFactor)),
            ],
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Container directions(BuildContext context, double scale) {
    return Container(
      width: 570 * scale,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            color: const Color.fromRGBO(26, 73, 165, 1),
            width: ResponsiveWrapper.of(context).isSmallerThan('MOBILE2') ?  MediaQuery.of(context).size.width - 80 : 570 * scale,
            height: 50 * scale,
            child: GestureDetector(
              onTap: _launchURl.launchNaverMap,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('DIRECTIONS',
                      style: TextStyle(
                          fontSize: 25 * scale, fontWeight: FontWeight.bold, color: Colors.white)),
                ],
              ),
            ),
          ),
          naverMap(context, scale)
        ],
      ),
    );
  }

  MouseRegion naverMap(BuildContext context, double scale) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _launchURl.launchNaverMap,
        child: Stack(
          children: [
            SizedBox(
              width: ResponsiveWrapper.of(context).isSmallerThan('MOBILE2') ?  MediaQuery.of(context).size.width - 80 : 570 * scale,
              height: 300 * scale,
              child: Image.asset(
                'assets/images/common/naverMap.png',
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
                right: 15 * scale,
                top: 70 * scale,
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 10,
                  child: const Padding(
                    padding: EdgeInsets.all(6),
                    child: Text(
                      '한강로 2가 71,\n백두드레곤 402',
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Container customerService(BuildContext context, double scale) {
    if (ResponsiveWrapper.of(context).isSmallerThan('MOBILE2')) {
      scale = 0.8;
    }
    return Container(
      color: const Color.fromRGBO(245, 76, 76, 1),
      width: ResponsiveWrapper.of(context).isSmallerThan('MOBILE2') ?  MediaQuery.of(context).size.width - 80  : 370 * scale,
      height: ResponsiveWrapper.of(context).isSmallerThan('MOBILE2') ? null : 350 * scale,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!ResponsiveWrapper.of(context).isSmallerThan('MOBILE2'))
            Icon(
              Icons.phone_in_talk,
              color: Colors.white,
              size: 60 * scale,
            ),
          SizedBox(
            height: 30 * scale,
          ),
          Text('CUSTOMER SERVICE',
              style: TextStyle(
                  fontSize: 25 * scale,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 3 * scale)),
          SizedBox(
            height: 15 * scale,
          ),
          if(ResponsiveWrapper.of(context).isSmallerThan('MOBILE2') && ResponsiveWrapper.of(context).isLargerThan(MOBILE))  Text('010.9340.2890 | 02.482.2890',
              style: TextStyle(
                fontSize: 32 * scale,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 3 * scale,
              )),
          if(ResponsiveWrapper.of(context).isLargerThan('MOBILE2') || ResponsiveWrapper.of(context).isSmallerThan(MOBILE)) Text('010.9340.2890',
              style: TextStyle(
                fontSize: 32 * scale,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 3 * scale,
              )),
          if(ResponsiveWrapper.of(context).isLargerThan('MOBILE2') || ResponsiveWrapper.of(context).isSmallerThan(MOBILE)) SizedBox(height: 10 * scale),
          if(ResponsiveWrapper.of(context).isLargerThan('MOBILE2') || ResponsiveWrapper.of(context).isSmallerThan(MOBILE)) Text('02.482.2890',
              style: TextStyle(
                fontSize: 32 * scale,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 3 * scale,
              )),
          SizedBox(height: 15 * scale),
          Text('궁금한사항있으시면 언제든문의주세요!',
              style: TextStyle(
                  fontSize: 16 * scale, color: Colors.white, fontWeight: FontWeight.w500)),
          SizedBox(height: 30 * scale),
        ],
      ),
    );
  }

  Container noticeBoard() {
    return Container(
      color: const Color.fromRGBO(43, 180, 186, 1),
      width: 330,
      height: 250,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '빠른상담은',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Text(
                    '유선으로 연결해주세요.',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )
                ],
              ),
              Image.asset(
                'assets/images/homepage/campaign.png',
                color: Colors.white,
                width: 60,
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              color: Colors.white,
              child: const Text('게시물이 없습니다.'),
            ),
          )
        ],
      ),
    );
  }
}
