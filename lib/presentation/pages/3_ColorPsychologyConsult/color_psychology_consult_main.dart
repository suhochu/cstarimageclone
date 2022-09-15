import 'package:cstar_image_clone/widget/page_footer.dart';
import 'package:flutter/material.dart';
import '../../../widget/main_footer.dart';
import '../../../widget/page_banner.dart';
import '../0_main/defaultLayout.dart';

class ColorPsychologyConsultPage extends StatelessWidget {
  static const String routeName = 'color_psychology_consult';

  const ColorPsychologyConsultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      child: _BuildContents(),
    );
  }
}

class _BuildContents extends StatelessWidget {
  const _BuildContents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PageBanner(
          title: '색채심리상담(컬러테라피)',
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Image.asset(
            'assets/images/colorTherapy/1.jpeg',
            fit: BoxFit.fitWidth,
          ),
        ),
        const PageFooter(),
        const MainFooter(),
      ],
    );
  }
}
