import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../constants/route_Name.dart';
import '../presentation/pages/0_main/main.dart';
import '../presentation/pages/1_HomePage/home_main.dart';
import '../presentation/pages/2_PersonalColorDiagnosis/personalcolor_diagnosis_main.dart' deferred as personal_color;
import '../presentation/pages/3_ColorPsychologyConsult/color_psychology_consult_main.dart' deferred as color_psychology;
import '../presentation/pages/4_CertificationPages/certification_page_main.dart' deferred as certification;
import '../presentation/pages/5_Purchasing/purchasing_teaching_tool_main.dart' deferred as purchasing;
import '../presentation/pages/6_InquireEducationOrLecture/inquiry_education_lecture_main.dart' deferred as inquiry;

class GoRouterInformation {
  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _shellNavigatorKey = GlobalKey<NavigatorState>();
  late final GoRouter goRouter;

  GoRouterInformation() {
    goRouter = GoRouter(
      initialLocation: routeNames(PageName.main),
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
              pageBuilder: (context, state) => NoTransitionPage(
                child: DeferredPage(
                  future: personal_color.loadLibrary,
                  buildChild: () => personal_color.PersonalColorDiagnosisPage(),
                ),
              ),
            ),
            GoRoute(
              path: '/${routeNames(PageName.colorPsychology)}',
              name: routeNames(PageName.colorPsychology),
              pageBuilder: (context, state) => NoTransitionPage(
                child: DeferredPage(
                  future: color_psychology.loadLibrary,
                  buildChild: () => color_psychology.ColorPsychologyConsultPage(),
                ),
              ),
            ),
            GoRoute(
              path: '/${routeNames(PageName.certifications)}',
              name: routeNames(PageName.certifications),
              pageBuilder: (context, state) => NoTransitionPage(
                child: DeferredPage(
                  future: certification.loadLibrary,
                  buildChild: () => certification.CertificationPage(query: state.queryParams['page']),
                ),
              ),
            ),
            GoRoute(
              path: '/${routeNames(PageName.purchasing)}',
              name: routeNames(PageName.purchasing),
              pageBuilder: (context, state) => NoTransitionPage(
                child: DeferredPage(
                  future: purchasing.loadLibrary,
                  buildChild: () => purchasing.PurchasingTeachingToolPage(),
                ),
              ),
            ),
            GoRoute(
              path: '/${routeNames(PageName.inquiry)}',
              name: routeNames(PageName.inquiry),
              pageBuilder: (context, state) => NoTransitionPage(
                child: DeferredPage(
                  future: inquiry.loadLibrary,
                  buildChild: () => inquiry.InquiryEducationOrLecturePage(),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class DeferredPage extends StatelessWidget {
  const DeferredPage({
    Key? key,
    required this.future,
    required this.buildChild,
  }) : super(key: key);

  final Future<dynamic> Function() future;
  final Widget Function() buildChild;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return buildChild();
        } else {
          return const SizedBox(
            width: 200,
            height: 200,
            child: Center(child: CircularProgressIndicator(color: Colors.redAccent,)),
          );
        }
      },
    );
  }
}
