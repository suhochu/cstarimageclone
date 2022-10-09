// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:routemaster/routemaster.dart';
//
// import '../presentation/pages/0_main/main_scaffold.dart';
// import '../presentation/pages/1_HomePage/home_main.dart';
// import '../presentation/pages/2_PersonalColorDiagnosis/personalcolor_diagnosis_main.dart';
// import '../presentation/pages/3_ColorPsychologyConsult/color_psychology_consult_main.dart';
// import '../presentation/pages/4_CertificationPages/certification_page_main.dart';
// import '../presentation/pages/5_Purchasing/purchasing_teaching_tool_main.dart';
// import '../presentation/pages/6_InquireEducationOrLecture/inquiry_education_lecture_main.dart' deferred as box;
//
// final routes = RouteMap(
//   routes: {
//     '/': (route) => const IndexedPage(
//           child: CstarImageHomePage(),
//           paths: [
//             '/${HomeMain.routeName}',
//             '/${PersonalColorDiagnosisPage.routeName}',
//             '/${ColorPsychologyConsultPage.routeName}',
//             '/${CertificationPage.routeName}?query=1',
//             '/${PurchasingTeachingToolPage.routeName}',
//             '/inquiry_education_lecture',
//           ],
//         ),
//     '/${HomeMain.routeName}': (_) => const NoAnimationPage(name: 'Welcome to CSTAR IMAGE', child: HomeMain()),
//     '/${PersonalColorDiagnosisPage.routeName}': (_) =>
//         const NoAnimationPage(name: '퍼스널 컬러 진단', child: PersonalColorDiagnosisPage()),
//     '/${ColorPsychologyConsultPage.routeName}': (_) =>
//         const NoAnimationPage(name: '색채심리상담(컬러테라피)', child: ColorPsychologyConsultPage()),
//     '/${CertificationPage.routeName}': (info) =>
//         NoAnimationPage(name: '자격증과정', child: CertificationPage(query: info.queryParameters['query'])),
//     '/${PurchasingTeachingToolPage.routeName}': (_) =>
//         const NoAnimationPage(name: '컬러교구 구입', child: PurchasingTeachingToolPage()),
//     '/inquiry_education_lecture': (_) => NoAnimationPage(
//         name: '교육 및 강의(문의)',
//         child: DeferredPage(
//           future: box.loadLibrary(),
//           deferredPage: box.InquiryEducationOrLecturePage(),
//         )),
//   },
//   onUnknownRoute: (route) => const Redirect('/'),
// );
//
// class NoAnimationPage extends TransitionBuilderPage<void> {
//   const NoAnimationPage({required Widget child, required this.name}) : super(child: child, name: name);
//
//   @override
//   final String name;
//
//   @override
//   PageTransition buildPushTransition(BuildContext context) {
//     if (kIsWeb) {
//       // No push transition on web
//       return PageTransition.none;
//     }
//
//     // Default Android fade upwards transition on push
//     return PageTransition.fadeUpwards;
//   }
//
//   @override
//   PageTransition buildPopTransition(BuildContext context) {
//     if (kIsWeb) {
//       // No pop transition on web
//       return PageTransition.none;
//     }
//
//     // Cupertino transition on pop
//     return PageTransition.cupertino;
//   }
// }
//
// class DeferredPage extends StatelessWidget {
//   const DeferredPage({Key? key, required this.future,required this.deferredPage}) : super(key: key);
//   final Future<dynamic> future;
//   final Widget deferredPage;
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<void>(
//       future: future,
//       builder: (context, snapshot) {
//         print('Deferred Success');
//         if (snapshot.connectionState == ConnectionState.done) {
//           if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           }
//           return deferredPage;
//         }
//         return const CircularProgressIndicator();
//       },
//     );
//   }
// }
