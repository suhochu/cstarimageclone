import 'package:cstar_image_clone/presentation/pages/0_main/DefaultLayout.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../99_component/main_footer.dart';
import 'home_export_pages.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({Key? key}) : super(key: key);
  static const String routeName = 'cstar_main';

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(child: _BuildContents());
  }
}

class _BuildContents extends StatelessWidget {
  const _BuildContents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isSmallerThanDesktop = ResponsiveWrapper.of(context).isSmallerThan(DESKTOP);
    bool isSmallerThanTablet = ResponsiveWrapper.of(context).isSmallerThan(TABLET);
    bool isSmallerThanMobile = ResponsiveWrapper.of(context).isSmallerThan(MOBILE);
    return Column(
      children: [
        HomeCarousel(
          screenWidth: screenWidth,
          isSmallerThanDesktop: isSmallerThanDesktop,
          isSmallerThanMobile: isSmallerThanMobile,
        ),
        HomeIntroduce(
          screenWidth: screenWidth,
          isSmallerThanMobile: isSmallerThanMobile,
          isSmallerThanDesktop: isSmallerThanDesktop,
          isSmallerThanTablet: isSmallerThanTablet,
        ),
        CstarImageContacts(
          screenWidth: screenWidth,
          isSmallerThanMobile: isSmallerThanMobile,
          isSmallerThanDesktop: isSmallerThanDesktop,
          isSmallerThanTablet: isSmallerThanTablet,
        ),
        CstarImageCenter(
          screenWidth: screenWidth,
          isSmallerThanMobile: isSmallerThanMobile,
          isSmallerThanDesktop: isSmallerThanDesktop,
          isSmallerThanTablet: isSmallerThanTablet,
        ),
        const MainFooter(),
      ],
    );
  }
}
