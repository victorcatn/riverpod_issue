// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bug_test.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Event {
  EventType get type => throw _privateConstructorUsedError;
  ProviderBase<Object?> get provider => throw _privateConstructorUsedError;
  Object? get value => throw _privateConstructorUsedError;
}

/// @nodoc

class _$_Event implements _Event {
  const _$_Event({required this.type, required this.provider, this.value});

  @override
  final EventType type;
  @override
  final ProviderBase<Object?> provider;
  @override
  final Object? value;

  @override
  String toString() {
    return 'Event(type: $type, provider: $provider, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Event &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, type, provider, const DeepCollectionEquality().hash(value));
}

abstract class _Event implements Event {
  const factory _Event(
      {required final EventType type,
      required final ProviderBase<Object?> provider,
      final Object? value}) = _$_Event;

  @override
  EventType get type;
  @override
  ProviderBase<Object?> get provider;
  @override
  Object? get value;
}
