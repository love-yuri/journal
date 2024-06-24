/*
 * @Author: love-yuri yuri2078170658@gmail.com
 * @Date: 2024-06-23 22:59:06
 * @LastEditTime: 2024-06-24 23:10:07
 * @Description: 日记详情-编辑
 */
import 'package:flutter/material.dart';
import 'package:journal/components/journal_input.dart';
import 'package:journal/moor/entiy/journal.dart';
import 'package:journal/utils/utils.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DetailPageState();
  }
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
    _webdav();
  }

  void _webdav() async {
    // Webdav.instance.fetchWebDavContent();
    // WidgetsFlutterBinding.ensureInitialized();

    final database = JournalDatabase.instance;
    database.into(database.journalTable).insert(
          JournalTableCompanion.insert(
            content: "yuri ${Utils.now()}",
          ),
        );
    database.select(database.journalTable).get().then((values) {
      for (var element in values) {
        debugPrint(element.content);
      }
    });
    // debugPrint('items in database: $allItems');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("日记详情"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: _child(),
          ),
        ),
      ),
    );
  }

  Widget _child() {
    return Column(children: [
      Row(
        children: [
          const Text("6月23日 14:39"),
          Container(
            margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
            width: 3,
            height: 15,
            color: Colors.grey,
          ),
          const Text("4字"),
        ],
      ),
      const JournalInput(),
    ]);
  }
}
