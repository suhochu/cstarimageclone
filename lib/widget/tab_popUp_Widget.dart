import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:routemaster/routemaster.dart';
import '../presentation/pages/all_pages_out.dart';
import '../constants/tabbar_menu_names.dart';

class TabWidget extends StatefulWidget {
  const TabWidget({
    Key? key,
    required this.title,
    this.isPopup = false,
  }) : super(key: key);
  final String title;
  final bool isPopup;

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> with SingleTickerProviderStateMixin {
  bool isInRegion = false;
  bool isPopupClose = true;
  OverlayEntry? entry;
  late AnimationController _animationController;
  late Animation<double> animations;
  final layerLink = LayerLink();

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

  @override
  void dispose() {
    entry?.dispose();
    super.dispose();
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
                PopUpMenu(
                    title: tabBarMenuSubNames[0],
                    event: () {
                      Routemaster.of(context).push('/${CertificationPage.routeName}?query=1');
                    }),
                const Divider(color: Colors.grey, height: 1),
                PopUpMenu(
                    title: tabBarMenuSubNames[1],
                    event: () {
                      Routemaster.of(context).push('/${CertificationPage.routeName}?query=2');
                    }),
                const Divider(
                  color: Colors.grey,
                  height: 1,
                ),
                PopUpMenu(
                    title: tabBarMenuSubNames[2],
                    event: () {
                      Routemaster.of(context).replace('/${CertificationPage.routeName}/?query=3');
                    }),
              ],
            ),
          ),
        ),
      );

  void showOverlay() async {
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    // final offset = renderBox.localToGlobal(Offset.zero);
    final screenWidth = MediaQuery.of(context).size.width;

    entry?.remove();
    entry = null;
    entry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width + 100,
        // left: offset.dx,
        // top: offset.dy,
        child: CompositedTransformFollower(
          link: layerLink,
          showWhenUnlinked: false,
          offset: Offset(size.width - 118 - ((screenWidth - 800) * 0.009333) , size.height + 10), // -130, 10
          child: Opacity(opacity: animations.value, child: buildOverlay()),
        ),
      ),
    );
    // 118 - ((screenWidth - 800) * 0.0215385
    _animationController.addListener(() {
      overlay!.setState(() {});
    });
    _animationController.forward();
    overlay!.insert(entry!);
  }

  void hideOverlay() async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (isPopupClose == true) {
      _animationController.reverse();
    }
  }

  TextStyle topTabBarTextStyle() {
    return TextStyle(
      fontSize: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP) ? 14 : 17,
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
      child: CompositedTransformTarget(
        link: layerLink,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            widget.title,
            style: topTabBarTextStyle(),
          ),
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
    bool isSmallerThanDesktop = ResponsiveWrapper.of(context).isSmallerThan(DESKTOP);
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
        title: Center(
            child: Text(
          widget.title,
          style: TextStyle(fontSize: isSmallerThanDesktop ? 11.5 : 13, fontWeight: FontWeight.w400),
        )),
        textColor: titleColor,
        tileColor: backGroundColor,
        onTap: widget.event,
      ),
    );
  }
}
