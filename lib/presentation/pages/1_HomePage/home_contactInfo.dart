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
    double? widgetSizeFactor = ResponsiveValue(context, defaultValue: 1.05, valueWhen: [
      const Condition.smallerThan(name: DESKTOP, value: 0.77),
    ]).value;

    double? textSizeFactor = ResponsiveValue(context, defaultValue: 1.0, valueWhen: [
      const Condition.smallerThan(name: DESKTOP, value: 3/4),
    ]).value;

    return Column(
      children: [
        const SizedBox(height: 80),
        Stack(
          children: [
            Image.asset('assets/images/homepage/st2_bg.jpg',
                width: double.infinity, height: 750, fit: BoxFit.fitHeight),
            Column(
              children: [
                const SizedBox(height: 50),
                Text('C S T A R',
                    style: TextStyle(fontSize: 25 * textSizeFactor!, fontWeight: FontWeight.w300)),
                const SizedBox(height: 5),
                Text('CSTAR IMAGE MAKER',
                    style: TextStyle(fontSize: 35 * textSizeFactor, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                contentsWidgetBuilder(context, widgetSizeFactor),
              ],
            )
          ],
        )
      ],
    );
  }

  ResponsiveRowColumn contentsWidgetBuilder(BuildContext context, double? widgetSizeFactor) {
    return ResponsiveRowColumn(
      layout: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
          ? ResponsiveRowColumnType.COLUMN
          : ResponsiveRowColumnType.ROW,
      rowMainAxisAlignment: MainAxisAlignment.center,
      rowCrossAxisAlignment: CrossAxisAlignment.start,
      columnCrossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ResponsiveRowColumnItem(
          child: Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                children: [
                  ImageSlideshow(
                      width: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                          ? 670
                          : 500 * widgetSizeFactor!,
                      height: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                          ? 410
                          : 390 * widgetSizeFactor!,
                      initialPage: 0,
                      autoPlayInterval: 3000,
                      isLoop: true,
                      children: [
                        Image.asset('assets/images/homepage/st_vis1.jpg', fit: BoxFit.fill),
                        Image.asset('assets/images/homepage/st_vis2.jpg', fit: BoxFit.fill),
                        Image.asset('assets/images/homepage/st_vis3.jpg', fit: BoxFit.fill),
                      ]),
                  CstarConsultingButton(sizeFactor: widgetSizeFactor!),
                ],
              ),
            ),
          ),
        ),
        ResponsiveRowColumnItem(
          child: Column(
            children: [
              if (!ResponsiveWrapper.of(context).isSmallerThan(TABLET)) const SizedBox(height: 20),
              if (!ResponsiveWrapper.of(context).isSmallerThan(MOBILE))
                responsiveContactCardBuilderForTablet(context, widgetSizeFactor, 0, 1),
              if (ResponsiveWrapper.of(context).isSmallerThan(MOBILE))
                responsiveContactCardBuilderForMobile(
                  context,
                  widgetSizeFactor,
                  0,
                  1,
                ),
              if (ResponsiveWrapper.of(context).isSmallerThan(TABLET)) const SizedBox(height: 20),
              if (!ResponsiveWrapper.of(context).isSmallerThan(TABLET)) const SizedBox(height: 20),
              if (!ResponsiveWrapper.of(context).isSmallerThan(MOBILE))
                responsiveContactCardBuilderForTablet(context, widgetSizeFactor, 2, 3),
              if (ResponsiveWrapper.of(context).isSmallerThan(MOBILE))
                responsiveContactCardBuilderForMobile(
                  context,
                  widgetSizeFactor,
                  2,
                  3,
                ),
              if (!ResponsiveWrapper.of(context).isSmallerThan(TABLET)) const SizedBox(height: 20),
            ],
          ),
        )
      ],
    );
  }

  ResponsiveRowColumn responsiveContactCardBuilderForTablet(
      BuildContext context, double widgetSizeFactor, int index1, int index2) {
    return ResponsiveRowColumn(
      layout: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
          ? ResponsiveRowColumnType.ROW
          : ResponsiveRowColumnType.COLUMN,
      rowMainAxisAlignment: MainAxisAlignment.center,
      columnSpacing: 20,
      rowSpacing: 10,
      children: [
        ResponsiveRowColumnItem(
          child: ContactCard(
            contactPoint: contactPoint[index1],
            sizeFactor: widgetSizeFactor,
          ),
        ),
        ResponsiveRowColumnItem(
          child: ContactCard(
            contactPoint: contactPoint[index2],
            sizeFactor: widgetSizeFactor,
          ),
        ),
      ],
    );
  }

  Column responsiveContactCardBuilderForMobile(
      BuildContext context, double widgetSizeFactor, int index1, int index2) {
    return Column(
      children: [
        ContactCard(
          contactPoint: contactPoint[index1],
          sizeFactor: widgetSizeFactor,
          isMobile: true,
        ),
        const SizedBox(height: 20,),
        ContactCard(
          contactPoint: contactPoint[index2],
          sizeFactor: widgetSizeFactor,
          isMobile: true,
        ),
      ],
    );
  }
}

class CstarConsultingButton extends StatefulWidget {
  const CstarConsultingButton({Key? key, this.sizeFactor = 1.0}) : super(key: key);
  final double sizeFactor;

  @override
  State<CstarConsultingButton> createState() => _CstarConsultingButtonState();
}

class _CstarConsultingButtonState extends State<CstarConsultingButton> {
  bool isInRegion = false;

  @override
  Widget build(BuildContext context) {
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
          width:
              ResponsiveWrapper.of(context).isSmallerThan(TABLET) ? 670 : 500 * widget.sizeFactor,
          color: isInRegion
              ? const Color.fromRGBO(43, 26, 103, 1)
              : const Color.fromRGBO(67, 46, 136, 1),
          height: 87 * widget.sizeFactor,
          child: Center(
              child: Text(
            '씨스타 이미지 컨설팅 문의',
            style: TextStyle(
                fontSize: 30 * widget.sizeFactor, color: Colors.white, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}

class ContactCard extends StatefulWidget {
  const ContactCard({
    Key? key,
    this.sizeFactor = 1,
    required this.contactPoint,
    this.isMobile = false,
  }) : super(key: key);

  final double sizeFactor;
  final ContactPoint contactPoint;
  final bool isMobile;

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  bool _isInRegion = false;
  LaunchURl launchURl = LaunchURl();

  @override
  Widget build(BuildContext context) {
    bool isDesktop = !ResponsiveWrapper.of(context).isSmallerThan(DESKTOP);
    double widgetWidth = (MediaQuery.of(context).size.width) * 4 / 9.6;

    return MaterialButton(
      onPressed: () {
        launchURl.selectUrlMethod(widget.contactPoint.url);
      },
      child: AnimatedContainer(
        color: _isInRegion ? widget.contactPoint.color : const Color.fromRGBO(44, 44, 44, 1),
        duration: const Duration(milliseconds: 300),
        width: widget.isMobile
            ? MediaQuery.of(context).size.width - 60
            : ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                ? widgetWidth
                : 430 * widget.sizeFactor,
        height: isDesktop ? 110 : 77,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (PointerEvent details) {
            setState(() {
              _isInRegion = true;
            });
          },
          onExit: (PointerEvent details) {
            setState(() {
              _isInRegion = false;
            });
          },
          child: Row(
            children: [
              Container(
                margin: isDesktop ? const EdgeInsets.all(20) : const EdgeInsets.all(10),
                child: Image.asset(
                  'assets/images/homepage/${widget.contactPoint.iconImage}',
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
                        fontSize: isDesktop ? 20 : 17,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5 * widget.sizeFactor,
                  ),
                  if (!ResponsiveWrapper.of(context).isSmallerThan('MOBILE2'))
                    Text(
                      widget.contactPoint.content,
                      style: TextStyle(color: Colors.white, fontSize: isDesktop ? 12 : 10),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
