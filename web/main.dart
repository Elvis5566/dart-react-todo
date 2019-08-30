import 'dart:html';

import 'package:moor/moor_web.dart';
import 'package:react/react_dom.dart' as react_dom;
import 'package:react/react_client.dart' as react_client;
import 'package:todo_dart_react/src/counter.dart';
import 'package:todo_dart_react/src/db/preference.dart';
import 'package:todo_dart_react/src/db/users_dao.dart';
import 'package:todo_dart_react/src/db/vd_database.dart';
import 'package:todo_dart_react/src/foo.dart';

import 'package:todo_dart_react/todo_dart_react.dart';
import 'package:over_react/over_react.dart';
void main() async {
//  react_client.setClientConfiguration();
  setClientConfiguration();

//  final db = MyDatabase();

  final db = VDDatabase(WebDatabase('db'));

  Preference preference = Preference();
  preference.selectedTheme = 'Dark';
  preference.receiveEmails = true;

  User user = User();
  user.id = 'ggyy';
  user.name = 'Elvis5566';
  user.dirty = true;
  user.preference = preference;
  db.usersDao.add(user);
  List<User> users = await db.usersDao.list();

  for (final user in users) {
    print("gggg ${user.toString()}");
  }

  TodoActions actions = new TodoActions();
  TodoStore store = new TodoStore(actions);

  var todoApp = (TodoApp()
    ..actions = actions
    ..store = store)();

  final container = querySelector('#app-container');
//  react_dom.render(todoApp, container);
  react_dom.render((Foo()..counter = Counter())(), container);
}
