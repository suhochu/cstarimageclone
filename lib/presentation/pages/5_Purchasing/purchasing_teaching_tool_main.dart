import 'package:flutter/material.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

import '../../../widget/main_footer.dart';
import '../../../widget/page_banner.dart';
import '../../../widget/page_footer.dart';

class PurchasingTeachingToolPage extends StatefulWidget {
  static const String routeName = 'purchasing_teaching_tool';
  const PurchasingTeachingToolPage({Key? key}) : super(key: key);

  @override
  State<PurchasingTeachingToolPage> createState() => _PurchasingTeachingToolPageState();
}

class _PurchasingTeachingToolPageState extends State<PurchasingTeachingToolPage> {
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
      const PageBanner(title: '컬러교구 구입',),
      for (int i = 1; i <= 20; i++) insideImage(i.toString()),
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

  Widget insideImage(String index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Image.asset(
        'assets/images/teachingTool/$index.jpeg',
      ),
    );
  }
}
