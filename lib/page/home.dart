/*
 * @Author: love-yuri yuri2078170658@gmail.com
 * @Date: 2024-06-23 19:58:11
 * @LastEditTime: 2024-06-24 19:40:20
 * @Description: home页面
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:journal/base/assets.dart';
import 'package:journal/base/route.dart';
import 'package:journal/components/journal_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
    // return Container(
    //   padding: EdgeInsets.all(10.r),
    //   decoration: BoxDecoration(
    //     gradient: GradientManager.bg,
    //   ),
    //   child: _child(),
    // );
  }

  // home界面主要child
  Widget _child() {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _refresher(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => {},
      ),
    );
  }

  // 下拉/上滑刷新
  SmartRefresher _refresher() {
    RefreshController refreshController =
        RefreshController(initialRefresh: false);
    return SmartRefresher(
      controller: refreshController,
      enablePullDown: true,
      onRefresh: () async {
        // 下拉刷新
        await Future.delayed(const Duration(milliseconds: 1000));
        refreshController.refreshCompleted();
      },
      header: const WaterDropHeader(),
      child: SafeArea(
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
        Widget child;
        if (index == 2) {
          child = const Text(
            "2022年2月",
            style: TextStyle(
                fontSize: 35,
                color: Color(0xFFEC4899),
                fontWeight: FontWeight.w800),
          );
        } else {
          child = const JournalCard();
        }
        return InkWell(
          onTap: () {
            // 跳转到日记详情页
            Navigator.pushNamed(context, RouteManager.detail);
          },
          child: child,
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
