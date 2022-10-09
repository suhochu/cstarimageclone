import 'package:cstar_image_clone/route/go_router_provider.dart';
import 'package:cstar_image_clone/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
// import 'package:routemaster/routemaster.dart';

import 'constants/route_Name.dart';

void main() {
  // Routemaster.setPathUrlStrategy();
  runApp(_MyApp());
}

class _MyApp extends StatelessWidget {

  final goRouter = GoRouterInformation().goRouter;


  _MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('안녕하세요!');
    print('/${routeNames(PageName.main)}');
    return MaterialApp.router(
      builder: (context, child) => ResponsiveWrapper.builder(BouncingScrollWrapper.builder(context, child!),
          maxWidth: 2880,
          minWidth: 350,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(600, name: MOBILE),
            const ResponsiveBreakpoint.resize(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(2460, name: '4K'),
          ],
          background: Container(color: const Color(0xFFF5F5F5))),
      title: 'Welcome to CSTAR IMAGE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        fontFamily: 'NotoSans',
      ),
      routerDelegate: goRouter.routerDelegate,
      routeInformationProvider: goRouter.routeInformationProvider,
      routeInformationParser: goRouter.routeInformationParser,
      // routerDelegate: RoutemasterDelegate(
      //   observers: [TitleObserver()],
      //   routesBuilder: (context) => routes,
      // ),
      // routeInformationParser: const RoutemasterParser(),
    );
  }
}

// class TitleObserver extends RoutemasterObserver {
//   @override
//   void didChangeRoute(RouteData routeData, Page page) {
//     if (page.name != null) {
//       SystemChrome.setApplicationSwitcherDescription(
//         ApplicationSwitcherDescription(
//           label: page.name,
//           primaryColor: 0xFF00FF00,
//         ),
//       );
//     }
//   }
// }
