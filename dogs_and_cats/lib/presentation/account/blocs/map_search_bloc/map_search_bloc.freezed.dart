// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MapSearchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSearchResult,
    required TResult Function(Point point) pointChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSearchResult,
    TResult? Function(Point point)? pointChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSearchResult,
    TResult Function(Point point)? pointChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSearchResult value) getSearchResult,
    required TResult Function(_PointChanged value) pointChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSearchResult value)? getSearchResult,
    TResult? Function(_PointChanged value)? pointChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSearchResult value)? getSearchResult,
    TResult Function(_PointChanged value)? pointChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapSearchEventCopyWith<$Res> {
  factory $MapSearchEventCopyWith(
          MapSearchEvent value, $Res Function(MapSearchEvent) then) =
      _$MapSearchEventCopyWithImpl<$Res, MapSearchEvent>;
}

/// @nodoc
class _$MapSearchEventCopyWithImpl<$Res, $Val extends MapSearchEvent>
    implements $MapSearchEventCopyWith<$Res> {
  _$MapSearchEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MapSearchEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetSearchResultImplCopyWith<$Res> {
  factory _$$GetSearchResultImplCopyWith(_$GetSearchResultImpl value,
          $Res Function(_$GetSearchResultImpl) then) =
      __$$GetSearchResultImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetSearchResultImplCopyWithImpl<$Res>
    extends _$MapSearchEventCopyWithImpl<$Res, _$GetSearchResultImpl>
    implements _$$GetSearchResultImplCopyWith<$Res> {
  __$$GetSearchResultImplCopyWithImpl(
      _$GetSearchResultImpl _value, $Res Function(_$GetSearchResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of MapSearchEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetSearchResultImpl implements _GetSearchResult {
  const _$GetSearchResultImpl();

  @override
  String toString() {
    return 'MapSearchEvent.getSearchResult()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetSearchResultImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSearchResult,
    required TResult Function(Point point) pointChanged,
  }) {
    return getSearchResult();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSearchResult,
    TResult? Function(Point point)? pointChanged,
  }) {
    return getSearchResult?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSearchResult,
    TResult Function(Point point)? pointChanged,
    required TResult orElse(),
  }) {
    if (getSearchResult != null) {
      return getSearchResult();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSearchResult value) getSearchResult,
    required TResult Function(_PointChanged value) pointChanged,
  }) {
    return getSearchResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSearchResult value)? getSearchResult,
    TResult? Function(_PointChanged value)? pointChanged,
  }) {
    return getSearchResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSearchResult value)? getSearchResult,
    TResult Function(_PointChanged value)? pointChanged,
    required TResult orElse(),
  }) {
    if (getSearchResult != null) {
      return getSearchResult(this);
    }
    return orElse();
  }
}

abstract class _GetSearchResult implements MapSearchEvent {
  const factory _GetSearchResult() = _$GetSearchResultImpl;
}

/// @nodoc
abstract class _$$PointChangedImplCopyWith<$Res> {
  factory _$$PointChangedImplCopyWith(
          _$PointChangedImpl value, $Res Function(_$PointChangedImpl) then) =
      __$$PointChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Point point});
}

/// @nodoc
class __$$PointChangedImplCopyWithImpl<$Res>
    extends _$MapSearchEventCopyWithImpl<$Res, _$PointChangedImpl>
    implements _$$PointChangedImplCopyWith<$Res> {
  __$$PointChangedImplCopyWithImpl(
      _$PointChangedImpl _value, $Res Function(_$PointChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of MapSearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? point = null,
  }) {
    return _then(_$PointChangedImpl(
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as Point,
    ));
  }
}

/// @nodoc

class _$PointChangedImpl implements _PointChanged {
  const _$PointChangedImpl({required this.point});

  @override
  final Point point;

  @override
  String toString() {
    return 'MapSearchEvent.pointChanged(point: $point)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointChangedImpl &&
            (identical(other.point, point) || other.point == point));
  }

  @override
  int get hashCode => Object.hash(runtimeType, point);

  /// Create a copy of MapSearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PointChangedImplCopyWith<_$PointChangedImpl> get copyWith =>
      __$$PointChangedImplCopyWithImpl<_$PointChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSearchResult,
    required TResult Function(Point point) pointChanged,
  }) {
    return pointChanged(point);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSearchResult,
    TResult? Function(Point point)? pointChanged,
  }) {
    return pointChanged?.call(point);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSearchResult,
    TResult Function(Point point)? pointChanged,
    required TResult orElse(),
  }) {
    if (pointChanged != null) {
      return pointChanged(point);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSearchResult value) getSearchResult,
    required TResult Function(_PointChanged value) pointChanged,
  }) {
    return pointChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSearchResult value)? getSearchResult,
    TResult? Function(_PointChanged value)? pointChanged,
  }) {
    return pointChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSearchResult value)? getSearchResult,
    TResult Function(_PointChanged value)? pointChanged,
    required TResult orElse(),
  }) {
    if (pointChanged != null) {
      return pointChanged(this);
    }
    return orElse();
  }
}

abstract class _PointChanged implements MapSearchEvent {
  const factory _PointChanged({required final Point point}) =
      _$PointChangedImpl;

  Point get point;

  /// Create a copy of MapSearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PointChangedImplCopyWith<_$PointChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MapSearchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SearchResponseItem> results) success,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SearchResponseItem> results)? success,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SearchResponseItem> results)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapSearchStateCopyWith<$Res> {
  factory $MapSearchStateCopyWith(
          MapSearchState value, $Res Function(MapSearchState) then) =
      _$MapSearchStateCopyWithImpl<$Res, MapSearchState>;
}

/// @nodoc
class _$MapSearchStateCopyWithImpl<$Res, $Val extends MapSearchState>
    implements $MapSearchStateCopyWith<$Res> {
  _$MapSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MapSearchState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$MapSearchStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of MapSearchState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'MapSearchState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SearchResponseItem> results) success,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SearchResponseItem> results)? success,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SearchResponseItem> results)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements MapSearchState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$MapSearchStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of MapSearchState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'MapSearchState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SearchResponseItem> results) success,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SearchResponseItem> results)? success,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SearchResponseItem> results)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements MapSearchState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SearchResponseItem> results});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$MapSearchStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of MapSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
  }) {
    return _then(_$SuccessImpl(
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<SearchResponseItem>,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl({required final List<SearchResponseItem> results})
      : _results = results;

  final List<SearchResponseItem> _results;
  @override
  List<SearchResponseItem> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'MapSearchState.success(results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_results));

  /// Create a copy of MapSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SearchResponseItem> results) success,
    required TResult Function(String message) failure,
  }) {
    return success(results);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SearchResponseItem> results)? success,
    TResult? Function(String message)? failure,
  }) {
    return success?.call(results);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SearchResponseItem> results)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(results);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements MapSearchState {
  const factory _Success({required final List<SearchResponseItem> results}) =
      _$SuccessImpl;

  List<SearchResponseItem> get results;

  /// Create a copy of MapSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$MapSearchStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of MapSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'MapSearchState.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of MapSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SearchResponseItem> results) success,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SearchResponseItem> results)? success,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SearchResponseItem> results)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements MapSearchState {
  const factory _Failure({required final String message}) = _$FailureImpl;

  String get message;

  /// Create a copy of MapSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
