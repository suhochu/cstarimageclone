import 'package:cstar_image_clone/presentation/pages/1_HomePage/02_home_tabBar.dart';
import 'package:flutter/material.dart';
import '../../../widget/footer.dart';
import '03_home_carousel.dart';
import '04_home_introduce.dart';
import '05_home_contactinfo.dart';
import '06_home_centerinfo.dart';

class CstarImageHomePage extends StatelessWidget {
  const CstarImageHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopTabBar(),
            const HomeCarousel(),
            HomeIntroduce(),
            const CstarImageContacts(),
            const CstarImageCenter(),
            const Footer(),
          ],
        ),
      ),
    );
  }
}




