import 'package:flutter/material.dart';

class PageBanner extends StatelessWidget {
  const PageBanner({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            width: double.infinity,
            height: 400,
            child: Image.asset(
              'assets/images/common/0.jpg',
              fit: BoxFit.fill,
            )),
        Positioned(
            left: 0,
            right: 0,
            top: 180,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.w600,
              ),
            ))
      ],
    );
  }
}
