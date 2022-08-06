import 'package:cstar_image_clone/widget/slideshow.dart';
import 'package:flutter/material.dart';

class CstarImageContacts extends StatelessWidget {
  const CstarImageContacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 80,
        ),
        Stack(
          children: [
            Image.asset('assets/images/homepage/st2_bg.jpg',
                width: double.infinity, height: 750, fit: BoxFit.fitHeight),
            Column(
              children: [
                const SizedBox(height: 50),
                const Text('C S T A R',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300)),
                const SizedBox(height: 5),
                const Text('CSTAR IMAGE MAKER',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20),
                      color: Colors.deepPurple.shade800,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ImageSlideshow(
                              width: 500,
                              height: 410,
                              initialPage: 0,
                              autoPlayInterval: 3000,
                              isLoop: true,
                              children: [
                                Image.asset('assets/images/homepage/st_vis1.jpg', fit: BoxFit.fill),
                                Image.asset('assets/images/homepage/st_vis2.jpg', fit: BoxFit.fill),
                                Image.asset('assets/images/homepage/st_vis3.jpg', fit: BoxFit.fill),
                              ]),
                          const SizedBox(
                            height: 90,
                            child: Center(
                                child: Text(
                              '씨스타 이미지 컨설팅 문의',
                              style: TextStyle(
                                  fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
                            )),
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: const [
                        ContactCard(
                          color: Color.fromRGBO(55, 30, 32, 1),
                          title: '카카오톡',
                          content: 'CSTAR 카카오톡을 안내합니다.',
                          iconImage: 'st2_con_img01.png',
                        ),
                        ContactCard(
                          color: Color.fromRGBO(0, 198, 58, 1),
                          title: '네이버톡톡',
                          content: 'CSTAR 네이버톡톡을 안내합니다.',
                          iconImage: 'st2_con_img02.png',
                        ),
                        ContactCard(
                          color: Color.fromRGBO(67, 46, 136, 1),
                          title: '인스타그램',
                          content: 'CSTAR 인스타그램을 안내합니다.',
                          iconImage: 'st2_con_img03.png',
                        ),
                        ContactCard(
                          color: Color.fromRGBO(0, 198, 58, 1),
                          title: '네이버톡톡',
                          content: 'CSTAR 네이버블로그를 안내합니다.',
                          iconImage: 'st2_con_img04.png',
                        ),
                      ],
                    )
                  ],
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}

class ContactCard extends StatefulWidget {
  const ContactCard({
    Key? key,
    required this.iconImage,
    required this.title,
    required this.content,
    required this.color,
  }) : super(key: key);

  final String iconImage;
  final String title;
  final String content;
  final Color color;

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  bool isInRegion = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      color: isInRegion ? widget.color : const Color.fromRGBO(44, 44, 44, 1),
      duration: const Duration(milliseconds: 300),
      width: 500,
      height: 110,
      margin: const EdgeInsets.only(top: 20, right: 20),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (PointerEvent details) {
          setState(() {
            isInRegion = true;
          });
        },
        onExit: (PointerEvent details) {
          setState(() {
            isInRegion = false;
          });
        },
        child: Row(
          children: [
            Container(child: Image.asset('assets/images/homepage/${widget.iconImage}'), margin: const EdgeInsets.all(20),),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                Text(widget.content, style: const TextStyle(color: Colors.white, fontSize: 12),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
