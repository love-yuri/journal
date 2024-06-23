import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:journal/base/assets.dart';
import 'package:journal/base/route.dart';
import 'package:journal/components/journal_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(AssetsManager.homeBg, fit: BoxFit.cover),
        Padding(
          padding: EdgeInsets.all(10.r),
          child: _child(),
        )
      ],
    );
  }

  // home界面主要child
  Widget _child() {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _listView(),
            ],
          ),
        ),
      ),
    );
  }

  // 日记显示listview
  ListView _listView() {
    return ListView.separated(
      itemCount: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            // 跳转到日记详情页
            Navigator.pushNamed(context, RouteManager.detail);
          },
          child: const JournalCard(),
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.transparent,
          height: 10.h,
        );
      },
    );
  }
}
