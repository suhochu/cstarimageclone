import 'package:flutter/material.dart';
import '99_home_export_pages.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({Key? key}) : super(key: key);
  static const String routeName = 'cstar_main';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const HomeCarousel(),
          HomeIntroduce(),
          const CstarImageContacts(),
          const CstarImageCenter(),
        ],
      ),
    );
  }
}
