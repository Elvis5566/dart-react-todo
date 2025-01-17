import 'package:json_annotation/json_annotation.dart';
import 'package:moor/moor.dart';
import 'package:todo_dart_react/src/db/dirty_column.dart';
import 'package:todo_dart_react/src/db/preference.dart';
import 'package:todo_dart_react/src/db/preference_converter.dart';
import 'package:todo_dart_react/src/db/vd_database.dart';

part 'users_dao.g.dart';

@JsonSerializable(includeIfNull: false)
class User extends DataClass with DirtyColumn implements Insertable<User> {
  User();

  @EntityPrimaryKey()
  String id;

  @EntityColumn(isNullable: true)
  String name;

  @EntityColumn(isNullable: true, converter: PreferenceConverter)
  Preference preference;

  @override
  Map<String, dynamic> toJson({ValueSerializer serializer = const ValueSerializer.defaults()}) => _$UserToJson(this);

  @override
  T createCompanion<T extends UpdateCompanion<User>>(bool nullToAbsent) => _$createCompanion(this, nullToAbsent) as T;

  @override
  String toString() => toJsonString();


//  User copyWith({String id, String name}) => User(
//    id: id ?? this.id,
//    name: name ?? this.name,
//  );

}

//@UseDao(tables:[Users], entity: User)
@UseDao(entity: User)
class UsersDao extends DatabaseAccessor<VDDatabase> with _$UsersDaoMixin {
  UsersDao(VDDatabase db) : super(db);
  void add(User user) => into(users).insert(user, orReplace: true);
  Future<List<User>> list() => select(users).get();
}
