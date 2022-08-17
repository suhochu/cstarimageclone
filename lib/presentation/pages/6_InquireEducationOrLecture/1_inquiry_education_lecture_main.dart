import 'package:flutter/material.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

import '../../../widget/main_footer.dart';
import '../../../widget/page_banner.dart';
import '../../../widget/page_footer.dart';

class InquiryEducationOrLecturePage extends StatefulWidget {
  static const String routeName = 'inquiry_education_lecture';

  const InquiryEducationOrLecturePage({Key? key}) : super(key: key);

  @override
  State<InquiryEducationOrLecturePage> createState() => _InquiryEducationOrLecturePageState();
}

class _InquiryEducationOrLecturePageState extends State<InquiryEducationOrLecturePage> {
  late final ScrollController _scrollController;

  double opacity = 0;

  bool _isSelected = false;

  void _opacityFAB() {
    if (_scrollController.offset <= 50) {
      setState(() {
        opacity = 0;
      });
    } else {
      setState(() {
        opacity = 1;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_opacityFAB);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_opacityFAB);
    _scrollController.dispose();
    super.dispose();
  }

  List<Widget> buildContents() {
    return [
      const PageBanner(
        title: '교육 및 강의(문의)',
      ),
      Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Image.asset(
          'assets/images/edu/1.jpeg',
        ),
      ),
      gridViewImage(index1: '2', index2: '3'),
      gridViewImage(index1: '4', index2: '5', size2: 595),
      gridViewImage(index1: '6', index2: '7'),
      gridViewImage(index1: '8', index2: '9', size2: 515),
      gridViewImage(index1: '10', index2: '11', size1: 500, size2: 655),
      Container(
        color: const Color.fromRGBO(223, 23, 95, 1),
        width: 1050,
        height: 70,
        child: const Center(
          child: Text(
            '교육 현장 사진',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(vertical: 30),
        child: Image.asset(
          'assets/images/edu/12.jpeg',
        ),
      ),
      Container(
        color: const Color.fromRGBO(51, 51, 51, 1),
        width: 1050,
        height: 70,
        child: const Center(
          child: Text(
            '※ 텍스트 컬러, 힐링의 관련된 힐링스팟(진단지)을 활용하여 진행',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ),
      ),
      const PageFooter(),
      const MainFooter(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebSmoothScroll(
        controller: _scrollController,
        curve: Curves.fastOutSlowIn,
        animationDuration: 300,
        child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: buildContents(),
            )),
      ),
      floatingActionButton: AnimatedPadding(
        duration: const Duration(milliseconds: 60),
        padding: EdgeInsets.only(bottom: _isSelected ? 10 : 5),
        child: AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(milliseconds: 300),
          child: MaterialButton(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              _scrollController.animateTo(0,
                  duration: const Duration(milliseconds: 500), curve: Curves.linear);
              if (_scrollController.offset <= 100) {}
            },
            child: MouseRegion(
              onEnter: (event) {
                setState(() {
                  _isSelected = true;
                });
              },
              onExit: (event) {
                setState(() {
                  _isSelected = false;
                });
              },
              child: const PhysicalModel(
                color: Colors.black,
                elevation: 15.0,
                shape: BoxShape.circle,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 28,
                  child: Icon(
                    Icons.keyboard_arrow_up,
                    color: Colors.black54,
                    size: 40,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget gridViewImage(
      {required String index1, required String index2, double size1 = 550, double size2 = 550}) {
    return Container(
      width: 1050,
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/edu/$index1.jpeg',
            height: size1,
            width: 510,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
          Image.asset(
            'assets/images/edu/$index2.jpeg',
            height: size2,
            width: 510,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
        ],
      ),
    );
  }
}
