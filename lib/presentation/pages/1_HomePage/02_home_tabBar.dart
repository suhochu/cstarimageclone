import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:routemaster/routemaster.dart';

import '../all_page_out.dart';

class TopTabBar extends StatelessWidget {
  const TopTabBar({Key? key}) : super(key: key);

  TextStyle topTabBarTextStyle({double sizeFactor = 1}) {
    return TextStyle(
      fontSize: 11 * sizeFactor,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    );
  }

  @override
  Widget build(BuildContext context) {
    double? sizeFactor = ResponsiveValue(context, defaultValue: 1.0, valueWhen: [
      const Condition.smallerThan(name: TABLET, value: 0.6),
      const Condition.largerThan(name: TABLET, value: 1.5),
    ]).value;
    return Column(
      children: [
        Container(
          height: 15,
          color: Colors.grey,
          margin: const EdgeInsets.only(bottom: 10),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 5,
            ),
            GestureDetector(
              child: Image.asset(
                'assets/images/homepage/logo.png',
                height: 50 * sizeFactor!,
                fit: BoxFit.fitHeight,
              ),
              onTap: () => Routemaster.of(context).push('/'),
            ),
            Expanded(
              child: ResponsiveVisibility(
                hiddenWhen: const [Condition.smallerThan(name: TABLET)],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        onPressed: () => Routemaster.of(context)
                            .push('/${PersonalColorDiagnosisPage.routeName}'),
                        child: Text(
                          '퍼스널 컬러 진단',
                          style: topTabBarTextStyle(sizeFactor: sizeFactor),
                        )),
                    TextButton(
                        onPressed: () => Routemaster.of(context)
                            .push('/${ColorPsychologyConsultPage.routeName}'),
                        child: Text(
                          '색채심리상담(컬러테라피)',
                          style: topTabBarTextStyle(sizeFactor: sizeFactor),
                        )),
                    TextButton(
                        onPressed: () =>
                            Routemaster.of(context).push('/${TotalImageMakingPage.routeName}'),
                        child: Text(
                          '자격증과정',
                          style: topTabBarTextStyle(sizeFactor: sizeFactor),
                        )),
                    TextButton(
                        onPressed: () => Routemaster.of(context)
                            .push('/${PurchasingTeachingToolPage.routeName}'),
                        child: Text(
                          '컬러교구 구입',
                          style: topTabBarTextStyle(sizeFactor: sizeFactor),
                        )),
                    TextButton(
                        onPressed: () => Routemaster.of(context)
                            .push('/${InquiryEducationOrLecturePage.routeName}'),
                        child: Text(
                          '교육 및 강의(문의)',
                          style: topTabBarTextStyle(sizeFactor: sizeFactor),
                        )),
                  ],
                ),
              ),
            ),
            ResponsiveVisibility(
              hiddenWhen: const [Condition.largerThan(name: MOBILE)],
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.menu,
                    color: Colors.deepPurple,
                    size: 35 * sizeFactor,
                  )),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        )
      ],
    );
  }
}
