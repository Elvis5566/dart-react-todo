import 'dart:html';
import 'package:mobx/mobx.dart';
import 'package:over_react/over_react.dart';
import 'package:mobx/src/core.dart' show ReactionImpl;

part 'observer.over_react.g.dart';

ReactElement observer({ElementBuilder builder}) => (Observer()..builder = builder)();

typedef ElementBuilder = ReactElement Function();

@Factory()
UiFactory<ObserverProps> Observer = _$Observer;

@Props()
class _$ObserverProps extends UiProps {
  String name;
  ElementBuilder builder;
  ReactiveContext reactiveContext;
}

@State()
class _$ObserverState extends UiState {
  ReactionImpl reaction;
}

@Component()
class ObserverComponent extends UiStatefulComponent<ObserverProps, ObserverState> {
  @override
  Map getInitialState() => (newState()..reaction = _createReaction(_invalidate));

  @override
  void componentWillUnmount() {
    super.componentWillUnmount();
    state.reaction.dispose();
  }

  @override
  render() {
    ReactElement built;

    state.reaction.track(() {
      built = props.builder();
    });

    if (!state.reaction.hasObservables) {
      print('There are no observables detected in the builder function for ${state.reaction.name}');
    }

    if (state.reaction.errorValue != null) {
      throw state.reaction.errorValue;
    }

    return built;
  }

  void _invalidate() => setState({});

  Reaction _createReaction(Function() onInvalidate) {
    final ctx = props.reactiveContext ?? mainContext;
    return ReactionImpl(ctx, onInvalidate, name: props.name ?? 'Observer@${ctx.nextId}');
  }
}
