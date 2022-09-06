import 'package:cstar_image_clone/widget/animated_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../widget/main_footer.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';
import 'home_export_pages.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({Key? key}) : super(key: key);
  static const String routeName = 'cstar_main';

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
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
    bool isSmallerThanTablet = ResponsiveWrapper.of(context).isSmallerThan(TABLET);
    bool isSmallerThanMobile = ResponsiveWrapper.of(context).isSmallerThan(MOBILE);
    return [
      HomeCarousel(
        screenWidth: screenWidth,
        isSmallerThanDesktop: isSmallerThanDesktop,
        isSmallerThanMobile: isSmallerThanMobile,
      ),
      HomeIntroduce(
        screenWidth: screenWidth,
        isSmallerThanMobile: isSmallerThanMobile,
        isSmallerThanDesktop: isSmallerThanDesktop,
        isSmallerThanTablet: isSmallerThanTablet,
      ),
      CstarImageContacts(
        screenWidth: screenWidth,
        isSmallerThanMobile: isSmallerThanMobile,
        isSmallerThanDesktop: isSmallerThanDesktop,
        isSmallerThanTablet: isSmallerThanTablet,
      ),
      CstarImageCenter(
        screenWidth: screenWidth,
        isSmallerThanMobile: isSmallerThanMobile,
        isSmallerThanDesktop: isSmallerThanDesktop,
        isSmallerThanTablet: isSmallerThanTablet,
      ),
      MainFooter(),
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
          ),
        ),
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
}
