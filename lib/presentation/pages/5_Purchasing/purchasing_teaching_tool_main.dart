import 'package:cstar_image_clone/presentation/pages/0_main/DefaultLayout.dart';
import 'package:flutter/material.dart';

import '../../../widget/main_footer.dart';
import '../../../widget/page_banner.dart';
import '../../../widget/page_footer.dart';

class PurchasingTeachingToolPage extends StatelessWidget {
  static const String routeName = 'purchasing_teaching_tool';

  const PurchasingTeachingToolPage({Key? key}) : super(key: key);

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
        'assets/images/teachingTool/$index.jpeg',
        // Todo 네이버 스마트 스토어 URL 링크 걸기
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PageBanner(
          title: '컬러교구 구입',
        ),
        for (int i = 1; i <= 20; i++) insideImage(i.toString()),
        const PageFooter(),
        const MainFooter()
      ],
    );
  }
}
