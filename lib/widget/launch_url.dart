import 'package:url_launcher/url_launcher.dart';

enum URLs {
  naverTalkTalk,
  kakaoChannel,
  instaPage,
  naverBlog,
  cstarDirection,
  facebookPage,
  naverMap,
  phoneCall,
}

class LaunchURl {


  static void selectUrlMethod(URLs url) async {
    switch (url) {
      case URLs.naverTalkTalk:
        if (!await launchUrl(Uri.parse('https://nid.naver.com/nidlogin.login?svctype=64&url=https%3A%2F%2Ftalk.naver.com%2Fct%2Fwc4qzd%3Fnidref%3Dhttp%253A%252F%252Fcstar2.79.ypage.kr%252F%23nafullscreen'))) {
          throw 'Could not launch Naver TalkTalk';
        }
        break;
      case URLs.kakaoChannel:
        if (!await launchUrl(Uri.parse('https://pf.kakao.com/_lPGBd'))) {
          throw 'Could not launch Kakao Channel';
        }
        break;
      case URLs.instaPage:
        if (!await launchUrl(Uri.parse('https://www.instagram.com/cstarimagemaker/'))) {
          throw 'Could not launch InstagramPage';
        }
        break;
      case URLs.naverBlog:
        if (!await launchUrl(Uri.parse('https://blog.naver.com/wnduddl55'))) {
          throw 'Could not launch Naver Blog';
        }
        break;
      case URLs.cstarDirection:
        if (!await launchUrl(Uri.parse('https://www.google.com/maps/place/%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C+%EC%9A%A9%EC%82%B0%EA%B5%AC+%ED%95%9C%EA%B0%95%EB%A1%9C2%EA%B0%80+71/data=!3m1!4b1!4m5!3m4!1s0x357ca219bd6b5c59:0xfd906902750883e6!8m2!3d37.5301773!4d126.9716487?hl=ko'))) {
          throw 'Could not launch cstar Direction';
        }
        break;
      case URLs.facebookPage:
        if (!await launchUrl(Uri.parse('https://www.facebook.com/cstarimage/'))) {
          throw 'Could not launch FacebookPage';
        }
        break;
      case URLs.naverMap:
        if (!await launchUrl(Uri.parse('https://map.naver.com/v5/search/%EC%94%A8%EC%8A%A4%ED%83%80%EC%9D%B4%EB%AF%B8%EC%A7%80/place/49768739?c=14133957.4755631,4513272.4630257,15,0,0,0,dh&isCorrectAnswer=true'))) {
          throw 'Could not launch cstar Direction NaverMap';
        }
        break;
      case URLs.phoneCall:
        if (!await launchUrl(Uri(
          scheme: 'tel',
          path: '01083790578'
        ))) {
          throw 'Could not call Cstar';
        }
        break;
      default:
        throw 'Could not launch $url';
    }
  }

}
