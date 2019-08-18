import 'dart:html';

import 'package:react/react_dom.dart' as react_dom;
import 'package:react/react_client.dart' as react_client;
import 'package:todo_dart_react/src/foo.dart';

import 'package:todo_dart_react/todo_dart_react.dart';
import 'package:over_react/over_react.dart';
void main() {
//  react_client.setClientConfiguration();
  setClientConfiguration();

  TodoActions actions = new TodoActions();
  TodoStore store = new TodoStore(actions);

  var todoApp = (TodoApp()
    ..actions = actions
    ..store = store)();

  final container = querySelector('#app-container');
//  react_dom.render(todoApp, container);
  react_dom.render(Foo()(), container);
}
