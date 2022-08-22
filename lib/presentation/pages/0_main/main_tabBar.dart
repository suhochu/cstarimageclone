import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:routemaster/routemaster.dart';
import '../../../widget/tab_popUp_Widget.dart';

class TopTabBar extends StatefulWidget implements PreferredSizeWidget {
  const TopTabBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size(double.infinity, 120);

  @override
  State<TopTabBar> createState() => _TopTabBarState();
}

class _TopTabBarState extends State<TopTabBar> with SingleTickerProviderStateMixin {
  bool isInRegion = false;

  void rebuild(bool region) {
    setState(() {
      isInRegion = region;
    });
  }

  Widget tabBarButton({required int index, required Widget child}) {
    final indexedPage = IndexedPage.of(context);
    return MaterialButton(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () => indexedPage.index = index,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // const SizedBox(width: 20,),
          tabBarButton(
            index: 0,
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              child: Image.asset(
                'assets/images/homepage/logo.png',
                height: 80,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          ResponsiveVisibility(hiddenWhen: const [
            Condition.smallerThan(name: DESKTOP),
          ], child: tabBarButton(index: 1, child: const TabWidget(title: '퍼스널 컬러 진단'))),
          ResponsiveVisibility(hiddenWhen: const [
            Condition.smallerThan(name: DESKTOP),
          ], child: tabBarButton(index: 2, child: const TabWidget(title: '색채심리상담(컬러테라피)'))),
          ResponsiveVisibility(hiddenWhen: const [
            Condition.smallerThan(name: DESKTOP),
          ], child: tabBarButton(index: 3, child: const TabWidget(title: '자격증과정', isPopup: true))),
          ResponsiveVisibility(hiddenWhen: const [
            Condition.smallerThan(name: DESKTOP),
          ], child: tabBarButton(index: 4, child: const TabWidget(title: '컬러교구 구입'))),
          ResponsiveVisibility(hiddenWhen: const [
            Condition.smallerThan(name: DESKTOP),
          ], child: tabBarButton(index: 5, child: const TabWidget(title: '교육 및 강의(문의)'))),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
