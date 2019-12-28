import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List _imgurls = [
    'http://img.zcool.cn/community/01fa5b590f1bb5a80121455078583b.jpg@1280w_1l_2o_100sh.jpg',
    'http://photo.tuchong.com/27323/f/397935.jpg',
    'http://bpic.588ku.com/back_pic/03/70/88/6957b6eb81a4858.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 5,
              child: Swiper(
                itemCount: _imgurls.length,
                autoplay: true,
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(_imgurls[index], fit: BoxFit.fill);
                },
                pagination: SwiperPagination(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}