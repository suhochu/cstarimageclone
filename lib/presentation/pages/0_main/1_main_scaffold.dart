import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import '../all_pages_out.dart';

class CstarImageHomePage extends StatelessWidget {
  const CstarImageHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopTabBar(),
      body: TabBarView(

        controller: TabPage.of(context).controller,
        children: const [
          HomeMain(),
          PersonalColorDiagnosisPage(),
          ColorPsychologyConsultPage(),
          TotalImageMakingPage(),
          PurchasingTeachingToolPage(),
          InquiryEducationOrLecturePage(),
        ],
      ),
    );
  }
}
