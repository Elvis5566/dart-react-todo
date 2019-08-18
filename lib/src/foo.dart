import 'package:over_react/over_react.dart';

part 'foo.over_react.g.dart';

@Factory()
UiFactory<FooProps> Foo = _$Foo;

@Props()
class _$FooProps extends UiProps {
  // Props go here, declared as fields:
  bool isDisabled;
  Iterable<String> items;
}

@Component()
class FooComponent extends UiComponent<FooProps> {
  @override
  Map getDefaultProps() => (newProps()
  // Cascade default props here
    ..isDisabled = false
    ..items = []
  );

  @override
  render() {
    return Dom.h1()('Hello world!');
  }
}