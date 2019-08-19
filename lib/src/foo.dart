import 'package:over_react/over_react.dart';
import 'package:todo_dart_react/src/observer.dart';
import 'package:todo_dart_react/src/counter.dart';

part 'foo.over_react.g.dart';

@Factory()
UiFactory<FooProps> Foo = _$Foo;

@Props()
class _$FooProps extends UiProps {
  // Props go here, declared as fields:
  Counter counter;
}

@Component()
class FooComponent extends UiComponent<FooProps> {

  @override
  render() {
    return observer(
      builder: () => Dom.div()(
        Dom.h1()('Hello world! ${props.counter.value}'),
        (Dom.button()..onClick = _onClick)('Submit'),
      ),
    );
  }

  void _onClick(event) {
    props.counter.increment();
    print("onClick");
  }
}
