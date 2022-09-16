import 'package:cstar_image_clone/presentation/pages/0_main/DefaultLayout.dart';
import 'package:cstar_image_clone/presentation/pages/99_component/page_banner.dart';
import 'package:cstar_image_clone/presentation/pages/99_component/page_footer.dart';
import 'package:cstar_image_clone/util/launch_url.dart';
import 'package:flutter/material.dart';
import '../99_component/main_footer.dart';

class PurchasingTeachingToolPage extends StatelessWidget {
  static const String routeName = 'purchasing_teaching_tool';

  const PurchasingTeachingToolPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Column(
        children: [
          const PageBanner(title: '컬러교구 구입'),
          _PurchasingContents(start: 2, end: 11, url: PurchaseURLs.diagnosisSheet),
          _PurchasingContents(start: 12, url: PurchaseURLs.diagnosisSheet),
          _PurchasingContents(start: 13, url: PurchaseURLs.warmCoolDiagnosisSheet),
          _PurchasingContents(start: 14, url: PurchaseURLs.diagnosisSheet),
          _PurchasingContents(start: 15, url: PurchaseURLs.diagnosisSheet),
          _PurchasingContents(start: 16, url: PurchaseURLs.diagnosisSheet),
          _PurchasingContents(start: 17, url: PurchaseURLs.diagnosisKit),
          _PurchasingContents(start: 18, url: PurchaseURLs.colorCard),
          _PurchasingContents(start: 19, url: PurchaseURLs.colorCard),
          _PurchasingContents(start: 20, url: PurchaseURLs.colorCard),
          const PageFooter(),
          const MainFooter()
        ],
      ),
    );
  }
}

class _PurchasingContents extends StatelessWidget {
  final int start;
  int? end;
  final PurchaseURLs url;

  _PurchasingContents({
    required this.start,
    this.end,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    end ??= start;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => LaunchPurchaseURLs.selectUrlMethod(url),
        child: Column(
          children: [
            for (int i = start; i <= end!; i++)
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Image.asset(
                  'assets/images/teachingTool/$i.jpeg',
                ),
              ),
          ],
        ),
      ),
    );
  }
}
