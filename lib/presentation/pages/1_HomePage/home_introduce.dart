import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../all_pages_out.dart';

class HomeIntroduce extends StatelessWidget {
  HomeIntroduce({Key? key}) : super(key: key);
  final List<String> titles = [
    '퍼스널컬러진단',
    '컬러자격증과정',
    '컬러교구구입',
    '기업교육 및 강의문의',
  ];
  final List<String> contents = [
    'CSTAR 퍼스널컬러진단을 \n안내해 드립니다.',
    'CSTAR 컬러자격증과정을 \n안내해 드립니다.',
    'CSTAR 컬러교구구입을 \n안내해 드립니다.',
    'CSTAR 기업교육 및 강의문의를 \n안내해 드립니다.'
  ];

  final List<String> routePages = [
    '/${PersonalColorDiagnosisPage.routeName}',
    '/${CertificationPage.routeName}?query=1',
    '/${PurchasingTeachingToolPage.routeName}',
    '/${InquiryEducationOrLecturePage.routeName}',
  ];

  @override
  Widget build(BuildContext context) {
    double? widgetSizeFactor = ResponsiveValue(context, defaultValue: 1.0, valueWhen: [
      const Condition.smallerThan(name: DESKTOP, value: 3/4),
    ]).value;

    double? textSizeFactor = ResponsiveValue(context, defaultValue: 1.0, valueWhen: [
      const Condition.smallerThan(name: DESKTOP, value: 3/4),
    ]).value;

    return Column(children: [
      const SizedBox(height: 50),
       Text('C S T A R', style: TextStyle(fontSize: 25 * textSizeFactor!, fontWeight: FontWeight.w300)),
      const SizedBox(height: 5),
       Text('INTRODUCE', style: TextStyle(fontSize: 35 * textSizeFactor, fontWeight: FontWeight.bold)),
      const SizedBox(height: 30),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            introduceCardsBuilder(context, 0, 1, sizeFactor: widgetSizeFactor!),
            const SizedBox(height: 30),
            introduceCardsBuilder(context, 2, 3, sizeFactor: widgetSizeFactor),
          ],
        ),
      )
    ]);
  }

  ResponsiveRowColumn introduceCardsBuilder(BuildContext context, int index1, int index2, {double sizeFactor = 1.0}) {
    return ResponsiveRowColumn(
      layout: ResponsiveWrapper.of(context).isSmallerThan(TABLET) ? ResponsiveRowColumnType.COLUMN : ResponsiveRowColumnType.ROW,
      rowMainAxisAlignment : MainAxisAlignment.center,
      columnSpacing: 30 * sizeFactor,
      rowSpacing: 30 * sizeFactor,
      children: [
        ResponsiveRowColumnItem(
          child: IntroduceCard(
              title: titles[index1],
              content: contents[index1],
              index: index1,
              route: routePages[index1],
              sizeFactor: sizeFactor),
        ),
        // SizedBox(width: 30 * sizeFactor),
        ResponsiveRowColumnItem(
          child: IntroduceCard(
              title: titles[index2],
              content: contents[index2],
              index: index2,
              route: routePages[index2],
              sizeFactor: sizeFactor),
        )
      ],
    );
  }
}

class IntroduceCard extends StatefulWidget {
  const IntroduceCard(
      {Key? key,
      required this.title,
      required this.content,
      required this.index,
      required this.route,
      this.sizeFactor = 1.0})
      : super(key: key);

  final String title;
  final String content;
  final int index;
  final String route;
  final double sizeFactor;

  @override
  State<IntroduceCard> createState() => _IntroduceCardState();
}

class _IntroduceCardState extends State<IntroduceCard> {
  bool isBlended = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Routemaster.of(context).push(widget.route);
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (PointerEvent details) {
          setState(() {
            isBlended = true;
          });
        },
        onExit: (PointerEvent details) {
          setState(() {
            isBlended = false;
          });
        },
        child: Stack(children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            child: Image.asset(
              'assets/images/homepage/st1_con${widget.index + 1}.jpg',
              width: 500 * widget.sizeFactor,
              fit: BoxFit.fitWidth,
              color: isBlended ? Colors.black38 : Colors.transparent,
              colorBlendMode: BlendMode.luminosity,
            ),
          ),
          Positioned(
            top: 30 * widget.sizeFactor,
            left: 40 * widget.sizeFactor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(widget.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30 * widget.sizeFactor,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(width: 5),
                    Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: Icon(Icons.arrow_circle_right,
                            color: Colors.white, size: 35 * widget.sizeFactor)),
                  ],
                ),
                SizedBox(height: 30 * widget.sizeFactor),
                Text(
                  widget.content,
                  style: TextStyle(
                      fontSize: 15 * widget.sizeFactor,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
