import 'package:flutter/material.dart';

import '../../../widget/google_Map.dart';

class CstarImageCenter extends StatelessWidget {
  const CstarImageCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(255, 255, 255, 1),
      child: Column(
        children: [
          const SizedBox(height: 50),
          const Text('C S T A R', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300)),
          const SizedBox(height: 5),
          const Text('CUSTOMER CENTER',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              noticeBoard(),
              customerService(),
              directions(),
            ],
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Container directions() {
    return Container(
      width: 330,
      height: 250,
      margin: const EdgeInsets.only(left: 20),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            color: const Color.fromRGBO(26, 73, 165, 1),
            padding: const EdgeInsets.all(20),
            width: 330,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('DIRECTIONS',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
                    Text('오시는길', style: TextStyle(fontSize: 18, color: Colors.white)),
                  ],
                ),
                const Icon(Icons.search, size: 50, color: Colors.white)
              ],
            ),
          ),
          Expanded(
            child: Container(color: Colors.yellow, child: const GoogleMapWidget()),
          )
        ],
      ),
    );
  }

  Container customerService() {
    return Container(
      color: const Color.fromRGBO(245, 76, 76, 1),
      width: 330,
      height: 250,
      margin: const EdgeInsets.only(left: 20),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: const [
          Icon(
            Icons.phone_in_talk,
            color: Colors.white,
            size: 40,
          ),
          SizedBox(
            height: 20,
          ),
          Text('CUSTOMER SERVICE',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
          SizedBox(
            height: 10,
          ),
          Text('010.9340.2890',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
          SizedBox(height: 5),
          Text('02.6482.2890',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
          SizedBox(height: 10),
          Text('궁금한사항있으시면 언제든문의주세요!', style: TextStyle(fontSize: 16, color: Colors.white)),
        ],
      ),
    );
  }

  Container noticeBoard() {
    return Container(
      color: const Color.fromRGBO(43, 180, 186, 1),
      width: 330,
      height: 250,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '빠른상담은',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Text(
                    '유선으로 연결해주세요.',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )
                ],
              ),
              Image.asset(
                'assets/images/homepage/campaign.png',
                color: Colors.white,
                width: 60,
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              color: Colors.white,
              child: const Text('게시물이 없습니다.'),
            ),
          )
        ],
      ),
    );
  }
}
