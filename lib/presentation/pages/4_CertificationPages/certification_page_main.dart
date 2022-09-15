import 'package:cstar_image_clone/presentation/pages/0_main/DefaultLayout.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:routemaster/routemaster.dart';
import '../../../widget/main_footer.dart';
import '../../../widget/page_banner.dart';
import '../../../widget/page_footer.dart';

class CertificationPage extends StatelessWidget {
  static const String routeName = 'certification_total_image_making';
  final String? query;

  const CertificationPage({Key? key, this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(child: _BuildContents(query: query!));
  }
}

class _BuildContents extends StatefulWidget {
  const _BuildContents({Key? key, required this.query}) : super(key: key);
  final String query;

  @override
  State<_BuildContents> createState() => _BuildContentsState();
}

class _BuildContentsState extends State<_BuildContents> {
  late Function tap;
  late Widget page1;
  late Widget page2;
  late Widget page3;


  @override
  void initState() {
    super.initState();
    page1 = Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Image.asset('assets/images/certification/1.jpeg'));
    page2 = Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Image.asset('assets/images/certification/2.jpeg'));
    page3 = Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Image.asset('assets/images/certification/3.jpeg'));
  }

  Widget tabBuilder() {
    var selectedIndex = int.parse(widget.query);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(width: 10),
        _TabButton(
          title: '토탈이미지메이킹\n컨설턴트 자격증',
          index: 1,
          isSelected: selectedIndex == 1,
        ),
        _TabButton(
          title: '퍼스널컬러\n컨설턴트 자격증',
          index: 2,
          isSelected: selectedIndex == 2,
        ),
        _TabButton(
          title: '색채심리\n마스터 자격증',
          index: 3,
          isSelected: selectedIndex == 3,
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }

  Widget contentsBuilder() {
    switch (int.parse(widget.query)) {
      case 2:
        return page1;
      case 3:
        return page3;
      default:
        return page2;
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isSmallerThanMobile = ResponsiveWrapper.of(context).isSmallerThan(MOBILE);
    bool isSmallerThanDesktop = ResponsiveWrapper.of(context).isSmallerThan(DESKTOP);
    return Column(
      children: [
        const PageBanner(title: '토탈이미지메이킹 컨설턴트 자격증'),
        SizedBox(width: isSmallerThanDesktop ? null : 1200, child: tabBuilder()),
        if (!isSmallerThanMobile) const SizedBox(height: 20),
        contentsBuilder(),
        const PageFooter(),
        const MainFooter(),
      ],
    );
  }
}

class _TabButton extends StatelessWidget {
  final String title;
  final int index;
  final bool isSelected;

  const _TabButton({
    Key? key,
    required this.title,
    required this.index,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSmallerThanDesktop = ResponsiveWrapper.of(context).isSmallerThan(DESKTOP);
    bool isSmallerThanMobile = ResponsiveWrapper.of(context).isSmallerThan(MOBILE);
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return GestureDetector(
      onTap: () {
        // selectionCallback(index);
        Routemaster.of(context).push('/${CertificationPage.routeName}?query=$index');
      },
      child: AnimatedContainer(
        margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 5),
        padding: const EdgeInsets.symmetric(vertical: 10),
        duration: const Duration(milliseconds: 200),
        color: isSelected ? const Color.fromRGBO(164, 69, 237, 1) : const Color.fromRGBO(120, 120, 120, 1),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: SizedBox(
            width: isSmallerThanDesktop ? screenWidth / 30 * 7 : 280,
            child: Center(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: isSmallerThanDesktop
                          ? isSmallerThanMobile
                          ? 10
                          : screenWidth * 0.020833
                          : 25),
                )),
          ),
        ),
      ),
    );
  }
}
