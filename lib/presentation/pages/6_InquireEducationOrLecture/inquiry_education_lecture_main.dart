import 'package:cstar_image_clone/layout/defaultLayout.dart';
import 'package:cstar_image_clone/layout/page_banner.dart';
import 'package:cstar_image_clone/layout/page_footer.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../layout/main_footer.dart';

class InquiryEducationOrLecturePage extends StatelessWidget {
  static const String routeName = 'inquiry_education_lecture';

  const InquiryEducationOrLecturePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(child: _BuildContents());
  }
}

class _BuildContents extends StatelessWidget {
  const _BuildContents({Key? key}) : super(key: key);

  Widget gridViewImage(
      {required String index1,
      required String index2,
      double size1 = 1,
      double size2 = 1,
      required BuildContext context}) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isSmallerThanDesktop = ResponsiveWrapper.of(context).isSmallerThan(DESKTOP);
    return Container(
      width: screenWidth,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/edu/$index1.jpeg',
            height: isSmallerThanDesktop ? ((screenWidth - 40) / 2) * size1 : 580 * size1,
            width: isSmallerThanDesktop ? (screenWidth - 40) / 2 : 580,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
          Image.asset(
            'assets/images/edu/$index2.jpeg',
            height: isSmallerThanDesktop ? ((screenWidth - 40) / 2) * size2 : 580 * size2,
            width: isSmallerThanDesktop ? (screenWidth - 40) / 2 : 580,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isSmallerThanDesktop = ResponsiveWrapper.of(context).isSmallerThan(DESKTOP);
    bool isSmallerThanMobile = ResponsiveWrapper.of(context).isSmallerThan(MOBILE);

    return Column(
      children: [
        const PageBanner(
          title: '교육 및 강의(문의)',
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Image.asset(
            'assets/images/edu/1.jpeg',
          ),
        ),
        gridViewImage(index1: '2', index2: '3', context: context),
        gridViewImage(index1: '4', index2: '5', size2: 1.088, context: context),
        gridViewImage(index1: '6', index2: '7', context: context),
        gridViewImage(index1: '8', index2: '9', size1: 1.07, context: context),
        gridViewImage(index1: '10', index2: '11', size2: 1.31, context: context),
        Container(
          color: const Color.fromRGBO(223, 23, 95, 1),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: isSmallerThanDesktop
              ? isSmallerThanMobile
                  ? 30
                  : screenWidth * 0.08
              : 70,
          child: Center(
            child: Text(
              '교육 현장 사진',
              style: TextStyle(
                  fontSize: isSmallerThanDesktop
                      ? isSmallerThanMobile
                          ? 10
                          : screenWidth * 0.03
                      : 25,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Image.asset(
            'assets/images/edu/12.jpeg',
          ),
        ),
        Container(
          color: const Color.fromRGBO(51, 51, 51, 1),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: isSmallerThanDesktop
              ? isSmallerThanMobile
                  ? 30
                  : screenWidth * 0.08
              : 70,
          child: Center(
            child: Text(
              '※ 텍스트 컬러, 힐링의 관련된 힐링스팟(진단지)을 활용하여 진행',
              style: TextStyle(
                  fontSize: isSmallerThanDesktop
                      ? isSmallerThanMobile
                          ? 10
                          : screenWidth * 0.03
                      : 25,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ),
        ),
        const PageFooter(),
        const MainFooter(),
      ],
    );
  }
}
