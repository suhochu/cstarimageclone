import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:routemaster/routemaster.dart';
import '../../../widget/tab_popUp_Widget.dart';
import '../../../constants/tabbar_menu_names.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../all_pages_out.dart';

class TopTabBar extends StatelessWidget implements PreferredSizeWidget {
  const TopTabBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size(double.infinity, 120);

  Widget tabBarButton({required int index, required Widget child, required BuildContext context}) {
    final indexedPage = IndexedPage.of(context);
    return MaterialButton(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () => indexedPage.index = index,
      child: child,
    );
  }

  Widget menuButton(BuildContext context) {
    bool isSmallerThanMobile = ResponsiveWrapper.of(context).isSmallerThan(MOBILE);
    return DropdownButtonHideUnderline(
      child: DropdownButton2<int>(
        customButton: Icon(
          Icons.menu,
          size: isSmallerThanMobile ? 30 : 40,
          color: Colors.black54,
        ),
        focusColor: Colors.transparent,
        items: [
          menuButtonBuilder(0, context),
          menuButtonBuilder(1, context),
          menuButtonBuilder(2, context),
          menuButtonBuilder(3, context),
          menuButtonBuilder(4, context),
        ],
        onChanged: (value) {
          routeWithDropDownButton(value!, context);
        },
        itemHeight: isSmallerThanMobile ? 35 : 48,
        itemPadding: isSmallerThanMobile ? const EdgeInsets.only(left: 8, right: 8) : const EdgeInsets.only(left: 16, right: 16),
        dropdownWidth: isSmallerThanMobile ? 110 : 160,
        dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.black54,
        ),
        dropdownElevation: 8,
        offset: const Offset(-63, -5),
        alignment: Alignment.center,
      ),
    );
  }

  DropdownMenuItem<int> menuButtonBuilder(int index, BuildContext context) {
    bool isSmallerThanMobile = ResponsiveWrapper.of(context).isSmallerThan(MOBILE);
    return DropdownMenuItem<int>(
        value: index,
        onTap: null,
        child: ListTile(
            contentPadding: const EdgeInsets.all(1),
            title: Text(
              tabBarMenuNames[index],
              style: TextStyle(fontSize: isSmallerThanMobile ? 8 : 11.5, fontWeight: FontWeight.w800, color: Colors.white),
            )));
  }

  void routeWithDropDownButton(int index, BuildContext context) {
    switch (index) {
      case 0:
        Routemaster.of(context).push('/${PersonalColorDiagnosisPage.routeName}');
        break;
      case 1:
        Routemaster.of(context).push('/${ColorPsychologyConsultPage.routeName}');
        break;
      case 2:
        Routemaster.of(context).push('/${CertificationPage.routeName}');
        break;
      case 3:
        Routemaster.of(context).push('/${PurchasingTeachingToolPage.routeName}');
        break;
      default:
        Routemaster.of(context).push('/${InquiryEducationOrLecturePage.routeName}');
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isSmallerThanTablet = ResponsiveWrapper.of(context).isSmallerThan(TABLET);
    bool isSmallerThanMobile = ResponsiveWrapper.of(context).isSmallerThan(MOBILE);
    return Material(
      elevation: 6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          tabBarButton(
            context: context,
            index: 0,
            child: Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: Image.asset(
                'assets/images/homepage/logo.png',
                height: isSmallerThanTablet
                    ? isSmallerThanMobile
                        ? 45
                        : 70
                    : 65,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          if (!isSmallerThanTablet)
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  tabBarButton(index: 1, child: TabWidget(title: tabBarMenuNames[0]), context: context),
                  tabBarButton(index: 2, child: TabWidget(title: tabBarMenuNames[1]), context: context),
                  tabBarButton(index: 3, child: TabWidget(title: tabBarMenuNames[2], isPopup: true), context: context),
                  tabBarButton(index: 4, child: TabWidget(title: tabBarMenuNames[3]), context: context),
                  tabBarButton(index: 5, child: TabWidget(title: tabBarMenuNames[4]), context: context),
                ],
              ),
            ),
          if (isSmallerThanTablet) const Spacer(),
          if (isSmallerThanTablet) menuButton(context),
          if (isSmallerThanTablet) SizedBox(width: isSmallerThanMobile ? 30 : 70),
        ],
      ),
    );
  }
}
