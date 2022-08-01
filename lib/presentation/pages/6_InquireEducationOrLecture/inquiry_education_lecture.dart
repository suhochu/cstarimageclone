import 'package:flutter/material.dart';

class InquiryEducationOrLecturePage extends StatelessWidget {
  static const String routeName = 'inquiry_education_lecture';
  const InquiryEducationOrLecturePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body : Center(
       child: Text('교육 및 강의'),
      ),
    );
  }
}
