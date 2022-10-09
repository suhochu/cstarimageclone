import 'package:cstar_image_clone/layout/page_banner.dart';
import 'package:cstar_image_clone/layout/page_footer.dart';
import 'package:flutter/material.dart';
import '../../../layout/defaultLayout.dart';
import '../../../layout/main_footer.dart';

class PersonalColorDiagnosisPage extends StatelessWidget {
  static const String routeName = 'personal_color_diagnosis';

  const PersonalColorDiagnosisPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(child: _BuildContents());
  }
}

class _BuildContents extends StatelessWidget {
  const _BuildContents({Key? key}) : super(key: key);

  Widget insideImage(String index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Image.asset(
        'assets/images/personalColor/$index.jpeg',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PageBanner(
          title: '퍼스널 컬러 진단',
        ),
        for (int i = 1; i <= 13; i++) insideImage(i.toString()),
        const PageFooter(),
        const MainFooter(),
      ],
    );
  }
}