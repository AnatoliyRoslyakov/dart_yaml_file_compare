// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'value_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ValueEvent {
  String get file1 => throw _privateConstructorUsedError;
  String get file2 => throw _privateConstructorUsedError;
  String get keyIndex => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String file1, String file2, String keyIndex)
        create,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String file1, String file2, String keyIndex)? create,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String file1, String file2, String keyIndex)? create,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateValueEvent value) create,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateValueEvent value)? create,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateValueEvent value)? create,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ValueEventCopyWith<ValueEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValueEventCopyWith<$Res> {
  factory $ValueEventCopyWith(
          ValueEvent value, $Res Function(ValueEvent) then) =
      _$ValueEventCopyWithImpl<$Res, ValueEvent>;
  @useResult
  $Res call({String file1, String file2, String keyIndex});
}

/// @nodoc
class _$ValueEventCopyWithImpl<$Res, $Val extends ValueEvent>
    implements $ValueEventCopyWith<$Res> {
  _$ValueEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file1 = null,
    Object? file2 = null,
    Object? keyIndex = null,
  }) {
    return _then(_value.copyWith(
      file1: null == file1
          ? _value.file1
          : file1 // ignore: cast_nullable_to_non_nullable
              as String,
      file2: null == file2
          ? _value.file2
          : file2 // ignore: cast_nullable_to_non_nullable
              as String,
      keyIndex: null == keyIndex
          ? _value.keyIndex
          : keyIndex // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateValueEventCopyWith<$Res>
    implements $ValueEventCopyWith<$Res> {
  factory _$$CreateValueEventCopyWith(
          _$CreateValueEvent value, $Res Function(_$CreateValueEvent) then) =
      __$$CreateValueEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String file1, String file2, String keyIndex});
}

/// @nodoc
class __$$CreateValueEventCopyWithImpl<$Res>
    extends _$ValueEventCopyWithImpl<$Res, _$CreateValueEvent>
    implements _$$CreateValueEventCopyWith<$Res> {
  __$$CreateValueEventCopyWithImpl(
      _$CreateValueEvent _value, $Res Function(_$CreateValueEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file1 = null,
    Object? file2 = null,
    Object? keyIndex = null,
  }) {
    return _then(_$CreateValueEvent(
      null == file1
          ? _value.file1
          : file1 // ignore: cast_nullable_to_non_nullable
              as String,
      null == file2
          ? _value.file2
          : file2 // ignore: cast_nullable_to_non_nullable
              as String,
      null == keyIndex
          ? _value.keyIndex
          : keyIndex // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CreateValueEvent extends CreateValueEvent with DiagnosticableTreeMixin {
  const _$CreateValueEvent(this.file1, this.file2, this.keyIndex) : super._();

  @override
  final String file1;
  @override
  final String file2;
  @override
  final String keyIndex;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValueEvent.create(file1: $file1, file2: $file2, keyIndex: $keyIndex)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValueEvent.create'))
      ..add(DiagnosticsProperty('file1', file1))
      ..add(DiagnosticsProperty('file2', file2))
      ..add(DiagnosticsProperty('keyIndex', keyIndex));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateValueEvent &&
            (identical(other.file1, file1) || other.file1 == file1) &&
            (identical(other.file2, file2) || other.file2 == file2) &&
            (identical(other.keyIndex, keyIndex) ||
                other.keyIndex == keyIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file1, file2, keyIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateValueEventCopyWith<_$CreateValueEvent> get copyWith =>
      __$$CreateValueEventCopyWithImpl<_$CreateValueEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String file1, String file2, String keyIndex)
        create,
  }) {
    return create(file1, file2, keyIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String file1, String file2, String keyIndex)? create,
  }) {
    return create?.call(file1, file2, keyIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String file1, String file2, String keyIndex)? create,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(file1, file2, keyIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateValueEvent value) create,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateValueEvent value)? create,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateValueEvent value)? create,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class CreateValueEvent extends ValueEvent {
  const factory CreateValueEvent(
          final String file1, final String file2, final String keyIndex) =
      _$CreateValueEvent;
  const CreateValueEvent._() : super._();

  @override
  String get file1;
  @override
  String get file2;
  @override
  String get keyIndex;
  @override
  @JsonKey(ignore: true)
  _$$CreateValueEventCopyWith<_$CreateValueEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ValueState {
  List<String> get lines1 => throw _privateConstructorUsedError;
  List<String> get lines2 => throw _privateConstructorUsedError;
  List<Color> get colorList1 => throw _privateConstructorUsedError;
  List<Color> get colorList2 => throw _privateConstructorUsedError;
  String get value1 => throw _privateConstructorUsedError;
  String get value2 => throw _privateConstructorUsedError;
  String get keyIndex => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<String> lines1,
            List<String> lines2,
            List<Color> colorList1,
            List<Color> colorList2,
            String value1,
            String value2,
            String keyIndex)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<String> lines1,
            List<String> lines2,
            List<Color> colorList1,
            List<Color> colorList2,
            String value1,
            String value2,
            String keyIndex)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<String> lines1,
            List<String> lines2,
            List<Color> colorList1,
            List<Color> colorList2,
            String value1,
            String value2,
            String keyIndex)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialValueState value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialValueState value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialValueState value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ValueStateCopyWith<ValueState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValueStateCopyWith<$Res> {
  factory $ValueStateCopyWith(
          ValueState value, $Res Function(ValueState) then) =
      _$ValueStateCopyWithImpl<$Res, ValueState>;
  @useResult
  $Res call(
      {List<String> lines1,
      List<String> lines2,
      List<Color> colorList1,
      List<Color> colorList2,
      String value1,
      String value2,
      String keyIndex});
}

/// @nodoc
class _$ValueStateCopyWithImpl<$Res, $Val extends ValueState>
    implements $ValueStateCopyWith<$Res> {
  _$ValueStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lines1 = null,
    Object? lines2 = null,
    Object? colorList1 = null,
    Object? colorList2 = null,
    Object? value1 = null,
    Object? value2 = null,
    Object? keyIndex = null,
  }) {
    return _then(_value.copyWith(
      lines1: null == lines1
          ? _value.lines1
          : lines1 // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lines2: null == lines2
          ? _value.lines2
          : lines2 // ignore: cast_nullable_to_non_nullable
              as List<String>,
      colorList1: null == colorList1
          ? _value.colorList1
          : colorList1 // ignore: cast_nullable_to_non_nullable
              as List<Color>,
      colorList2: null == colorList2
          ? _value.colorList2
          : colorList2 // ignore: cast_nullable_to_non_nullable
              as List<Color>,
      value1: null == value1
          ? _value.value1
          : value1 // ignore: cast_nullable_to_non_nullable
              as String,
      value2: null == value2
          ? _value.value2
          : value2 // ignore: cast_nullable_to_non_nullable
              as String,
      keyIndex: null == keyIndex
          ? _value.keyIndex
          : keyIndex // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialValueStateCopyWith<$Res>
    implements $ValueStateCopyWith<$Res> {
  factory _$$InitialValueStateCopyWith(
          _$InitialValueState value, $Res Function(_$InitialValueState) then) =
      __$$InitialValueStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> lines1,
      List<String> lines2,
      List<Color> colorList1,
      List<Color> colorList2,
      String value1,
      String value2,
      String keyIndex});
}

/// @nodoc
class __$$InitialValueStateCopyWithImpl<$Res>
    extends _$ValueStateCopyWithImpl<$Res, _$InitialValueState>
    implements _$$InitialValueStateCopyWith<$Res> {
  __$$InitialValueStateCopyWithImpl(
      _$InitialValueState _value, $Res Function(_$InitialValueState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lines1 = null,
    Object? lines2 = null,
    Object? colorList1 = null,
    Object? colorList2 = null,
    Object? value1 = null,
    Object? value2 = null,
    Object? keyIndex = null,
  }) {
    return _then(_$InitialValueState(
      null == lines1
          ? _value._lines1
          : lines1 // ignore: cast_nullable_to_non_nullable
              as List<String>,
      null == lines2
          ? _value._lines2
          : lines2 // ignore: cast_nullable_to_non_nullable
              as List<String>,
      null == colorList1
          ? _value._colorList1
          : colorList1 // ignore: cast_nullable_to_non_nullable
              as List<Color>,
      null == colorList2
          ? _value._colorList2
          : colorList2 // ignore: cast_nullable_to_non_nullable
              as List<Color>,
      null == value1
          ? _value.value1
          : value1 // ignore: cast_nullable_to_non_nullable
              as String,
      null == value2
          ? _value.value2
          : value2 // ignore: cast_nullable_to_non_nullable
              as String,
      null == keyIndex
          ? _value.keyIndex
          : keyIndex // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InitialValueState extends InitialValueState
    with DiagnosticableTreeMixin {
  const _$InitialValueState(
      final List<String> lines1,
      final List<String> lines2,
      final List<Color> colorList1,
      final List<Color> colorList2,
      this.value1,
      this.value2,
      this.keyIndex)
      : _lines1 = lines1,
        _lines2 = lines2,
        _colorList1 = colorList1,
        _colorList2 = colorList2,
        super._();

  final List<String> _lines1;
  @override
  List<String> get lines1 {
    if (_lines1 is EqualUnmodifiableListView) return _lines1;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lines1);
  }

  final List<String> _lines2;
  @override
  List<String> get lines2 {
    if (_lines2 is EqualUnmodifiableListView) return _lines2;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lines2);
  }

  final List<Color> _colorList1;
  @override
  List<Color> get colorList1 {
    if (_colorList1 is EqualUnmodifiableListView) return _colorList1;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_colorList1);
  }

  final List<Color> _colorList2;
  @override
  List<Color> get colorList2 {
    if (_colorList2 is EqualUnmodifiableListView) return _colorList2;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_colorList2);
  }

  @override
  final String value1;
  @override
  final String value2;
  @override
  final String keyIndex;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValueState.initial(lines1: $lines1, lines2: $lines2, colorList1: $colorList1, colorList2: $colorList2, value1: $value1, value2: $value2, keyIndex: $keyIndex)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValueState.initial'))
      ..add(DiagnosticsProperty('lines1', lines1))
      ..add(DiagnosticsProperty('lines2', lines2))
      ..add(DiagnosticsProperty('colorList1', colorList1))
      ..add(DiagnosticsProperty('colorList2', colorList2))
      ..add(DiagnosticsProperty('value1', value1))
      ..add(DiagnosticsProperty('value2', value2))
      ..add(DiagnosticsProperty('keyIndex', keyIndex));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialValueState &&
            const DeepCollectionEquality().equals(other._lines1, _lines1) &&
            const DeepCollectionEquality().equals(other._lines2, _lines2) &&
            const DeepCollectionEquality()
                .equals(other._colorList1, _colorList1) &&
            const DeepCollectionEquality()
                .equals(other._colorList2, _colorList2) &&
            (identical(other.value1, value1) || other.value1 == value1) &&
            (identical(other.value2, value2) || other.value2 == value2) &&
            (identical(other.keyIndex, keyIndex) ||
                other.keyIndex == keyIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_lines1),
      const DeepCollectionEquality().hash(_lines2),
      const DeepCollectionEquality().hash(_colorList1),
      const DeepCollectionEquality().hash(_colorList2),
      value1,
      value2,
      keyIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialValueStateCopyWith<_$InitialValueState> get copyWith =>
      __$$InitialValueStateCopyWithImpl<_$InitialValueState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<String> lines1,
            List<String> lines2,
            List<Color> colorList1,
            List<Color> colorList2,
            String value1,
            String value2,
            String keyIndex)
        initial,
  }) {
    return initial(
        lines1, lines2, colorList1, colorList2, value1, value2, keyIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<String> lines1,
            List<String> lines2,
            List<Color> colorList1,
            List<Color> colorList2,
            String value1,
            String value2,
            String keyIndex)?
        initial,
  }) {
    return initial?.call(
        lines1, lines2, colorList1, colorList2, value1, value2, keyIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<String> lines1,
            List<String> lines2,
            List<Color> colorList1,
            List<Color> colorList2,
            String value1,
            String value2,
            String keyIndex)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(
          lines1, lines2, colorList1, colorList2, value1, value2, keyIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialValueState value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialValueState value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialValueState value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialValueState extends ValueState {
  const factory InitialValueState(
      final List<String> lines1,
      final List<String> lines2,
      final List<Color> colorList1,
      final List<Color> colorList2,
      final String value1,
      final String value2,
      final String keyIndex) = _$InitialValueState;
  const InitialValueState._() : super._();

  @override
  List<String> get lines1;
  @override
  List<String> get lines2;
  @override
  List<Color> get colorList1;
  @override
  List<Color> get colorList2;
  @override
  String get value1;
  @override
  String get value2;
  @override
  String get keyIndex;
  @override
  @JsonKey(ignore: true)
  _$$InitialValueStateCopyWith<_$InitialValueState> get copyWith =>
      throw _privateConstructorUsedError;
}
