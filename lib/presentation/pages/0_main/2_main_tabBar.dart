import 'package:flutter/material.dart';
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

  MaterialButton tabBarButton({required int index, required Widget child}) {
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
          const SizedBox(width: 20,),
          tabBarButton(
            index: 0,
            child: Container(
              margin: const EdgeInsets.only(left: 10, top: 10),
              child:
                  Image.asset('assets/images/homepage/logo.png', height: 80, fit: BoxFit.fitHeight),
            ),
          ),
          tabBarButton(index: 1, child: const TabWidget(title: '퍼스널 컬러 진단')),
          tabBarButton(index: 2, child: const TabWidget(title: '색채심리상담(컬러테라피)', isLong: true)),
          tabBarButton(index: 3, child: const TabWidget(title: '자격증과정', isPopup: true)),
          tabBarButton(index: 4, child: const TabWidget(title: '컬러교구 구입')),
          tabBarButton(index: 5, child: const TabWidget(title: '교육 및 강의(문의)')),
          const SizedBox(width: 20,),
          // MaterialButton(
          //   hoverColor: Colors.transparent,
          //   onPressed: () => indexedPage.index = 0,
          //   child: Container(
          //     margin: const EdgeInsets.only(left: 10, top: 10),
          //     child:
          //         Image.asset('assets/images/homepage/logo.png', height: 80, fit: BoxFit.fitHeight),
          //   ),
          // ),
          // MaterialButton(
          //   hoverColor: Colors.transparent,
          //   onPressed: () {
          //     indexedPage.index = 1;
          //   },
          //   child: const TabWidget(title: '퍼스널 컬러 진단'),
          // ),
          // InkWell(
          //     onTap: () => indexedPage.index = 2,
          //     child: const TabWidget(title: '색채심리상담(컬러테라피)', isLong: true)),
          // InkWell(
          //     onTap: () => indexedPage.index = 3,
          //     child: const TabWidget(title: '자격증과정', isPopup: true)),
          // InkWell(
          //   onTap: () => indexedPage.index = 4,
          //   child: const TabWidget(title: '컬러교구 구입'),
          // ),
          // TextButton(
          //   onPressed: () => indexedPage.index = 5,
          //   child: const TabWidget(title: '교육 및 강의(문의)'),
          // ),
        ],
      ),
    );
  }
}

// Column(
// children: [
// Container(
// height: 15,
// color: Colors.grey,
// margin: const EdgeInsets.only(bottom: 10),
// ),
// TabBar(
// indicatorColor: Colors.transparent,
// indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
// overlayColor: MaterialStateColor.resolveWith((states) {
// return Colors.transparent;
// }),
// controller: tabPage.controller,
// tabs: [
// Tab(
// height: 90,
// child: Container(
// margin: const EdgeInsets.only(left: 10, top: 10),
// child: Image.asset('assets/images/homepage/logo.png',
// height: 80, fit: BoxFit.fitHeight),
// )),
// const Tab(child: TabWidget(title: '퍼스널 컬러 진단')),
// const Tab(child: TabWidget(title: '색채심리상담(컬러테라피)', isLong: true)),
// const Tab(child: TabWidget(title: '자격증과정', isPopup: true)),
// const Tab(child: TabWidget(title: '컬러교구 구입')),
// const Tab(child: TabWidget(title: '교육 및 강의(문의)')),
// ]),
// ],
// );
