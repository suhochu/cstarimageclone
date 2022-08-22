import 'package:flutter/material.dart';

import '../widget/launch_url.dart';

class ContactPoint {
  String title;
  String content;
  String iconImage;
  URLs url;
  Color color;

  ContactPoint({
    required this.title,
    required this.content,
    required this.iconImage,
    required this.url,
    required this.color,
  });
}

List<ContactPoint> contactPoint = [
  ContactPoint(
    title: '카카오톡',
    content: 'CSTAR 카카오톡을 안내합니다.',
    iconImage: 'st2_con_img01.png',
    url: URLs.kakaoChannel,
    color: const Color.fromRGBO(55, 30, 32, 1),
  ),
  ContactPoint(
      title: '네이버톡톡',
      content: 'CSTAR 네이버톡톡을 안내합니다.',
      iconImage: 'st2_con_img02.png',
      url: URLs.naverTalkTalk,
      color: const Color.fromRGBO(0, 198, 58, 1)),
  ContactPoint(
      title: '인스타그램',
      content: 'CSTAR 인스타그램을 안내합니다.',
      iconImage: 'st2_con_img03.png',
      url: URLs.instaPage,
      color: const Color.fromRGBO(67, 46, 136, 1)),
  ContactPoint(
      title: '네이버블로그',
      content: 'CSTAR 네이버블로그를 안내합니다.',
      iconImage: 'st2_con_img04.png',
      url: URLs.naverBlog,
      color: const Color.fromRGBO(0, 198, 58, 1))
];
