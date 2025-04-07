// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_suggest_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MapSuggestEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSuggestResult,
    required TResult Function(String query) queryChanged,
    required TResult Function(VisibleRegion region) regionChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSuggestResult,
    TResult? Function(String query)? queryChanged,
    TResult? Function(VisibleRegion region)? regionChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSuggestResult,
    TResult Function(String query)? queryChanged,
    TResult Function(VisibleRegion region)? regionChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSuggestResult value) getSuggestResult,
    required TResult Function(_QueryChanged value) queryChanged,
    required TResult Function(_RegionChanged value) regionChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSuggestResult value)? getSuggestResult,
    TResult? Function(_QueryChanged value)? queryChanged,
    TResult? Function(_RegionChanged value)? regionChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSuggestResult value)? getSuggestResult,
    TResult Function(_QueryChanged value)? queryChanged,
    TResult Function(_RegionChanged value)? regionChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapSuggestEventCopyWith<$Res> {
  factory $MapSuggestEventCopyWith(
          MapSuggestEvent value, $Res Function(MapSuggestEvent) then) =
      _$MapSuggestEventCopyWithImpl<$Res, MapSuggestEvent>;
}

/// @nodoc
class _$MapSuggestEventCopyWithImpl<$Res, $Val extends MapSuggestEvent>
    implements $MapSuggestEventCopyWith<$Res> {
  _$MapSuggestEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MapSuggestEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetSuggestResultImplCopyWith<$Res> {
  factory _$$GetSuggestResultImplCopyWith(_$GetSuggestResultImpl value,
          $Res Function(_$GetSuggestResultImpl) then) =
      __$$GetSuggestResultImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetSuggestResultImplCopyWithImpl<$Res>
    extends _$MapSuggestEventCopyWithImpl<$Res, _$GetSuggestResultImpl>
    implements _$$GetSuggestResultImplCopyWith<$Res> {
  __$$GetSuggestResultImplCopyWithImpl(_$GetSuggestResultImpl _value,
      $Res Function(_$GetSuggestResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of MapSuggestEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetSuggestResultImpl implements _GetSuggestResult {
  const _$GetSuggestResultImpl();

  @override
  String toString() {
    return 'MapSuggestEvent.getSuggestResult()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetSuggestResultImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSuggestResult,
    required TResult Function(String query) queryChanged,
    required TResult Function(VisibleRegion region) regionChanged,
  }) {
    return getSuggestResult();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSuggestResult,
    TResult? Function(String query)? queryChanged,
    TResult? Function(VisibleRegion region)? regionChanged,
  }) {
    return getSuggestResult?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSuggestResult,
    TResult Function(String query)? queryChanged,
    TResult Function(VisibleRegion region)? regionChanged,
    required TResult orElse(),
  }) {
    if (getSuggestResult != null) {
      return getSuggestResult();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSuggestResult value) getSuggestResult,
    required TResult Function(_QueryChanged value) queryChanged,
    required TResult Function(_RegionChanged value) regionChanged,
  }) {
    return getSuggestResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSuggestResult value)? getSuggestResult,
    TResult? Function(_QueryChanged value)? queryChanged,
    TResult? Function(_RegionChanged value)? regionChanged,
  }) {
    return getSuggestResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSuggestResult value)? getSuggestResult,
    TResult Function(_QueryChanged value)? queryChanged,
    TResult Function(_RegionChanged value)? regionChanged,
    required TResult orElse(),
  }) {
    if (getSuggestResult != null) {
      return getSuggestResult(this);
    }
    return orElse();
  }
}

abstract class _GetSuggestResult implements MapSuggestEvent {
  const factory _GetSuggestResult() = _$GetSuggestResultImpl;
}

/// @nodoc
abstract class _$$QueryChangedImplCopyWith<$Res> {
  factory _$$QueryChangedImplCopyWith(
          _$QueryChangedImpl value, $Res Function(_$QueryChangedImpl) then) =
      __$$QueryChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$QueryChangedImplCopyWithImpl<$Res>
    extends _$MapSuggestEventCopyWithImpl<$Res, _$QueryChangedImpl>
    implements _$$QueryChangedImplCopyWith<$Res> {
  __$$QueryChangedImplCopyWithImpl(
      _$QueryChangedImpl _value, $Res Function(_$QueryChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of MapSuggestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$QueryChangedImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$QueryChangedImpl implements _QueryChanged {
  const _$QueryChangedImpl({required this.query});

  @override
  final String query;

  @override
  String toString() {
    return 'MapSuggestEvent.queryChanged(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueryChangedImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  /// Create a copy of MapSuggestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QueryChangedImplCopyWith<_$QueryChangedImpl> get copyWith =>
      __$$QueryChangedImplCopyWithImpl<_$QueryChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSuggestResult,
    required TResult Function(String query) queryChanged,
    required TResult Function(VisibleRegion region) regionChanged,
  }) {
    return queryChanged(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSuggestResult,
    TResult? Function(String query)? queryChanged,
    TResult? Function(VisibleRegion region)? regionChanged,
  }) {
    return queryChanged?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSuggestResult,
    TResult Function(String query)? queryChanged,
    TResult Function(VisibleRegion region)? regionChanged,
    required TResult orElse(),
  }) {
    if (queryChanged != null) {
      return queryChanged(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSuggestResult value) getSuggestResult,
    required TResult Function(_QueryChanged value) queryChanged,
    required TResult Function(_RegionChanged value) regionChanged,
  }) {
    return queryChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSuggestResult value)? getSuggestResult,
    TResult? Function(_QueryChanged value)? queryChanged,
    TResult? Function(_RegionChanged value)? regionChanged,
  }) {
    return queryChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSuggestResult value)? getSuggestResult,
    TResult Function(_QueryChanged value)? queryChanged,
    TResult Function(_RegionChanged value)? regionChanged,
    required TResult orElse(),
  }) {
    if (queryChanged != null) {
      return queryChanged(this);
    }
    return orElse();
  }
}

abstract class _QueryChanged implements MapSuggestEvent {
  const factory _QueryChanged({required final String query}) =
      _$QueryChangedImpl;

  String get query;

  /// Create a copy of MapSuggestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QueryChangedImplCopyWith<_$QueryChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegionChangedImplCopyWith<$Res> {
  factory _$$RegionChangedImplCopyWith(
          _$RegionChangedImpl value, $Res Function(_$RegionChangedImpl) then) =
      __$$RegionChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({VisibleRegion region});
}

/// @nodoc
class __$$RegionChangedImplCopyWithImpl<$Res>
    extends _$MapSuggestEventCopyWithImpl<$Res, _$RegionChangedImpl>
    implements _$$RegionChangedImplCopyWith<$Res> {
  __$$RegionChangedImplCopyWithImpl(
      _$RegionChangedImpl _value, $Res Function(_$RegionChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of MapSuggestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? region = null,
  }) {
    return _then(_$RegionChangedImpl(
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as VisibleRegion,
    ));
  }
}

/// @nodoc

class _$RegionChangedImpl implements _RegionChanged {
  const _$RegionChangedImpl({required this.region});

  @override
  final VisibleRegion region;

  @override
  String toString() {
    return 'MapSuggestEvent.regionChanged(region: $region)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegionChangedImpl &&
            (identical(other.region, region) || other.region == region));
  }

  @override
  int get hashCode => Object.hash(runtimeType, region);

  /// Create a copy of MapSuggestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegionChangedImplCopyWith<_$RegionChangedImpl> get copyWith =>
      __$$RegionChangedImplCopyWithImpl<_$RegionChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSuggestResult,
    required TResult Function(String query) queryChanged,
    required TResult Function(VisibleRegion region) regionChanged,
  }) {
    return regionChanged(region);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSuggestResult,
    TResult? Function(String query)? queryChanged,
    TResult? Function(VisibleRegion region)? regionChanged,
  }) {
    return regionChanged?.call(region);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSuggestResult,
    TResult Function(String query)? queryChanged,
    TResult Function(VisibleRegion region)? regionChanged,
    required TResult orElse(),
  }) {
    if (regionChanged != null) {
      return regionChanged(region);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSuggestResult value) getSuggestResult,
    required TResult Function(_QueryChanged value) queryChanged,
    required TResult Function(_RegionChanged value) regionChanged,
  }) {
    return regionChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSuggestResult value)? getSuggestResult,
    TResult? Function(_QueryChanged value)? queryChanged,
    TResult? Function(_RegionChanged value)? regionChanged,
  }) {
    return regionChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSuggestResult value)? getSuggestResult,
    TResult Function(_QueryChanged value)? queryChanged,
    TResult Function(_RegionChanged value)? regionChanged,
    required TResult orElse(),
  }) {
    if (regionChanged != null) {
      return regionChanged(this);
    }
    return orElse();
  }
}

abstract class _RegionChanged implements MapSuggestEvent {
  const factory _RegionChanged({required final VisibleRegion region}) =
      _$RegionChangedImpl;

  VisibleRegion get region;

  /// Create a copy of MapSuggestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegionChangedImplCopyWith<_$RegionChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MapSuggestState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SuggestResponseItem> results) success,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SuggestResponseItem> results)? success,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SuggestResponseItem> results)? success,
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
abstract class $MapSuggestStateCopyWith<$Res> {
  factory $MapSuggestStateCopyWith(
          MapSuggestState value, $Res Function(MapSuggestState) then) =
      _$MapSuggestStateCopyWithImpl<$Res, MapSuggestState>;
}

/// @nodoc
class _$MapSuggestStateCopyWithImpl<$Res, $Val extends MapSuggestState>
    implements $MapSuggestStateCopyWith<$Res> {
  _$MapSuggestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MapSuggestState
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
    extends _$MapSuggestStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of MapSuggestState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'MapSuggestState.initial()';
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
    required TResult Function(List<SuggestResponseItem> results) success,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SuggestResponseItem> results)? success,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SuggestResponseItem> results)? success,
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

abstract class _Initial implements MapSuggestState {
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
    extends _$MapSuggestStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of MapSuggestState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'MapSuggestState.loading()';
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
    required TResult Function(List<SuggestResponseItem> results) success,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SuggestResponseItem> results)? success,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SuggestResponseItem> results)? success,
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

abstract class _Loading implements MapSuggestState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SuggestResponseItem> results});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$MapSuggestStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of MapSuggestState
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
              as List<SuggestResponseItem>,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl({required final List<SuggestResponseItem> results})
      : _results = results;

  final List<SuggestResponseItem> _results;
  @override
  List<SuggestResponseItem> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'MapSuggestState.success(results: $results)';
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

  /// Create a copy of MapSuggestState
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
    required TResult Function(List<SuggestResponseItem> results) success,
    required TResult Function(String message) failure,
  }) {
    return success(results);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SuggestResponseItem> results)? success,
    TResult? Function(String message)? failure,
  }) {
    return success?.call(results);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SuggestResponseItem> results)? success,
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

abstract class _Success implements MapSuggestState {
  const factory _Success({required final List<SuggestResponseItem> results}) =
      _$SuccessImpl;

  List<SuggestResponseItem> get results;

  /// Create a copy of MapSuggestState
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
    extends _$MapSuggestStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of MapSuggestState
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
    return 'MapSuggestState.failure(message: $message)';
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

  /// Create a copy of MapSuggestState
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
    required TResult Function(List<SuggestResponseItem> results) success,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SuggestResponseItem> results)? success,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SuggestResponseItem> results)? success,
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

abstract class _Failure implements MapSuggestState {
  const factory _Failure({required final String message}) = _$FailureImpl;

  String get message;

  /// Create a copy of MapSuggestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
