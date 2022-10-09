import 'package:cstar_image_clone/constants/route_Name.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'tab_popUp_Widget.dart';
import '../constants/tabbar_menu_names.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class TopTabBar extends StatelessWidget implements PreferredSizeWidget {
  const TopTabBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size(double.infinity, 120);

  Widget tabBarButton({required PageName pageName, required Widget child, required BuildContext context}) {
    return MaterialButton(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () => routeWithPageName(pageName, context),
      child: child,
    );
  }


  Widget menuButton(BuildContext context) {
    bool isSmallerThanMobile = ResponsiveWrapper.of(context).isSmallerThan(MOBILE);
    return DropdownButtonHideUnderline(
      child: DropdownButton2<PageName>(
        customButton: Icon(
          Icons.menu,
          size: isSmallerThanMobile ? 30 : 40,
          color: Colors.black54,
        ),
        focusColor: Colors.transparent,
        items: [
          menuButtonBuilder(PageName.personalColor, context),
          menuButtonBuilder(PageName.colorPsychology, context),
          menuButtonBuilder(PageName.certifications, context),
          menuButtonBuilder(PageName.purchasing, context),
          menuButtonBuilder(PageName.inquiry, context),
        ],
        onChanged: (value) {
          routeWithPageName(value!, context);
        },
        itemHeight: isSmallerThanMobile ? 35 : 48,
        itemPadding:
            isSmallerThanMobile ? const EdgeInsets.only(left: 8, right: 8) : const EdgeInsets.only(left: 16, right: 16),
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

  DropdownMenuItem<PageName> menuButtonBuilder(PageName pageName, BuildContext context) {
    return DropdownMenuItem<PageName>(
        value: pageName,
        onTap: null,
        child: ListTile(
            contentPadding: const EdgeInsets.all(1),
            title: Text(
              tabBarMenuNames(pageName),
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: Colors.white),
            )));
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
            pageName: PageName.main,
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
                  tabBarButton(
                    pageName: PageName.personalColor,
                    child: TabWidget(title: tabBarMenuNames(PageName.personalColor)),
                    context: context,
                  ),
                  tabBarButton(
                    pageName: PageName.colorPsychology,
                    child: TabWidget(title: tabBarMenuNames(PageName.colorPsychology)),
                    context: context,
                  ),
                  tabBarButton(
                    pageName: PageName.certifications,
                    child: TabWidget(title: tabBarMenuNames(PageName.certifications), isPopup: true),
                    context: context,
                  ),
                  tabBarButton(
                    pageName: PageName.purchasing,
                    child: TabWidget(title: tabBarMenuNames(PageName.purchasing)),
                    context: context,
                  ),
                  tabBarButton(
                    pageName: PageName.inquiry,
                    child: TabWidget(title: tabBarMenuNames(PageName.inquiry)),
                    context: context,
                  ),
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
