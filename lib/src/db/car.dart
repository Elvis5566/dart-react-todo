
import 'package:moor/moor.dart';

class Cars extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 6, max: 32)();

//  TextColumn get preference => text().map(const PreferenceConverter()).nullable()();
}
