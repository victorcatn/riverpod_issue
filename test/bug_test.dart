import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:riverpod_family_bug/myapp.dart';

part 'bug_test.freezed.dart';

void main() {
  testWidgets('3 nested provider scopes with autodisposable family test',
      (tester) async {
    final observer1 = MockProviderObserver();

    await tester.pumpWidget(
      ProviderScope(
        observers: [observer1],
        child: const ProviderScope(
          child: ProviderScope(
            child: MyApp(),
          ),
        ),
      ),
    );
    await tester.pump();
    await executeActions(tester);
    await disposeWidgetTree(tester);

    final observer2 = MockProviderObserver();

    await tester.pumpWidget(
      ProviderScope(
        observers: [observer2],
        child: const MyApp(),
      ),
    );
    await tester.pump();
    await executeActions(tester);
    await disposeWidgetTree(tester);

    expect(observer1.events, observer2.events);
  });
}

Future<void> executeActions(WidgetTester tester) async {
  await tester.enterText(find.byType(TextField), 'b');
  await tester.testTextInput.receiveAction(TextInputAction.done);
  await tester.pump();

  await tester.enterText(find.byType(TextField), 'a');
  await tester.testTextInput.receiveAction(TextInputAction.done);
  await tester.pump();

  await tester.enterText(find.byType(TextField), 'b');
  await tester.testTextInput.receiveAction(TextInputAction.done);
  await tester.pump();
}

Future<void> disposeWidgetTree(WidgetTester tester) async {
  await tester.pumpWidget(const SizedBox.shrink());
  await tester.pump();
}

enum EventType {
  add,
  update,
  dispose;
}

@Freezed(copyWith: false)
class Event with _$Event {
  const factory Event({
    required EventType type,
    required ProviderBase<Object?> provider,
    Object? value,
  }) = _Event;
}

class MockProviderObserver extends ProviderObserver {
  final List<Event> events = [];
  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    events.add(Event(type: EventType.add, provider: provider, value: value));
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {}

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    events.add(
        Event(type: EventType.update, provider: provider, value: newValue));
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    events.add(Event(type: EventType.dispose, provider: provider));
  }
}
