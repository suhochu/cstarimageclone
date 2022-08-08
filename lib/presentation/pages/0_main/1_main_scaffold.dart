import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import '../all_pages_out.dart';

class CstarImageHomePage extends StatelessWidget {
  const CstarImageHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final indexedPage = IndexedPage.of(context);
    return Scaffold(
      appBar: const TopTabBar(),
      body: PageStackNavigator(
        stack: indexedPage.currentStack,
      ),
    );
  }
}
