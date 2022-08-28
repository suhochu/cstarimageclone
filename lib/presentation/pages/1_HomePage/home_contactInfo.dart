import 'package:cstar_image_clone/widget/launch_url.dart';
import 'package:cstar_image_clone/widget/slide_show.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../constants/contact_point.dart';
import '../all_pages_out.dart';

class CstarImageContacts extends StatelessWidget {
  const CstarImageContacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isSmallerThanDesktop = ResponsiveWrapper.of(context).isSmallerThan(DESKTOP);
    bool isSmallerThanTablet = ResponsiveWrapper.of(context).isSmallerThan(TABLET);
    bool isSmallerThanMobile = ResponsiveWrapper.of(context).isSmallerThan(MOBILE);

    return Column(
      children: [
        SizedBox(height: isSmallerThanMobile ? 30 : 60),
        Text('C S T A R',
            style: TextStyle(
                fontSize: isSmallerThanDesktop
                    ? isSmallerThanTablet
                        ? isSmallerThanMobile
                            ? 14
                            : 16
                        : screenWidth * 0.02
                    : 28,
                fontWeight: FontWeight.w300)),
        const SizedBox(height: 5),
        Text('CSTAR IMAGE MAKER',
            style: TextStyle(
                fontSize: isSmallerThanDesktop
                    ? isSmallerThanTablet
                        ? isSmallerThanMobile
                            ? 18
                            : 24
                        : screenWidth * 0.03
                    : 36,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: isSmallerThanDesktop ? screenWidth : 1200,
              height: isSmallerThanDesktop
                  ? isSmallerThanTablet
                      ? screenWidth * 0.8
                      : screenWidth * 0.45
                  : 1200 * 0.45,
              child: Image.asset(
                'assets/images/homepage/st2_bg.jpg',
                fit: isSmallerThanTablet ? BoxFit.cover : BoxFit.fill,
              ),
            ),
            contentsWidgetBuilder(context),
          ],
        ),
      ],
    );
  }

  ResponsiveRowColumn contentsWidgetBuilder(BuildContext context) {
    bool isSmallerThanDesktop = ResponsiveWrapper.of(context).isSmallerThan(DESKTOP);
    bool isSmallerThanTablet = ResponsiveWrapper.of(context).isSmallerThan(TABLET);
    bool isSmallerThanMobile = ResponsiveWrapper.of(context).isSmallerThan(MOBILE);
    double screenWidth = MediaQuery.of(context).size.width;
    return ResponsiveRowColumn(
      layout: isSmallerThanTablet ? ResponsiveRowColumnType.COLUMN : ResponsiveRowColumnType.ROW,
      rowMainAxisAlignment: MainAxisAlignment.center,
      columnMainAxisAlignment: MainAxisAlignment.center,
      children: [
        ResponsiveRowColumnItem(
          child: Container(
            margin: isSmallerThanTablet
                ? null
                : const EdgeInsets.only(left: 20, right: 15, top: 20, bottom: 20),
            width: isSmallerThanDesktop
                ? isSmallerThanTablet
                    ? screenWidth - 80 //180
                    : (screenWidth - 100) / 2 //200
                : 550,
            height: isSmallerThanDesktop
                ? isSmallerThanTablet
                    ? screenWidth * 0.45
                    : (screenWidth - 200) / 2
                : 400,
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: ImageSlideshow(
                    initialPage: 0,
                    autoPlayInterval: 3000,
                    isLoop: true,
                    children: [
                      Image.asset('assets/images/homepage/st_vis1.jpg', fit: BoxFit.cover),
                      Image.asset('assets/images/homepage/st_vis2.jpg', fit: BoxFit.cover),
                      Image.asset('assets/images/homepage/st_vis3.jpg', fit: BoxFit.cover),
                    ],
                  ),
                ),
                const Expanded(flex: 1, child: CstarConsultingButton()),
              ],
            ),
          ),
        ),
        ResponsiveRowColumnItem(
          child: Container(
            margin: isSmallerThanTablet
                ? EdgeInsets.only(top: isSmallerThanMobile ? 5 : 15)
                : const EdgeInsets.only(left: 15, right: 20, top: 20, bottom: 20),
            width: isSmallerThanDesktop
                ? isSmallerThanTablet
                    ? screenWidth - 80
                    : (screenWidth - 100) / 2
                : 550,
            height: isSmallerThanDesktop
                ? isSmallerThanTablet
                    ? null
                    : (screenWidth - 200) / 2
                : 400,
            child:
                isSmallerThanTablet ? contactsCardBuilderRow(context) : contactsCardBuilderColumn(),
          ),
        )
      ],
    );
  }

  Column contactsCardBuilderColumn() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(child: ContactCard(contactPoint: contactPoint[0])),
          const SizedBox(height: 2),
          Flexible(child: ContactCard(contactPoint: contactPoint[1])),
          const SizedBox(height: 2),
          Flexible(child: ContactCard(contactPoint: contactPoint[2])),
          const SizedBox(height: 2),
          Flexible(child: ContactCard(contactPoint: contactPoint[3])),
        ],
      );

  Column contactsCardBuilderRow(BuildContext context) {
    bool isSmallerThanMobile = ResponsiveWrapper.of(context).isSmallerThan(MOBILE);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Flexible(child: ContactCard(contactPoint: contactPoint[0])),
            SizedBox(width: isSmallerThanMobile ? 5 : 15),
            Flexible(child: ContactCard(contactPoint: contactPoint[1]))
          ],
        ),
        SizedBox(height: isSmallerThanMobile ? 5 : 15),
        Row(
          children: [
            Flexible(child: ContactCard(contactPoint: contactPoint[2])),
            SizedBox(width: isSmallerThanMobile ? 5 : 15),
            Flexible(child: ContactCard(contactPoint: contactPoint[3]))
          ],
        )
      ],
    );
  }
}

class CstarConsultingButton extends StatefulWidget {
  const CstarConsultingButton({
    Key? key,
  }) : super(key: key);

  @override
  State<CstarConsultingButton> createState() => _CstarConsultingButtonState();
}

class _CstarConsultingButtonState extends State<CstarConsultingButton> {
  bool isInRegion = false;

  @override
  Widget build(BuildContext context) {
    bool isSmallerThanDesktop = ResponsiveWrapper.of(context).isSmallerThan(DESKTOP);
    bool isSmallerThanTablet = ResponsiveWrapper.of(context).isSmallerThan(TABLET);
    double screenWidth = MediaQuery.of(context).size.width;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      opaque: false,
      onEnter: (PointerEvent details) {
        setState(() {
          isInRegion = true;
        });
      },
      onExit: (PointerEvent details) {
        setState(() {
          isInRegion = false;
        });
      },
      child: GestureDetector(
        onTap: () => Routemaster.of(context).push('/${InquiryEducationOrLecturePage.routeName}'),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 3),
          color: isInRegion
              ? const Color.fromRGBO(43, 26, 103, 1)
              : const Color.fromRGBO(67, 46, 136, 1),
          child: Center(
              child: Text(
            '씨스타 이미지 컨설팅 문의',
            style: TextStyle(
                fontSize: isSmallerThanDesktop
                    ? isSmallerThanTablet
                        ? screenWidth * 0.020
                        : screenWidth * 0.022
                    : 30,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}

class ContactCard extends StatefulWidget {
  const ContactCard({
    Key? key,
    required this.contactPoint,
  }) : super(key: key);

  final ContactPoint contactPoint;

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> with SingleTickerProviderStateMixin {
  LaunchURl launchURl = LaunchURl();

  late Animation<Color?> boxAnimation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    boxAnimation =
        ColorTween(begin: const Color.fromRGBO(44, 44, 44, 1), end: widget.contactPoint.color)
            .animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isSmallerThanDesktop = ResponsiveWrapper.of(context).isSmallerThan(DESKTOP);
    bool isSmallerThanTablet = ResponsiveWrapper.of(context).isSmallerThan(TABLET);
    bool isSmallerThanMobile = ResponsiveWrapper.of(context).isSmallerThan(MOBILE);
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        launchURl.selectUrlMethod(widget.contactPoint.url);
      },
      child: AnimatedBuilder(
        animation: boxAnimation,
        builder: (context, child) => Container(
          padding: const EdgeInsets.all(6),
          color: boxAnimation.value,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (PointerEvent details) {
              setState(() {
                animationController.forward();
              });
            },
            onExit: (PointerEvent details) {
              setState(() {
                animationController.reverse();
              });
            },
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  width: isSmallerThanMobile ? screenWidth * 0.05 : null,
                  child: Image.asset(
                    'assets/images/homepage/${widget.contactPoint.iconImage}',
                    fit: BoxFit.fitHeight,
                    filterQuality: FilterQuality.high,
                    isAntiAlias: true,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.contactPoint.title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: isSmallerThanDesktop
                              ? isSmallerThanTablet
                                  ? screenWidth * 0.021
                                  : screenWidth * 0.016
                              : 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    if (!ResponsiveWrapper.of(context).isSmallerThan(TABLET))
                      Text(
                        widget.contactPoint.content,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: isSmallerThanDesktop
                                ? isSmallerThanTablet
                                    ? screenWidth * 0.015
                                    : screenWidth * 0.011
                                : 12),
                      ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
