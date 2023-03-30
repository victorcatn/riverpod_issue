import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'myapp.dart';

void main() {
  runApp(
    const ProviderScope(
      observers: [MyObserver()],
      child: ProviderScope(
        child: ProviderScope(
          child: MyApp(),
        ),
      ),
    ),
  );
}

class MyObserver extends ProviderObserver {
  const MyObserver();
  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    print('add: $provider, value: $value');
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    print('fail: $provider');
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    print('update: $provider, prev:$previousValue - new: $newValue');
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    print('dispose: $provider');
  }
}
