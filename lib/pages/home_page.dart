import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _appBarOpacity = 0.0;

  Widget _getSwiperContainer(BuildContext context) {
    List imgurls = [
      'http://img.zcool.cn/community/01fa5b590f1bb5a80121455078583b.jpg@1280w_1l_2o_100sh.jpg',
      'http://photo.tuchong.com/27323/f/397935.jpg',
      'http://bpic.588ku.com/back_pic/03/70/88/6957b6eb81a4858.jpg',
    ];
    return Container(
      height: MediaQuery.of(context).size.height / 5,
      child: Swiper(
        itemCount: imgurls.length,
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(imgurls[index], fit: BoxFit.fill);
        },
        pagination: SwiperPagination(),
      )
    );
  }

  Widget _getPaddingContainer(BuildContext context) {
    return Container(
      height: 725,
      child: Center(
        child: Text('Padding Padding Padding'),
      ),
    );
  }

  Widget _getOpacityAppBar(BuildContext context) {
    return Opacity(
      opacity: _appBarOpacity,
      child: Container(
        height: MediaQuery.of(context).size.height / 10,
        decoration: BoxDecoration(color: Colors.blue),
        child: Center(
          child: Padding(padding: EdgeInsets.only(top:10), child: Text('首页'))
        )
      )
    );
  }

  Widget _getBodyView(BuildContext context) {
    return ListView(
      children: <Widget>[
        _getSwiperContainer(context),
        _getPaddingContainer(context),
      ],
    );
  }

  Widget _getBodyNotificationListener(BuildContext context) {
    return NotificationListener(
      onNotification: (scrollNotification) {
        if(scrollNotification is ScrollUpdateNotification && scrollNotification.depth == 0) {
          double offset =  scrollNotification.metrics.pixels;
          double MAX_OFFSET = 128.0;
          double percent = offset / MAX_OFFSET;
          if(percent > 1.0) {
            percent = 1.0;
          }
          setState(() {
            _appBarOpacity = percent;
          });
        }
      },
      child: _getBodyView(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: _getBodyNotificationListener(context),
          ),
          _getOpacityAppBar(context),
        ],
      )
    );
  }
}