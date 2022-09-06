import 'package:cstar_image_clone/widget/animated_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
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

  final ValueNotifier<double> _opacityNotifier = ValueNotifier<double>(0);
  final ValueNotifier<bool> _isSelectedNotifier = ValueNotifier<bool>(false);

  void _opacityFAB() {
    if (_scrollController.offset <= 50) {
      _opacityNotifier.value = 0;
    } else {
      _opacityNotifier.value = 1;
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
    double screenWidth = MediaQuery.of(context).size.width;
    bool isSmallerThanDesktop = ResponsiveWrapper.of(context).isSmallerThan(DESKTOP);
    bool isSmallerThanMobile = ResponsiveWrapper.of(context).isSmallerThan(MOBILE);
    return [
      const PageBanner(
        title: '교육 및 강의(문의)',
      ),
      Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Image.asset(
          'assets/images/edu/1.jpeg',
        ),
      ),
      gridViewImage(index1: '2', index2: '3'),
      gridViewImage(index1: '4', index2: '5', size2: 1.088),
      gridViewImage(index1: '6', index2: '7'),
      gridViewImage(index1: '8', index2: '9', size1: 1.07),
      gridViewImage(index1: '10', index2: '11', size2: 1.31),
      Container(
        color: const Color.fromRGBO(223, 23, 95, 1),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: isSmallerThanDesktop
            ? isSmallerThanMobile
                ? 30
                : screenWidth * 0.08
            : 70,
        child: Center(
          child: Text(
            '교육 현장 사진',
            style: TextStyle(
                fontSize: isSmallerThanDesktop
                    ? isSmallerThanMobile
                        ? 10
                        : screenWidth * 0.03
                    : 25,
                fontWeight: FontWeight.w400,
                color: Colors.white),
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Image.asset(
          'assets/images/edu/12.jpeg',
        ),
      ),
      Container(
        color: const Color.fromRGBO(51, 51, 51, 1),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: isSmallerThanDesktop
            ? isSmallerThanMobile
                ? 30
                : screenWidth * 0.08
            : 70,
        child: Center(
          child: Text(
            '※ 텍스트 컬러, 힐링의 관련된 힐링스팟(진단지)을 활용하여 진행',
            style: TextStyle(
                fontSize: isSmallerThanDesktop
                    ? isSmallerThanMobile
                        ? 10
                        : screenWidth * 0.03
                    : 25,
                fontWeight: FontWeight.w400,
                color: Colors.white),
          ),
        ),
      ),
      PageFooter(),
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
      floatingActionButton: ValueListenableBuilder<bool>(
        valueListenable: _isSelectedNotifier,
        builder: (context, value, child) => AnimatedPadding(
          duration: const Duration(milliseconds: 60),
          padding: EdgeInsets.only(bottom: _isSelectedNotifier.value ? 10 : 5),
          child: MouseRegion(
            onEnter: (event) => _isSelectedNotifier.value = true,
            onExit: (event) => _isSelectedNotifier.value = false,
            child: ValueListenableBuilder(
              valueListenable: _opacityNotifier,
              builder: (BuildContext context, double opacity, Widget? child) => AnimatedFloatingActionButton(
                  function: () {
                    _scrollController.animateTo(0, duration: const Duration(milliseconds: 500), curve: Curves.linear);
                  },
                  opacity: opacity),
            ),
          ),
        ),
      ),
    );
  }

  Widget gridViewImage({required String index1, required String index2, double size1 = 1, double size2 = 1}) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/edu/$index1.jpeg',
            height: ((screenWidth - 40) / 2) * size1,
            width: (screenWidth - 40) / 2,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
          Image.asset(
            'assets/images/edu/$index2.jpeg',
            height: ((screenWidth - 40) / 2) * size2,
            width: (screenWidth - 40) / 2,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
        ],
      ),
    );
  }
}
