import 'package:flutter/material.dart';
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
  double opacity = 0;
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
      const HomeCarousel(),
      HomeIntroduce(),
      const CstarImageContacts(),
      const CstarImageCenter(),
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
            ),
          ),
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
                  print('clicked');
                  _scrollController.animateTo(0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.linear);
                },
                opacity: opacity
              ),
            ),
          ),
        ));
  }
}

class AnimatedFloatingActionButton extends StatefulWidget {
  const AnimatedFloatingActionButton(
      {Key? key,
      required this.opacity,
      required this.function,
      })
      : super(key: key);
  final double opacity;
  final GestureTapCallback function;

  @override
  State<AnimatedFloatingActionButton> createState() =>
      _AnimatedFloatingActionButtonState();
}

class _AnimatedFloatingActionButtonState
    extends State<AnimatedFloatingActionButton> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: widget.function,
      child: AnimatedOpacity(
        opacity: widget.opacity,
        duration: const Duration(milliseconds: 300),
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
    );
  }
}

// MaterialButton(
// hoverColor: Colors.transparent,
// splashColor: Colors.transparent,
// highlightColor: Colors.transparent,
// onPressed: () {
// _scrollController.animateTo(0,
// duration: const Duration(milliseconds: 500),
// curve: Curves.linear);
// },
// child: MouseRegion(
// onEnter: (event) {
// setState(() {
// _isSelected = true;
// });
// },
// onExit: (event) {
// setState(() {
// _isSelected = false;
// });
// },
// child: const PhysicalModel(
// color: Colors.black,
// elevation: 15.0,
// shape: BoxShape.circle,
// child: CircleAvatar(
// backgroundColor: Colors.white,
// radius: 28,
// child: Icon(
// Icons.keyboard_arrow_up,
// color: Colors.black54,
// size: 40,
// ),
// ),
// ),
// ),
// ),
