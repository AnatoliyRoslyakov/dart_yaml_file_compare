// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'key_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$KeyListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String file1, String file2) create,
    required TResult Function(int index) press,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String file1, String file2)? create,
    TResult? Function(int index)? press,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String file1, String file2)? create,
    TResult Function(int index)? press,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateKeyListEvent value) create,
    required TResult Function(PressKeyListEvent value) press,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateKeyListEvent value)? create,
    TResult? Function(PressKeyListEvent value)? press,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateKeyListEvent value)? create,
    TResult Function(PressKeyListEvent value)? press,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeyListEventCopyWith<$Res> {
  factory $KeyListEventCopyWith(
          KeyListEvent value, $Res Function(KeyListEvent) then) =
      _$KeyListEventCopyWithImpl<$Res, KeyListEvent>;
}

/// @nodoc
class _$KeyListEventCopyWithImpl<$Res, $Val extends KeyListEvent>
    implements $KeyListEventCopyWith<$Res> {
  _$KeyListEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CreateKeyListEventCopyWith<$Res> {
  factory _$$CreateKeyListEventCopyWith(_$CreateKeyListEvent value,
          $Res Function(_$CreateKeyListEvent) then) =
      __$$CreateKeyListEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String file1, String file2});
}

/// @nodoc
class __$$CreateKeyListEventCopyWithImpl<$Res>
    extends _$KeyListEventCopyWithImpl<$Res, _$CreateKeyListEvent>
    implements _$$CreateKeyListEventCopyWith<$Res> {
  __$$CreateKeyListEventCopyWithImpl(
      _$CreateKeyListEvent _value, $Res Function(_$CreateKeyListEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file1 = null,
    Object? file2 = null,
  }) {
    return _then(_$CreateKeyListEvent(
      null == file1
          ? _value.file1
          : file1 // ignore: cast_nullable_to_non_nullable
              as String,
      null == file2
          ? _value.file2
          : file2 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CreateKeyListEvent extends CreateKeyListEvent
    with DiagnosticableTreeMixin {
  const _$CreateKeyListEvent(this.file1, this.file2) : super._();

  @override
  final String file1;
  @override
  final String file2;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'KeyListEvent.create(file1: $file1, file2: $file2)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'KeyListEvent.create'))
      ..add(DiagnosticsProperty('file1', file1))
      ..add(DiagnosticsProperty('file2', file2));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateKeyListEvent &&
            (identical(other.file1, file1) || other.file1 == file1) &&
            (identical(other.file2, file2) || other.file2 == file2));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file1, file2);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateKeyListEventCopyWith<_$CreateKeyListEvent> get copyWith =>
      __$$CreateKeyListEventCopyWithImpl<_$CreateKeyListEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String file1, String file2) create,
    required TResult Function(int index) press,
  }) {
    return create(file1, file2);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String file1, String file2)? create,
    TResult? Function(int index)? press,
  }) {
    return create?.call(file1, file2);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String file1, String file2)? create,
    TResult Function(int index)? press,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(file1, file2);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateKeyListEvent value) create,
    required TResult Function(PressKeyListEvent value) press,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateKeyListEvent value)? create,
    TResult? Function(PressKeyListEvent value)? press,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateKeyListEvent value)? create,
    TResult Function(PressKeyListEvent value)? press,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class CreateKeyListEvent extends KeyListEvent {
  const factory CreateKeyListEvent(final String file1, final String file2) =
      _$CreateKeyListEvent;
  const CreateKeyListEvent._() : super._();

  String get file1;
  String get file2;
  @JsonKey(ignore: true)
  _$$CreateKeyListEventCopyWith<_$CreateKeyListEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PressKeyListEventCopyWith<$Res> {
  factory _$$PressKeyListEventCopyWith(
          _$PressKeyListEvent value, $Res Function(_$PressKeyListEvent) then) =
      __$$PressKeyListEventCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$PressKeyListEventCopyWithImpl<$Res>
    extends _$KeyListEventCopyWithImpl<$Res, _$PressKeyListEvent>
    implements _$$PressKeyListEventCopyWith<$Res> {
  __$$PressKeyListEventCopyWithImpl(
      _$PressKeyListEvent _value, $Res Function(_$PressKeyListEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$PressKeyListEvent(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PressKeyListEvent extends PressKeyListEvent
    with DiagnosticableTreeMixin {
  const _$PressKeyListEvent(this.index) : super._();

  @override
  final int index;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'KeyListEvent.press(index: $index)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'KeyListEvent.press'))
      ..add(DiagnosticsProperty('index', index));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PressKeyListEvent &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PressKeyListEventCopyWith<_$PressKeyListEvent> get copyWith =>
      __$$PressKeyListEventCopyWithImpl<_$PressKeyListEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String file1, String file2) create,
    required TResult Function(int index) press,
  }) {
    return press(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String file1, String file2)? create,
    TResult? Function(int index)? press,
  }) {
    return press?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String file1, String file2)? create,
    TResult Function(int index)? press,
    required TResult orElse(),
  }) {
    if (press != null) {
      return press(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateKeyListEvent value) create,
    required TResult Function(PressKeyListEvent value) press,
  }) {
    return press(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateKeyListEvent value)? create,
    TResult? Function(PressKeyListEvent value)? press,
  }) {
    return press?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateKeyListEvent value)? create,
    TResult Function(PressKeyListEvent value)? press,
    required TResult orElse(),
  }) {
    if (press != null) {
      return press(this);
    }
    return orElse();
  }
}

abstract class PressKeyListEvent extends KeyListEvent {
  const factory PressKeyListEvent(final int index) = _$PressKeyListEvent;
  const PressKeyListEvent._() : super._();

  int get index;
  @JsonKey(ignore: true)
  _$$PressKeyListEventCopyWith<_$PressKeyListEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$KeyListState {
  List<dynamic> get keyList => throw _privateConstructorUsedError;
  List<dynamic> get colorList => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<dynamic> get newColorList => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<dynamic> keyList, List<dynamic> colorList,
            String title, List<dynamic> newColorList, int index)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<dynamic> keyList, List<dynamic> colorList,
            String title, List<dynamic> newColorList, int index)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<dynamic> keyList, List<dynamic> colorList,
            String title, List<dynamic> newColorList, int index)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialKeyListState value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialKeyListState value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialKeyListState value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $KeyListStateCopyWith<KeyListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeyListStateCopyWith<$Res> {
  factory $KeyListStateCopyWith(
          KeyListState value, $Res Function(KeyListState) then) =
      _$KeyListStateCopyWithImpl<$Res, KeyListState>;
  @useResult
  $Res call(
      {List<dynamic> keyList,
      List<dynamic> colorList,
      String title,
      List<dynamic> newColorList,
      int index});
}

/// @nodoc
class _$KeyListStateCopyWithImpl<$Res, $Val extends KeyListState>
    implements $KeyListStateCopyWith<$Res> {
  _$KeyListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyList = null,
    Object? colorList = null,
    Object? title = null,
    Object? newColorList = null,
    Object? index = null,
  }) {
    return _then(_value.copyWith(
      keyList: null == keyList
          ? _value.keyList
          : keyList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      colorList: null == colorList
          ? _value.colorList
          : colorList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      newColorList: null == newColorList
          ? _value.newColorList
          : newColorList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialKeyListStateCopyWith<$Res>
    implements $KeyListStateCopyWith<$Res> {
  factory _$$InitialKeyListStateCopyWith(_$InitialKeyListState value,
          $Res Function(_$InitialKeyListState) then) =
      __$$InitialKeyListStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<dynamic> keyList,
      List<dynamic> colorList,
      String title,
      List<dynamic> newColorList,
      int index});
}

/// @nodoc
class __$$InitialKeyListStateCopyWithImpl<$Res>
    extends _$KeyListStateCopyWithImpl<$Res, _$InitialKeyListState>
    implements _$$InitialKeyListStateCopyWith<$Res> {
  __$$InitialKeyListStateCopyWithImpl(
      _$InitialKeyListState _value, $Res Function(_$InitialKeyListState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyList = null,
    Object? colorList = null,
    Object? title = null,
    Object? newColorList = null,
    Object? index = null,
  }) {
    return _then(_$InitialKeyListState(
      null == keyList
          ? _value._keyList
          : keyList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      null == colorList
          ? _value._colorList
          : colorList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      null == newColorList
          ? _value._newColorList
          : newColorList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$InitialKeyListState extends InitialKeyListState
    with DiagnosticableTreeMixin {
  const _$InitialKeyListState(
      final List<dynamic> keyList,
      final List<dynamic> colorList,
      this.title,
      final List<dynamic> newColorList,
      this.index)
      : _keyList = keyList,
        _colorList = colorList,
        _newColorList = newColorList,
        super._();

  final List<dynamic> _keyList;
  @override
  List<dynamic> get keyList {
    if (_keyList is EqualUnmodifiableListView) return _keyList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keyList);
  }

  final List<dynamic> _colorList;
  @override
  List<dynamic> get colorList {
    if (_colorList is EqualUnmodifiableListView) return _colorList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_colorList);
  }

  @override
  final String title;
  final List<dynamic> _newColorList;
  @override
  List<dynamic> get newColorList {
    if (_newColorList is EqualUnmodifiableListView) return _newColorList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newColorList);
  }

  @override
  final int index;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'KeyListState.initial(keyList: $keyList, colorList: $colorList, title: $title, newColorList: $newColorList, index: $index)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'KeyListState.initial'))
      ..add(DiagnosticsProperty('keyList', keyList))
      ..add(DiagnosticsProperty('colorList', colorList))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('newColorList', newColorList))
      ..add(DiagnosticsProperty('index', index));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialKeyListState &&
            const DeepCollectionEquality().equals(other._keyList, _keyList) &&
            const DeepCollectionEquality()
                .equals(other._colorList, _colorList) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other._newColorList, _newColorList) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_keyList),
      const DeepCollectionEquality().hash(_colorList),
      title,
      const DeepCollectionEquality().hash(_newColorList),
      index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialKeyListStateCopyWith<_$InitialKeyListState> get copyWith =>
      __$$InitialKeyListStateCopyWithImpl<_$InitialKeyListState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<dynamic> keyList, List<dynamic> colorList,
            String title, List<dynamic> newColorList, int index)
        initial,
  }) {
    return initial(keyList, colorList, title, newColorList, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<dynamic> keyList, List<dynamic> colorList,
            String title, List<dynamic> newColorList, int index)?
        initial,
  }) {
    return initial?.call(keyList, colorList, title, newColorList, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<dynamic> keyList, List<dynamic> colorList,
            String title, List<dynamic> newColorList, int index)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(keyList, colorList, title, newColorList, index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialKeyListState value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialKeyListState value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialKeyListState value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialKeyListState extends KeyListState {
  const factory InitialKeyListState(
      final List<dynamic> keyList,
      final List<dynamic> colorList,
      final String title,
      final List<dynamic> newColorList,
      final int index) = _$InitialKeyListState;
  const InitialKeyListState._() : super._();

  @override
  List<dynamic> get keyList;
  @override
  List<dynamic> get colorList;
  @override
  String get title;
  @override
  List<dynamic> get newColorList;
  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$InitialKeyListStateCopyWith<_$InitialKeyListState> get copyWith =>
      throw _privateConstructorUsedError;
}
