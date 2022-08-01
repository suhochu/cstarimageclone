import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:cstar_image_clone/presentation/pages/all_page_out.dart';

final routes = RouteMap(
  routes: {
    '/': (_) => const MaterialPage(child: CstarImageHomePage()),
    '/${PersonalColorDiagnosisPage.routeName}': (_) => const MaterialPage(child: PersonalColorDiagnosisPage()),
    '/color_psychology_consult': (_) => const MaterialPage(child: ColorPsychologyConsultPage()),
    '/certification_total_image_making': (_) => const MaterialPage(child: TotalImageMakingPage()),
    '/certification_personal_color_consultant': (_) =>
    const MaterialPage(child: PersonalColorConsultantPage()),
    '/certification_color_psychology_master': (_) =>
    const MaterialPage(child: ColorPsychologyMasterPage()),
    '/purchasing_teaching_tool': (_) => const MaterialPage(child: PurchasingTeachingToolPage()),
    '/inquiry_education_lecture': (_) => const MaterialPage(child: InquiryEducationOrLecturePage()),
  },
);