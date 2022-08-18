import 'package:url_launcher/url_launcher.dart';

enum URLs {
  naverTalkTalk,
  kakaoChannel,
  instaPage,
  naverBlog,
  cstarDirection,
  facebookPage,
}

class LaunchURl {
  final String naverTalkTalk = 'https://nid.naver.com/nidlogin.login?svctype=64&url=https%3A%2F%2Ftalk.naver.com%2Fct%2Fwc4qzd%3Fnidref%3Dhttp%253A%252F%252Fcstar2.79.ypage.kr%252F%23nafullscreen';
  final String kakaoChannel = 'https://pf.kakao.com/_lPGBd';
  final String instaPage = 'https://www.instagram.com/cstarimagemaker/';
  final String naverBlog = 'https://blog.naver.com/wnduddl55';
  final String cstarDirection = 'https://www.google.com/maps/place/%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C+%EC%9A%A9%EC%82%B0%EA%B5%AC+%ED%95%9C%EA%B0%95%EB%A1%9C2%EA%B0%80+71/data=!3m1!4b1!4m5!3m4!1s0x357ca219bd6b5c59:0xfd906902750883e6!8m2!3d37.5301773!4d126.9716487?hl=ko';
  final String facebookPage = 'https://www.facebook.com/cstarimage/';

  void selectUrlMethod(URLs url){
    switch(url){
      case URLs.naverTalkTalk:
        launchNaverTalkTalk();
        break;
      case URLs.kakaoChannel:
        launchKakaoChannel();
        break;
      case URLs.instaPage:
        launchInstarPage();
        break;
      case URLs.naverBlog:
        launchNaverBlog();
        break;
      case URLs.cstarDirection:
        launchCstarDirection();
        break;
      case URLs.facebookPage:
        launchFacebookPage();
        break;
      default:
        throw 'Could not launch $url';
    }
  }

  Future<void> launchKakaoChannel() async {
    if (!await launchUrl(Uri.parse(kakaoChannel))) {
      throw 'Could not launch Kakao Channel';
    }
  }

  Future<void> launchNaverTalkTalk() async {
    if (!await launchUrl(Uri.parse(naverTalkTalk))) {
      throw 'Could not launch Naver TalkTalk';
    }
  }

  Future<void> launchInstarPage() async {
    if (!await launchUrl(Uri.parse(instaPage))) {
      throw 'Could not launch InstagramPage';
    }
  }

  Future<void> launchNaverBlog() async {
    if (!await launchUrl(Uri.parse(naverBlog))) {
      throw 'Could not launch Naver Blog';
    }
  }

  Future<void> launchCstarDirection() async {
    if (!await launchUrl(Uri.parse(cstarDirection))) {
      throw 'Could not launch cstar Direction';
    }
  }

  Future<void> launchFacebookPage() async {
    if (!await launchUrl(Uri.parse(facebookPage))) {
      throw 'Could not launch FacebookPage';
    }
  }

}