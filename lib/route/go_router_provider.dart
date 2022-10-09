import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../constants/route_Name.dart';
import '../presentation/pages/0_main/main.dart';
import '../presentation/pages/1_HomePage/home_main.dart';
import '../presentation/pages/2_PersonalColorDiagnosis/personalcolor_diagnosis_main.dart';
import '../presentation/pages/3_ColorPsychologyConsult/color_psychology_consult_main.dart';
import '../presentation/pages/4_CertificationPages/certification_page_main.dart';
import '../presentation/pages/5_Purchasing/purchasing_teaching_tool_main.dart';
import '../presentation/pages/6_InquireEducationOrLecture/inquiry_education_lecture_main.dart';

class GoRouterInformation {
  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _shellNavigatorKey = GlobalKey<NavigatorState>();
  late final GoRouter goRouter;

  GoRouterInformation() {
    goRouter = GoRouter(
      initialLocation:routeNames(PageName.main),
      navigatorKey: _rootNavigatorKey,
      routes: [
        ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder: (context, state, child) {
              return CstarImageHomePage(child: child);
            },
            routes: [
              GoRoute(
                path: routeNames(PageName.main),
                name: routeNames(PageName.main),
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: HomeMain(),
                ),
              ),
              GoRoute(
                path: '/${routeNames(PageName.personalColor)}',
                name: routeNames(PageName.personalColor),
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: PersonalColorDiagnosisPage(),
                ),
              ),
              GoRoute(
                path: '/${routeNames(PageName.colorPsychology)}',
                name: routeNames(PageName.colorPsychology),
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: ColorPsychologyConsultPage(),

                ),
              ),
              GoRoute(
                path: '/${routeNames(PageName.certifications)}',
                name: routeNames(PageName.certifications),
                pageBuilder: (context, state) => NoTransitionPage(
                  child:CertificationPage(
                      query: state.queryParams['page'],
                    ),

                ),
              ),
              GoRoute(
                path: '/${routeNames(PageName.purchasing)}',
                name: routeNames(PageName.purchasing),
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: PurchasingTeachingToolPage(),

                ),
              ),
              GoRoute(
                path: '/${routeNames(PageName.inquiry)}',
                name: routeNames(PageName.inquiry),
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: InquiryEducationOrLecturePage(),
                  ),
                ),

            ])
      ],
    );
  }
}
