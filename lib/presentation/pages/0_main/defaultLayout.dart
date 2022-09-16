import 'package:flutter/material.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';
import '../../../widget/animated_floating_action_button.dart';

class DefaultLayout extends StatefulWidget {
  final Widget child;

  const DefaultLayout({
    super.key,
    required this.child,
  });

  @override
  State<DefaultLayout> createState() => _DefaultLayoutState();
}

class _DefaultLayoutState extends State<DefaultLayout> {
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebSmoothScroll(
        controller: _scrollController,
        curve: Curves.fastOutSlowIn,
        animationDuration: 300,
        child: SingleChildScrollView(
            controller: _scrollController,
            child: widget.child),
      ),
      floatingActionButton: ValueListenableBuilder<bool>(
        valueListenable: _isSelectedNotifier,
        builder:(context, value, child) =>  AnimatedPadding(
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
