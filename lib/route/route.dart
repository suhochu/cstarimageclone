import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import '../presentation/pages/all_pages_out.dart';

final routes = RouteMap(
  routes: {
    '/': (route) => const TabPage(child: CstarImageHomePage(), paths: [
          '/${HomeMain.routeName}',
          '/${PersonalColorDiagnosisPage.routeName}',
          '/${ColorPsychologyConsultPage.routeName}',
          '/${TotalImageMakingPage.routeName}',
          '/${PurchasingTeachingToolPage.routeName}',
          '/${InquiryEducationOrLecturePage.routeName}',
        ]),
    '/${HomeMain.routeName}': (_) => const MaterialPage(child: HomeMain()),
    '/${PersonalColorDiagnosisPage.routeName}': (_) =>
        const MaterialPage(child: PersonalColorDiagnosisPage()),
    '/${ColorPsychologyConsultPage.routeName}': (_) =>
        const MaterialPage(child: ColorPsychologyConsultPage()),
    '/${TotalImageMakingPage.routeName}': (_) => const MaterialPage(child: TotalImageMakingPage()),
    '/${TotalImageMakingPage.routeName}/${PersonalColorConsultantPage.routeName}': (_) =>
        const MaterialPage(child: PersonalColorConsultantPage()),
    '/${TotalImageMakingPage.routeName}/${ColorPsychologyMasterPage.routeName}': (_) =>
        const MaterialPage(child: ColorPsychologyMasterPage()),
    '/${PurchasingTeachingToolPage.routeName}': (_) => const MaterialPage(child: PurchasingTeachingToolPage()),
    '/${InquiryEducationOrLecturePage.routeName}': (_) => const MaterialPage(child: InquiryEducationOrLecturePage()),
  },
);
// //
// '/${PersonalColorDiagnosisPage.routeName}': (_) => const MaterialPage(child: PersonalColorDiagnosisPage()),
// '/color_psychology_consult': (_) => const MaterialPage(child: ColorPsychologyConsultPage()),
// '/certification_total_image_making': (_) => const MaterialPage(child: TotalImageMakingPage()),
// '/certification_personal_color_consultant': (_) =>
// const MaterialPage(child: PersonalColorConsultantPage()),
// '/certification_color_psychology_master': (_) =>
// const MaterialPage(child: ColorPsychologyMasterPage()),
// '/purchasing_teaching_tool': (_) => const MaterialPage(child: PurchasingTeachingToolPage()),
// '/purchasing_teaching_tool': (_) => const MaterialPage(child: InquiryEducationOrLecturePage()),
