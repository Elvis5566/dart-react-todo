
import 'package:moor/moor.dart';
import 'package:todo_dart_react/src/db/car.dart';
import 'package:todo_dart_react/src/db/users_dao.dart';

part 'vd_database.g.dart';

@UseMoor(tables: [Cars], daos: [UsersDao])
class VDDatabase extends _$VDDatabase {
  VDDatabase(QueryExecutor e): super(e);
//  VDDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite'));

  @override
  int get schemaVersion => 1;

}
