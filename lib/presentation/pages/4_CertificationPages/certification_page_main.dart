import 'package:cstar_image_clone/widget/animated_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:routemaster/routemaster.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

import '../../../widget/main_footer.dart';
import '../../../widget/page_banner.dart';
import '../../../widget/page_footer.dart';

class CertificationPage extends StatefulWidget {
  static const String routeName = 'certification_total_image_making';
  final String? query;

  const CertificationPage({Key? key, this.query}) : super(key: key);

  @override
  State<CertificationPage> createState() => _CertificationPageState();
}

class _CertificationPageState extends State<CertificationPage> {
  late final ScrollController _scrollController;
  int _selectedIndex = 1;
  final ValueNotifier<double> _opacityNotifier = ValueNotifier<double>(0);
  bool _isSelected = false;

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
    bool isSmallerThanMobile = ResponsiveWrapper.of(context).isSmallerThan(MOBILE);
    bool isSmallerThanDesktop = ResponsiveWrapper.of(context).isSmallerThan(DESKTOP);
    return [
      const PageBanner(title: '토탈이미지메이킹 컨설턴트 자격증'),
      SizedBox(
        width: isSmallerThanDesktop ? null : 1200,
        child: tabBuilder(),
      ),
      if (!isSmallerThanMobile) const SizedBox(height: 20),
      contentsBuilder(),
      PageFooter(),
      const MainFooter(),
    ];
  }

  Widget tabBuilder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(width: 10),
        tabButton(title: '토탈이미지메이킹\n컨설턴트 자격증', index: 1),
        tabButton(title: '퍼스널컬러\n컨설턴트 자격증', index: 2),
        tabButton(title: '색채심리\n마스터 자격증', index: 3),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }

  Widget contentsBuilder() {
    int pageIndex;
    try {
      pageIndex = int.parse(RouteData.of(context).queryParameters['query']!);
    } catch (e) {
      pageIndex = 1;
    }
    if (pageIndex != _selectedIndex) _selectedIndex = pageIndex;
    switch (_selectedIndex) {
      case 2:
        return contentBuilder('1');
      case 3:
        return contentBuilder('3');
      default:
        return contentBuilder('2');
    }
  }

  Widget contentBuilder(String index) => Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Image.asset(
          'assets/images/certification/$index.jpeg',
        ),
      );

  GestureDetector tabButton({required String title, required int index}) {
    bool isSmallerThanDesktop = ResponsiveWrapper.of(context).isSmallerThan(DESKTOP);
    bool isSmallerThanMobile = ResponsiveWrapper.of(context).isSmallerThan(MOBILE);
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => Routemaster.of(context).push('/${CertificationPage.routeName}?query=$index'),
      child: AnimatedContainer(
        margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 5),
        padding: const EdgeInsets.symmetric(vertical: 10),
        duration: const Duration(milliseconds: 200),
        color: _selectedIndex == index ? const Color.fromRGBO(164, 69, 237, 1) : const Color.fromRGBO(120, 120, 120, 1),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: SizedBox(
            width: isSmallerThanDesktop ? screenWidth / 30 * 7 : 280,
            child: Center(
                child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: isSmallerThanDesktop
                      ? isSmallerThanMobile
                          ? 10
                          : screenWidth * 0.020833
                      : 25),
            )),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    contentsBuilder();
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
    );
  }
}
