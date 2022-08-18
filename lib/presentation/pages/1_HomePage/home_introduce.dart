import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

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
    return Column(children: [
      const SizedBox(height: 50),
      const Text('C S T A R', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300)),
      const SizedBox(height: 5),
      const Text('INTRODUCE', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      const SizedBox(height: 30),
      SizedBox(
        height: 600,
        width: 1000,
        child: GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio: 1.7 / 1,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          children: List.generate(
              4,
              (index) =>
                  IntroduceCard(title: titles[index], content: contents[index], index: index, route: routePages[index],)),
        ),
      ),
    ]);
  }
}

class IntroduceCard extends StatefulWidget {
  const IntroduceCard({Key? key, required this.title, required this.content, required this.index, required this.route})
      : super(key: key);

  final String title;
  final String content;
  final int index;
  final String route;

  @override
  State<IntroduceCard> createState() => _IntroduceCardState();
}

class _IntroduceCardState extends State<IntroduceCard> {
  double opacity = 0.0;

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
            opacity = 0.5;
          });
        },
        onExit: (PointerEvent details) {
          setState(() {
            opacity = 0.0;
          });
        },
        child: Stack(children: [
          Image.asset('assets/images/homepage/st1_con${widget.index + 1}.jpg',
              width: 500, fit: BoxFit.fitWidth),
          AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(milliseconds: 300),
              child: Container(width: 500, color: Colors.black87)),
          Positioned(
            top: 30,
            left: 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(widget.title,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 5),
                    Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: const Icon(Icons.arrow_circle_right, color: Colors.white, size: 35)),
                  ],
                ),
                const SizedBox(height: 30),
                Text(
                  widget.content,
                  style: const TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
