// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ingame_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InGameState {
// The list of numbers on the pad; initially set from the loaded game
  List<int> get sources =>
      throw _privateConstructorUsedError; // The list of operations on the pad; initially set from the loaded game
  List<String> get operations =>
      throw _privateConstructorUsedError; // The list of indices of sources which are disabled because they appear in
// an equation
  List<int> get disabledSources =>
      throw _privateConstructorUsedError; // The target which is used to determine the win condition
  int get target =>
      throw _privateConstructorUsedError; // Displays previous equations
  List<String> get equations =>
      throw _privateConstructorUsedError; // Displays the current equation
  Map<String, String> get prompt =>
      throw _privateConstructorUsedError; // Whether the game was won
  bool get won => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InGameStateCopyWith<InGameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InGameStateCopyWith<$Res> {
  factory $InGameStateCopyWith(
          InGameState value, $Res Function(InGameState) then) =
      _$InGameStateCopyWithImpl<$Res, InGameState>;
  @useResult
  $Res call(
      {List<int> sources,
      List<String> operations,
      List<int> disabledSources,
      int target,
      List<String> equations,
      Map<String, String> prompt,
      bool won,
      String? error});
}

/// @nodoc
class _$InGameStateCopyWithImpl<$Res, $Val extends InGameState>
    implements $InGameStateCopyWith<$Res> {
  _$InGameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sources = null,
    Object? operations = null,
    Object? disabledSources = null,
    Object? target = null,
    Object? equations = null,
    Object? prompt = null,
    Object? won = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      sources: null == sources
          ? _value.sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<int>,
      operations: null == operations
          ? _value.operations
          : operations // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
              as Map<String, String>,
      won: null == won
          ? _value.won
          : won // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InGameStateCopyWith<$Res>
    implements $InGameStateCopyWith<$Res> {
  factory _$$_InGameStateCopyWith(
          _$_InGameState value, $Res Function(_$_InGameState) then) =
      __$$_InGameStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<int> sources,
      List<String> operations,
      List<int> disabledSources,
      int target,
      List<String> equations,
      Map<String, String> prompt,
      bool won,
      String? error});
}

/// @nodoc
class __$$_InGameStateCopyWithImpl<$Res>
    extends _$InGameStateCopyWithImpl<$Res, _$_InGameState>
    implements _$$_InGameStateCopyWith<$Res> {
  __$$_InGameStateCopyWithImpl(
      _$_InGameState _value, $Res Function(_$_InGameState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sources = null,
    Object? operations = null,
    Object? disabledSources = null,
    Object? target = null,
    Object? equations = null,
    Object? prompt = null,
    Object? won = null,
    Object? error = freezed,
  }) {
    return _then(_$_InGameState(
      sources: null == sources
          ? _value._sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<int>,
      operations: null == operations
          ? _value._operations
          : operations // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
          ? _value._prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      won: null == won
          ? _value.won
          : won // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_InGameState extends _InGameState {
  const _$_InGameState(
      {required final List<int> sources,
      required final List<String> operations,
      final List<int> disabledSources = const [],
      required this.target,
      final List<String> equations = const [],
      final Map<String, String> prompt = const {
        'operand1': '',
        'operand2': '',
        'operation': ''
      },
      this.won = false,
      this.error})
      : _sources = sources,
        _operations = operations,
        _disabledSources = disabledSources,
        _equations = equations,
        _prompt = prompt,
        super._();

// The list of numbers on the pad; initially set from the loaded game
  final List<int> _sources;
// The list of numbers on the pad; initially set from the loaded game
  @override
  List<int> get sources {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sources);
  }

// The list of operations on the pad; initially set from the loaded game
  final List<String> _operations;
// The list of operations on the pad; initially set from the loaded game
  @override
  List<String> get operations {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_operations);
  }

// The list of indices of sources which are disabled because they appear in
// an equation
  final List<int> _disabledSources;
// The list of indices of sources which are disabled because they appear in
// an equation
  @override
  @JsonKey()
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
  @JsonKey()
  List<String> get equations {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_equations);
  }

// Displays the current equation
  final Map<String, String> _prompt;
// Displays the current equation
  @override
  @JsonKey()
  Map<String, String> get prompt {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_prompt);
  }

// Whether the game was won
  @override
  @JsonKey()
  final bool won;
  @override
  final String? error;

  @override
  String toString() {
    return 'InGameState(sources: $sources, operations: $operations, disabledSources: $disabledSources, target: $target, equations: $equations, prompt: $prompt, won: $won, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InGameState &&
            const DeepCollectionEquality().equals(other._sources, _sources) &&
            const DeepCollectionEquality()
                .equals(other._operations, _operations) &&
            const DeepCollectionEquality()
                .equals(other._disabledSources, _disabledSources) &&
            (identical(other.target, target) || other.target == target) &&
            const DeepCollectionEquality()
                .equals(other._equations, _equations) &&
            const DeepCollectionEquality().equals(other._prompt, _prompt) &&
            (identical(other.won, won) || other.won == won) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_sources),
      const DeepCollectionEquality().hash(_operations),
      const DeepCollectionEquality().hash(_disabledSources),
      target,
      const DeepCollectionEquality().hash(_equations),
      const DeepCollectionEquality().hash(_prompt),
      won,
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InGameStateCopyWith<_$_InGameState> get copyWith =>
      __$$_InGameStateCopyWithImpl<_$_InGameState>(this, _$identity);
}

abstract class _InGameState extends InGameState {
  const factory _InGameState(
      {required final List<int> sources,
      required final List<String> operations,
      final List<int> disabledSources,
      required final int target,
      final List<String> equations,
      final Map<String, String> prompt,
      final bool won,
      final String? error}) = _$_InGameState;
  const _InGameState._() : super._();

  @override // The list of numbers on the pad; initially set from the loaded game
  List<int> get sources;
  @override // The list of operations on the pad; initially set from the loaded game
  List<String> get operations;
  @override // The list of indices of sources which are disabled because they appear in
// an equation
  List<int> get disabledSources;
  @override // The target which is used to determine the win condition
  int get target;
  @override // Displays previous equations
  List<String> get equations;
  @override // Displays the current equation
  Map<String, String> get prompt;
  @override // Whether the game was won
  bool get won;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_InGameStateCopyWith<_$_InGameState> get copyWith =>
      throw _privateConstructorUsedError;
}
