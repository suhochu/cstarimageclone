import 'package:cstar_image_clone/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:routemaster/routemaster.dart';

void main() {
  Routemaster.setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) =>
      ResponsiveWrapper.builder(BouncingScrollWrapper.builder(context, child!),
          maxWidth: 2880,
          minWidth: 350,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(320, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(768, name: TABLET),
            const ResponsiveBreakpoint.resize(1280, name: DESKTOP),
          ],
          background: Container(color: const Color(0xFFF5F5F5))),
      title: 'Welcome to CSTAR IMAGE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 1)
      ),
      routerDelegate: RoutemasterDelegate(
        observers: [TitleObserver()],
        routesBuilder: (context) => routes,
      ),
      routeInformationParser: const RoutemasterParser(),

    );
  }
}

class TitleObserver extends RoutemasterObserver {
  @override
  void didChangeRoute(RouteData routeData, Page page) {
    if (page.name != null) {
      SystemChrome.setApplicationSwitcherDescription(
        ApplicationSwitcherDescription(
          label: page.name,
          primaryColor: 0xFF00FF00,
        ),
      );
    }
  }
}
