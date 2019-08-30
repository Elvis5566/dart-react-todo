
import 'package:moor/moor.dart';

mixin DirtyColumn {
  @EntityColumn(isNullable: true)
  bool dirty;
}