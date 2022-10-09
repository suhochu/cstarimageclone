import 'package:cstar_image_clone/constants/route_Name.dart';

String tabBarMenuNames(PageName pageName) {
  switch (pageName) {
    case PageName.main:
      return '시스타 이미지';
    case PageName.personalColor:
      return '퍼스널 컬러 진단';
    case PageName.colorPsychology:
      return '색채심리상담';
    case PageName.certifications:
      return '자격증과정';
    case PageName.purchasing:
      return '컬러교구 구입';
    case PageName.inquiry:
      return '교육 및 강의';
  }
}
List<String> tabBarMenuSubNames = ['토탈이미지메이킹 컨설턴트', '퍼스널컬러 컨설턴트', '색채심리 마스터'];