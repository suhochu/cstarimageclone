import 'package:flutter/material.dart';
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
      const PageBanner(title: '토탈이미지메이킹 컨설턴트 자격증'),
      tabBuilder(),
      const SizedBox(height: 30),
      contentsBuilder(),
      const PageFooter(),
      const MainFooter(),
    ];
  }

  Widget tabBuilder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        tabButton(title: '토탈이미지메이킹\n컨설턴트 자격증', index: 1),
        tabButton(title: '퍼스널컬러\n컨설턴트 자격증', index: 2),
        tabButton(title: '색채심리\n마스터 자격증', index: 3),
      ],
    );
  }

  Widget contentsBuilder() {
    int pageIndex;
    try {
       pageIndex = int.parse(RouteData
          .of(context)
          .queryParameters['query']!);
    } catch(e) {
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
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Image.asset(
          'assets/images/certification/$index.jpeg',
        ),
      );

  GestureDetector tabButton({required String title, required int index}) {
    return GestureDetector(
      onTap: () => Routemaster.of(context).push('/${CertificationPage.routeName}?query=$index'),
      child: AnimatedContainer(
        margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 70),
        duration: const Duration(milliseconds: 200),
        color: _selectedIndex == index
            ? const Color.fromRGBO(164, 69, 237, 1)
            : const Color.fromRGBO(120, 120, 120, 1),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: SizedBox(
            width: 250,
            height: 80,
            child: Center(
                child: Text(
              title,
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 20),
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
}
