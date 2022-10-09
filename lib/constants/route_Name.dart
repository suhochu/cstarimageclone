import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum PageName {
  main,
  personalColor,
  colorPsychology,
  certifications,
  purchasing,
  inquiry,
}

String routeNames(PageName pageName) {
  switch (pageName) {
    case PageName.main:
      return 'cstar_main';
    case PageName.personalColor:
      return 'personal_color_diagnosis';
    case PageName.colorPsychology:
      return 'color_psychology_consult';
    case PageName.certifications:
      return 'certification_total_image_making';
    case PageName.purchasing:
      return 'purchasing_teaching_tool';
    case PageName.inquiry:
      return 'inquiry_education_lecture';
  }
}
void routeWithPageName(PageName pageName, BuildContext context) {
  switch (pageName) {
    case PageName.personalColor:
      context.goNamed(routeNames(PageName.personalColor));
      break;
    case PageName.colorPsychology:
      context.goNamed(routeNames(PageName.colorPsychology));
      break;
    case PageName.certifications:
      context.goNamed(routeNames(PageName.certifications), queryParams: {'page' : '1'});
      break;
    case PageName.purchasing:
      context.goNamed(routeNames(PageName.purchasing));
      break;
    case PageName.inquiry:
      context.goNamed(routeNames(PageName.inquiry));
      break;
    case PageName.main:
      context.goNamed(routeNames(PageName.main));
  }
}