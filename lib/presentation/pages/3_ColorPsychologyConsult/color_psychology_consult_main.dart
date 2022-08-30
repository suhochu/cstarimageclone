import 'package:cstar_image_clone/widget/animated_floating_action_button.dart';
import 'package:cstar_image_clone/widget/page_footer.dart';
import 'package:flutter/material.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

import '../../../widget/main_footer.dart';
import '../../../widget/page_banner.dart';

class ColorPsychologyConsultPage extends StatefulWidget {
  static const String routeName = 'color_psychology_consult';

  const ColorPsychologyConsultPage({Key? key}) : super(key: key);

  @override
  State<ColorPsychologyConsultPage> createState() => _ColorPsychologyConsultPageState();
}

class _ColorPsychologyConsultPageState extends State<ColorPsychologyConsultPage> {
  late final ScrollController _scrollController;

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
    return [
      const PageBanner(title: '색채심리상담(컬러테라피)',),
      Container(
        margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
        child: Image.asset(
          'assets/images/colorTherapy/1.jpeg', fit: BoxFit.fitWidth,
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
            builder: (BuildContext context, double opacity, Widget? child) =>
                AnimatedFloatingActionButton(
                    function: () {
                      _scrollController.animateTo(0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear);
                    },
                    opacity: opacity),
          ),
        ),
      ),
    );
  }
}
