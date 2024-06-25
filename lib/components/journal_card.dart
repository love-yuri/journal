/*
 * @Author: love-yuri yuri2078170658@gmail.com
 * @Date: 2024-06-23 21:56:57
 * @LastEditTime: 2024-06-25 16:57:43
 * @Description: 卡片
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:journal/moor/entiy/journal.dart';
import 'package:journal/utils/utils.dart';

class JournalCard extends StatefulWidget {
  final JournalTableData journal;
  const JournalCard({
    super.key,
    required this.journal,
  });

  @override
  State<StatefulWidget> createState() {
    return _JournalCardState();
  }
}

class _JournalCardState extends State<JournalCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        border: Border.all(width: 1.r, color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(children: [
        Row(
          children: [
            const Text(
              "12月30日",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Expanded(child: SizedBox()),
            Text(
              "10:00 AM",
              style: TextStyle(
                color: Utils.hexToColor("#94A3B8"),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(),
          child: Text(
            overflow: TextOverflow.ellipsis,
            widget.journal.content,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ]),
    );
  }
}
