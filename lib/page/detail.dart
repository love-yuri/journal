/*
 * @Author: love-yuri yuri2078170658@gmail.com
 * @Date: 2024-06-23 22:59:06
 * @LastEditTime: 2024-06-25 22:58:30
 * @Description: 日记详情-编辑
 */
import 'package:flutter/material.dart';
import 'package:journal/components/journal_input.dart';
import 'package:journal/moor/entiy/journal.dart';
import 'package:journal/utils/utils.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  DetailPage({super.key}) {
    _journalInputModel = JournalInputModel();
    _journalInput = JournalInput(
      onChanged: _journalInputModel.onChanged,
    );
  }

  late final JournalInputModel _journalInputModel;
  late final JournalInput _journalInput;

  @override
  State<StatefulWidget> createState() {
    return _DetailPageState();
  }
}

class _DetailPageState extends State<DetailPage> {
  JournalTableData? _journal;

  @override
  void initState() {
    super.initState();
    _webdav();
  }

  // 初始化日记数据
  void _initJournalData() {
    var data = ModalRoute.of(context)?.settings.arguments as JournalTableData?;
    _journal = data ??
        JournalTableData(
          content: "",
          id: -1,
          createTime: DateTime.now(),
          updateTime: DateTime.now(),
        );
    widget._journalInput.text = _journal!.content;
    widget._journalInputModel.onChanged(_journal!.content);
  }

  void _webdav() async {
    // Webdav.instance.fetchWebDavContent();
    // WidgetsFlutterBinding.ensureInitialized();

    // final database = JournalDatabase.instance;
    // database.into(database.journalTable).insert(
    //       JournalTableCompanion.insert(
    //         content: "yuri ${Utils.now()}",
    //       ),
    //     );
    // database.select(database.journalTable).get().then((values) {
    //   for (var element in values) {
    //     debugPrint(element.content);
    //   }
    // });
    // debugPrint('items in database: $allItems');
  }

  // 保存/更新日记
  void _savaJournal() {
    var db = JournalDatabase.instance;
    if (_journal!.id == -1 &&
        (widget._journalInput.text?.isNotEmpty ?? false)) {
      db.into(db.journalTable).insert(
            JournalTableCompanion.insert(
              content: widget._journalInput.text!,
            ),
          );
    } else if (_journal!.content != widget._journalInput.text) {
      var newVal = _journal!.copyWith(
        content: widget._journalInput.text!,
        updateTime: DateTime.now(),
      );
      db.update(db.journalTable).replace(newVal);
    }
  }

  // 删除日记
  void _deleteJournal() {
    var db = JournalDatabase.instance;
    db.delete(db.journalTable).delete(_journal!);
    Navigator.of(context).pop('referesh');
  }

  /* ui部分 */
  @override
  Widget build(BuildContext context) {
    _initJournalData(); // 初始化数据
    return ChangeNotifierProvider(
      create: (_) => widget._journalInputModel,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("日记详情"),
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                _savaJournal();
                Navigator.of(context).pop('referesh');
              },
            ),
            actions: <Widget>[
              PopupMenuButton<String>(
                onSelected: (String result) {
                  switch (result) {
                    case "delete":
                      _deleteJournal();
                      break;
                    default:
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'delete',
                    child: Text('删除'),
                  ),
                ],
                icon: const Icon(Icons.more_vert), // Three dots icon
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: _child(),
            ),
          ),
        ),
      ),
    );
  }

  // 主要child
  Widget _child() {
    return Column(
      children: [
        Row(
          children: [
            Text(Utils.timeFormat(_journal!.createTime)),
            Container(
              margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
              width: 3,
              height: 15,
              color: Colors.grey,
            ),
            Consumer<JournalInputModel>(
              builder: (_, model, __) {
                return Text("${model.text.length}字");
              },
            ),
          ],
        ),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(),
          child: Text(Utils.timeFormat(_journal!.updateTime)),
        ),
        widget._journalInput,
      ],
    );
  }
}
