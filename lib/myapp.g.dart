// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'myapp.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$myFamilyHash() => r'01fb623d4c7e2c5d36077affefae076eff557352';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef MyFamilyRef = AutoDisposeProviderRef<String>;

/// See also [myFamily].
@ProviderFor(myFamily)
const myFamilyProvider = MyFamilyFamily();

/// See also [myFamily].
class MyFamilyFamily extends Family<String> {
  /// See also [myFamily].
  const MyFamilyFamily();

  /// See also [myFamily].
  MyFamilyProvider call(
    String frozen,
  ) {
    return MyFamilyProvider(
      frozen,
    );
  }

  @override
  MyFamilyProvider getProviderOverride(
    covariant MyFamilyProvider provider,
  ) {
    return call(
      provider.frozen,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'myFamilyProvider';
}

/// See also [myFamily].
class MyFamilyProvider extends AutoDisposeProvider<String> {
  /// See also [myFamily].
  MyFamilyProvider(
    this.frozen,
  ) : super.internal(
          (ref) => myFamily(
            ref,
            frozen,
          ),
          from: myFamilyProvider,
          name: r'myFamilyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$myFamilyHash,
          dependencies: MyFamilyFamily._dependencies,
          allTransitiveDependencies: MyFamilyFamily._allTransitiveDependencies,
        );

  final String frozen;

  @override
  bool operator ==(Object other) {
    return other is MyFamilyProvider && other.frozen == frozen;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, frozen.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
