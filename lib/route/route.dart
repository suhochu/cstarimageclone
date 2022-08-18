import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import '../presentation/pages/all_pages_out.dart';

final routes = RouteMap(
  routes: {
    '/': (route) => const IndexedPage(
          child: CstarImageHomePage(),
          paths: [
            '/${HomeMain.routeName}',
            '/${PersonalColorDiagnosisPage.routeName}',
            '/${ColorPsychologyConsultPage.routeName}',
            '/${CertificationPage.routeName}?query=1',
            '/${PurchasingTeachingToolPage.routeName}',
            '/${InquiryEducationOrLecturePage.routeName}',
          ],
        ),
    '/${HomeMain.routeName}': (_) =>
         const NoAnimationPage(name: 'Welcome to CSTAR IMAGE', child: HomeMain()),
    '/${PersonalColorDiagnosisPage.routeName}': (_) =>
        const NoAnimationPage(name: '퍼스널 컬러 진단', child: PersonalColorDiagnosisPage()),
    '/${ColorPsychologyConsultPage.routeName}': (_) =>
        const NoAnimationPage(name: '색채심리상담(컬러테라피)', child: ColorPsychologyConsultPage()),
    '/${CertificationPage.routeName}': (info) =>
        NoAnimationPage(name: '자격증과정', child: CertificationPage(query: info.queryParameters['query'])),
    '/${PurchasingTeachingToolPage.routeName}': (_) =>
        const NoAnimationPage(name: '컬러교구 구입', child: PurchasingTeachingToolPage()),
    '/${InquiryEducationOrLecturePage.routeName}': (_) =>
        const NoAnimationPage(name: '교육 및 강의(문의)', child: InquiryEducationOrLecturePage()),
  },
  onUnknownRoute: (route) => const Redirect('/'),
);

class NoAnimationPage extends TransitionBuilderPage<void> {
  const NoAnimationPage({required Widget child, required this.name})
      : super(child: child, name: name);

  @override
  final String name;

  @override
  PageTransition buildPushTransition(BuildContext context) {
    if (kIsWeb) {
      // No push transition on web
      return PageTransition.none;
    }

    // Default Android fade upwards transition on push
    return PageTransition.fadeUpwards;
  }

  @override
  PageTransition buildPopTransition(BuildContext context) {
    if (kIsWeb) {
      // No pop transition on web
      return PageTransition.none;
    }

    // Cupertino transition on pop
    return PageTransition.cupertino;
  }
}
