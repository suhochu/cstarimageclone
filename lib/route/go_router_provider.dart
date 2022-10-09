import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../constants/route_Name.dart';
import '../presentation/pages/0_main/main.dart';
import '../presentation/pages/1_HomePage/home_main.dart';
import '../presentation/pages/2_PersonalColorDiagnosis/personalcolor_diagnosis_main.dart'
    deferred as personalcolor_diagnosis_page;
import '../presentation/pages/3_ColorPsychologyConsult/color_psychology_consult_main.dart'
    deferred as color_psychology_page;
import '../presentation/pages/4_CertificationPages/certification_page_main.dart' deferred as certification_page;
import '../presentation/pages/5_Purchasing/purchasing_teaching_tool_main.dart ' deferred as purchasing_page;
import '../presentation/pages/6_InquireEducationOrLecture/inquiry_education_lecture_main.dart' deferred as inquiry_page;

class GoRouterInformation {
  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _shellNavigatorKey = GlobalKey<NavigatorState>();
  late final GoRouter goRouter;

  GoRouterInformation() {
    goRouter = GoRouter(
      initialLocation: '/${routeNames(PageName.main)}',
      navigatorKey: _rootNavigatorKey,
      routes: [
        ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder: (context, state, child) {
              return CstarImageHomePage(child: child);
            },
            routes: [
              GoRoute(
                path: '/${routeNames(PageName.main)}',
                name: routeNames(PageName.main),
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: HomeMain(),
                ),
              ),
              GoRoute(
                path: '/${routeNames(PageName.personalColor)}',
                name: routeNames(PageName.personalColor),
                pageBuilder: (context, state) => NoTransitionPage(
                  child: DeferredPage(
                    future: personalcolor_diagnosis_page.loadLibrary(),
                    deferredPage: personalcolor_diagnosis_page.PersonalColorDiagnosisPage(),
                  ),
                ),
              ),
              GoRoute(
                path: '/${routeNames(PageName.colorPsychology)}',
                name: routeNames(PageName.colorPsychology),
                pageBuilder: (context, state) => NoTransitionPage(
                  child: DeferredPage(
                    future: color_psychology_page.loadLibrary(),
                    deferredPage: color_psychology_page.ColorPsychologyConsultPage(),
                  ),
                ),
              ),
              GoRoute(
                path: '/${routeNames(PageName.certifications)}',
                name: routeNames(PageName.certifications),
                pageBuilder: (context, state) => NoTransitionPage(
                  child: DeferredPage(
                    future: certification_page.loadLibrary(),
                    deferredPage: certification_page.CertificationPage(
                      query: state.queryParams['page'],
                    ),
                  ),
                ),
              ),
              GoRoute(
                path: '/${routeNames(PageName.purchasing)}',
                name: routeNames(PageName.purchasing),
                pageBuilder: (context, state) => NoTransitionPage(
                  child: DeferredPage(
                    future: purchasing_page.loadLibrary(),
                    deferredPage: purchasing_page.PurchasingTeachingToolPage(),
                  ),
                ),
              ),
              GoRoute(
                path: '/${routeNames(PageName.inquiry)}',
                name: routeNames(PageName.inquiry),
                pageBuilder: (context, state) => NoTransitionPage(
                  child: DeferredPage(
                    future: inquiry_page.loadLibrary(),
                    deferredPage: inquiry_page.InquiryEducationOrLecturePage(),
                  ),
                ),
              ),
            ])
      ],
    );
  }
}

class DeferredPage extends StatelessWidget {
  const DeferredPage({Key? key, required this.future, required this.deferredPage}) : super(key: key);
  final Future<dynamic> future;
  final Widget deferredPage;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: future,
      builder: (context, snapshot) {
        print('Deferred Success : ${deferredPage.toString()}');
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          return deferredPage;
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
