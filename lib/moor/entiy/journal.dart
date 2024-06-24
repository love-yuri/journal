/*
 * @Author: love-yuri yuri2078170658@gmail.com
 * @Date: 2024-06-24 22:19:03
 * @LastEditTime: 2024-06-24 22:41:35
 * @Description: 笔记实体类
 */
// These additional imports are necessary to open the sqlite3 database
import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
// ignore: depend_on_referenced_packages
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'journal.g.dart';

// 日记内容表
class JournalTable extends Table {
  IntColumn get id => integer().autoIncrement()(); // 日记主键
  TextColumn get title => text().nullable()(); // 日记标题-留作备用
  TextColumn get content => text()(); // 日记内容
  IntColumn get timeSinceLastEntry => integer().nullable()(); // 距离上一条日记创建时间
  DateTimeColumn get createTime => dateTime().withDefault(currentDateAndTime)(); // 日记创建时间
  DateTimeColumn get updateTime => dateTime().withDefault(currentDateAndTime)(); // 日记更新时间
}

@DriftDatabase(tables: [JournalTable])
class JournalDatabase extends _$JournalDatabase {
  JournalDatabase._() : super(_openConnection());

  static JournalDatabase? _instance;

  static JournalDatabase get instance {
    _instance ??= JournalDatabase._();
    return _instance!;
  }

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  // LazyDatabase util 让我们找到文件 async 的正确位置。
  return LazyDatabase(() async {
    // 将数据库文件（此处名为 db.sqlite）放入文档文件夹中
    // 对于您的应用程序。
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'journal.db'));

    // 还可以解决旧 Android 版本的限制
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    // 让sqlite3为临时文件选择一个更合适的位置 -the
    // 由于沙箱，系统中的一项可能无法访问。
    final cachebase = (await getTemporaryDirectory()).path;
    // 我们无法在 Android 上访问 /tmp，默认情况下 sqlite3 会尝试访问。
    // 明确告诉它正确的临时目录。
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}

