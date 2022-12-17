// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ingame.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InGame {
// The list of numbers on the pad
  List<int> get source =>
      throw _privateConstructorUsedError; // The list of indices of sources which are disabled because they appear in
// an equation
  List<int> get disabledSources =>
      throw _privateConstructorUsedError; // The target which is used to determine the win condition
  int get target =>
      throw _privateConstructorUsedError; // Displays previous equations
  List<String> get equations =>
      throw _privateConstructorUsedError; // Displays the current equation
  String get prompt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InGameCopyWith<InGame> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InGameCopyWith<$Res> {
  factory $InGameCopyWith(InGame value, $Res Function(InGame) then) =
      _$InGameCopyWithImpl<$Res, InGame>;
  @useResult
  $Res call(
      {List<int> source,
      List<int> disabledSources,
      int target,
      List<String> equations,
      String prompt});
}

/// @nodoc
class _$InGameCopyWithImpl<$Res, $Val extends InGame>
    implements $InGameCopyWith<$Res> {
  _$InGameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? disabledSources = null,
    Object? target = null,
    Object? equations = null,
    Object? prompt = null,
  }) {
    return _then(_value.copyWith(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as List<int>,
      disabledSources: null == disabledSources
          ? _value.disabledSources
          : disabledSources // ignore: cast_nullable_to_non_nullable
              as List<int>,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as int,
      equations: null == equations
          ? _value.equations
          : equations // ignore: cast_nullable_to_non_nullable
              as List<String>,
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InGameCopyWith<$Res> implements $InGameCopyWith<$Res> {
  factory _$$_InGameCopyWith(_$_InGame value, $Res Function(_$_InGame) then) =
      __$$_InGameCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<int> source,
      List<int> disabledSources,
      int target,
      List<String> equations,
      String prompt});
}

/// @nodoc
class __$$_InGameCopyWithImpl<$Res>
    extends _$InGameCopyWithImpl<$Res, _$_InGame>
    implements _$$_InGameCopyWith<$Res> {
  __$$_InGameCopyWithImpl(_$_InGame _value, $Res Function(_$_InGame) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? disabledSources = null,
    Object? target = null,
    Object? equations = null,
    Object? prompt = null,
  }) {
    return _then(_$_InGame(
      source: null == source
          ? _value._source
          : source // ignore: cast_nullable_to_non_nullable
              as List<int>,
      disabledSources: null == disabledSources
          ? _value._disabledSources
          : disabledSources // ignore: cast_nullable_to_non_nullable
              as List<int>,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as int,
      equations: null == equations
          ? _value._equations
          : equations // ignore: cast_nullable_to_non_nullable
              as List<String>,
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_InGame extends _InGame {
  const _$_InGame(
      {required final List<int> source,
      required final List<int> disabledSources,
      required this.target,
      required final List<String> equations,
      required this.prompt})
      : _source = source,
        _disabledSources = disabledSources,
        _equations = equations,
        super._();

// The list of numbers on the pad
  final List<int> _source;
// The list of numbers on the pad
  @override
  List<int> get source {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_source);
  }

// The list of indices of sources which are disabled because they appear in
// an equation
  final List<int> _disabledSources;
// The list of indices of sources which are disabled because they appear in
// an equation
  @override
  List<int> get disabledSources {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_disabledSources);
  }

// The target which is used to determine the win condition
  @override
  final int target;
// Displays previous equations
  final List<String> _equations;
// Displays previous equations
  @override
  List<String> get equations {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_equations);
  }

// Displays the current equation
  @override
  final String prompt;

  @override
  String toString() {
    return 'InGame(source: $source, disabledSources: $disabledSources, target: $target, equations: $equations, prompt: $prompt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InGame &&
            const DeepCollectionEquality().equals(other._source, _source) &&
            const DeepCollectionEquality()
                .equals(other._disabledSources, _disabledSources) &&
            (identical(other.target, target) || other.target == target) &&
            const DeepCollectionEquality()
                .equals(other._equations, _equations) &&
            (identical(other.prompt, prompt) || other.prompt == prompt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_source),
      const DeepCollectionEquality().hash(_disabledSources),
      target,
      const DeepCollectionEquality().hash(_equations),
      prompt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InGameCopyWith<_$_InGame> get copyWith =>
      __$$_InGameCopyWithImpl<_$_InGame>(this, _$identity);
}

abstract class _InGame extends InGame {
  const factory _InGame(
      {required final List<int> source,
      required final List<int> disabledSources,
      required final int target,
      required final List<String> equations,
      required final String prompt}) = _$_InGame;
  const _InGame._() : super._();

  @override // The list of numbers on the pad
  List<int> get source;
  @override // The list of indices of sources which are disabled because they appear in
// an equation
  List<int> get disabledSources;
  @override // The target which is used to determine the win condition
  int get target;
  @override // Displays previous equations
  List<String> get equations;
  @override // Displays the current equation
  String get prompt;
  @override
  @JsonKey(ignore: true)
  _$$_InGameCopyWith<_$_InGame> get copyWith =>
      throw _privateConstructorUsedError;
}
