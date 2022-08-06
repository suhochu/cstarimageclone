import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

import '../presentation/pages/all_pages_out.dart';

class TabWidget extends StatefulWidget {
  const TabWidget({
    Key? key,
    required this.title,
    this.isPopup = false,
    this.isLong = false,
  }) : super(key: key);
  final String title;
  final bool isPopup;
  final bool isLong;

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> with SingleTickerProviderStateMixin {
  bool isInRegion = false;
  bool isPopupClose = true;
  OverlayEntry? entry;
  late AnimationController _animationController;
  late Animation<double> animations;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _animationController.addListener(() {
      setState(() {});
    });
    animations = (Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _animationController, curve: const Interval(0.2, 1.0))));
    super.initState();
  }

  Widget buildOverlay() => MouseRegion(
        onEnter: (event) {
          isPopupClose = false;
        },
        onExit: (event) {
          isPopupClose = true;
          hideOverlay();
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Material(
            elevation: 2,
            color: Colors.transparent,
            child: Column(
              children: [
                PopUpMenu(title: '토탈이미지메이킹 컨설턴트', event: () {}),
                const Divider(color: Colors.grey,height: 1),
                PopUpMenu(title: '퍼스널컬러 컨설턴트',event: () {}),
                const Divider(color: Colors.grey, height: 1,),
                PopUpMenu(title: '색체심리 마스터',event: () {}),
              ],
            ),
          ),
        ),
      );

  void showOverlay() async {
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    entry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width + 20,
        left: offset.dx - 15,
        top: offset.dy + 50,
        child: Opacity(opacity: animations.value, child: buildOverlay()),
      ),
    );

    _animationController.addListener(() {
      overlay!.setState(() {});
    });
    _animationController.forward();
    overlay!.insert(entry!);
  }

  void hideOverlay() async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (isPopupClose == true) {
      _animationController.reverse();
      entry?.remove();
      entry = null;
    }
  }

  TextStyle topTabBarTextStyle() {
    return TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.bold,
      color: isInRegion ? Colors.purple.shade800 : Colors.black87,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      opaque: false,
      onEnter: (PointerEvent details) {
        setState(() {
          isInRegion = true;
        });
        isPopupClose = false;
        if (widget.isPopup) {
          showOverlay();
        }
      },
      onExit: (PointerEvent details) {
        setState(() {
          isInRegion = false;
        });
        isPopupClose = true;
        if (widget.isPopup) {
          hideOverlay();
        }
      },
      child: Container(
        margin: widget.isLong
            ? const EdgeInsets.symmetric(vertical: 10, horizontal: 30)
            : const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
        child: Text(
          widget.title,
          style: topTabBarTextStyle(),
        ),
      ),
    );
  }
}

class PopUpMenu extends StatefulWidget {
  const PopUpMenu({Key? key, required this.title, required this.event}) : super(key: key);

  final String title;
  final GestureTapCallback event;

  @override
  State<PopUpMenu> createState() => _PopUpMenuState();
}

class _PopUpMenuState extends State<PopUpMenu> {

  Color titleColor = Colors.white;
  Color backGroundColor = Colors.black87;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          titleColor = Colors.white;
          backGroundColor = Colors.purple;
        });
      },
      onExit: (event) {
        setState(() {
          titleColor = Colors.white;
          backGroundColor = Colors.black87;
        });
      },
      child: ListTile(
        title: Center(child: Text(widget.title)),
        textColor: titleColor,
        tileColor: backGroundColor,
        onTap: widget.event,
      ),
    );
  }
}
