import 'dart:convert';

import 'package:moor/moor.dart';
import 'package:todo_dart_react/src/db/preference.dart';

class PreferenceConverter extends TypeConverter<Preference, String> {
  const PreferenceConverter();
  @override
  Preference mapToDart(String fromDb) {
    if (fromDb == null) {
      return null;
    }
    return Preference.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String mapToSql(Preference value) {
    if (value == null) {
      return null;
    }

    return json.encode(value.toJson());
  }
}