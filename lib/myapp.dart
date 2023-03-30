import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'myapp.g.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final family = useState<String>('a');

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              TextField(onSubmitted: (text) => family.value = text),
              Text(ref.watch(myFamilyProvider(family.value))),
            ],
          ),
        ),
      ),
    );
  }
}

@riverpod
String myFamily(Ref ref, String frozen) {
  return '$frozen family';
}
