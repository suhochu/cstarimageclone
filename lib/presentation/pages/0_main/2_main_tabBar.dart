import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

import '../../../widget/tabwidget.dart';

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

  @override
  Widget build(BuildContext context) {
    final tabPage = TabPage.of(context);
    return Column(
      children: [
        Container(
          height: 15,
          color: Colors.grey,
          margin: const EdgeInsets.only(bottom: 10),
        ),
        TabBar(
            indicatorColor: Colors.transparent,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
            overlayColor: MaterialStateColor.resolveWith((states) {
              return Colors.transparent;
            }),
            onTap: (int index) {},
            controller: tabPage.controller,
            tabs: [
              Tab(
                  height: 90,
                  child: Container(
                    margin: const EdgeInsets.only(left: 10, top: 10),
                    child: Image.asset('assets/images/homepage/logo.png',
                        height: 80, fit: BoxFit.fitHeight),
                  )),
              const Tab(child: TabWidget(title: '퍼스널 컬러 진단')),
              const Tab(child: TabWidget(title: '색채심리상담(컬러테라피)', isLong: true)),
              const Tab(child: TabWidget(title: '자격증과정', isPopup: true)),
              const Tab(child: TabWidget(title: '컬러교구 구입')),
              const Tab(child: TabWidget(title: '교육 및 강의(문의)')),
            ]),
      ],
    );
  }
}
