/*
 * @Author: love-yuri yuri2078170658@gmail.com
 * @Date: 2024-06-23 19:58:11
 * @LastEditTime: 2024-06-27 22:35:33
 * @Description: home页面
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:journal/base/config.dart';
import 'package:journal/base/log.dart';
import 'package:journal/base/route.dart';
import 'package:journal/components/journal_card.dart';
import 'package:journal/moor/entiy/journal.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }

}

class _HomePageState extends State<HomePage> {
  List<JournalTableData> _journals = [];
  final refreshController = RefreshController(initialRefresh: false);

  @override
  void dispose() {
    super.dispose();
    log.d("dispose");
  }
  
  void initData() async {
    var db = JournalDatabase.instance;
    await db.select(db.journalTable).get().then((newJournals) {
      setState(() {
        _journals = newJournals;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  void _onRefresh() async {
    // 下拉刷新
    initData();
    refreshController.refreshCompleted();
  }

  /* ui部分 */
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(AssetsConfig.homeBg, fit: BoxFit.cover),
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
      body: _refresher(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.pushNamed(context, RouteManager.detail);
          initData();
        },
      ),
    );
  }

  // 下拉/上滑刷新
  SmartRefresher _refresher() {
    return SmartRefresher(
      controller: refreshController,
      enablePullDown: true,
      onRefresh: _onRefresh,
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
      itemCount: _journals.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        Widget child;
        if (index == -1) {
          child = const Text(
            "2022年2月",
            style: TextStyle(
                fontSize: 35,
                color: Color(0xFFEC4899),
                fontWeight: FontWeight.w800),
          );
        } else {
          child = JournalCard(
            journal: _journals[index],
          );
        }
        return InkWell(
          onTap: () async {
            // 跳转到日记详情页
            await Navigator.pushNamed(context, RouteManager.detail,
                arguments: _journals[index]);
            initData();
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
