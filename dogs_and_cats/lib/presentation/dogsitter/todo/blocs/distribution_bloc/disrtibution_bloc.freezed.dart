// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'disrtibution_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DistributionEvent {
  Dogsitter get dogsitter => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Status status, Dogsitter dogsitter) load,
    required TResult Function(String orderId, Person person,
            Dogsitter dogsitter, String serviceTitle, OrderModel order)
        accept,
    required TResult Function(String orderId, Dogsitter dogsitter) complete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Status status, Dogsitter dogsitter)? load,
    TResult? Function(String orderId, Person person, Dogsitter dogsitter,
            String serviceTitle, OrderModel order)?
        accept,
    TResult? Function(String orderId, Dogsitter dogsitter)? complete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Status status, Dogsitter dogsitter)? load,
    TResult Function(String orderId, Person person, Dogsitter dogsitter,
            String serviceTitle, OrderModel order)?
        accept,
    TResult Function(String orderId, Dogsitter dogsitter)? complete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Accept value) accept,
    required TResult Function(_Complete value) complete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Accept value)? accept,
    TResult? Function(_Complete value)? complete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Accept value)? accept,
    TResult Function(_Complete value)? complete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of DistributionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DistributionEventCopyWith<DistributionEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DistributionEventCopyWith<$Res> {
  factory $DistributionEventCopyWith(
          DistributionEvent value, $Res Function(DistributionEvent) then) =
      _$DistributionEventCopyWithImpl<$Res, DistributionEvent>;
  @useResult
  $Res call({Dogsitter dogsitter});
}

/// @nodoc
class _$DistributionEventCopyWithImpl<$Res, $Val extends DistributionEvent>
    implements $DistributionEventCopyWith<$Res> {
  _$DistributionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DistributionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dogsitter = null,
  }) {
    return _then(_value.copyWith(
      dogsitter: null == dogsitter
          ? _value.dogsitter
          : dogsitter // ignore: cast_nullable_to_non_nullable
              as Dogsitter,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoadImplCopyWith<$Res>
    implements $DistributionEventCopyWith<$Res> {
  factory _$$LoadImplCopyWith(
          _$LoadImpl value, $Res Function(_$LoadImpl) then) =
      __$$LoadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, Dogsitter dogsitter});
}

/// @nodoc
class __$$LoadImplCopyWithImpl<$Res>
    extends _$DistributionEventCopyWithImpl<$Res, _$LoadImpl>
    implements _$$LoadImplCopyWith<$Res> {
  __$$LoadImplCopyWithImpl(_$LoadImpl _value, $Res Function(_$LoadImpl) _then)
      : super(_value, _then);

  /// Create a copy of DistributionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? dogsitter = null,
  }) {
    return _then(_$LoadImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      dogsitter: null == dogsitter
          ? _value.dogsitter
          : dogsitter // ignore: cast_nullable_to_non_nullable
              as Dogsitter,
    ));
  }
}

/// @nodoc

class _$LoadImpl implements _Load {
  const _$LoadImpl({required this.status, required this.dogsitter});

  @override
  final Status status;
  @override
  final Dogsitter dogsitter;

  @override
  String toString() {
    return 'DistributionEvent.load(status: $status, dogsitter: $dogsitter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.dogsitter, dogsitter) ||
                other.dogsitter == dogsitter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, dogsitter);

  /// Create a copy of DistributionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadImplCopyWith<_$LoadImpl> get copyWith =>
      __$$LoadImplCopyWithImpl<_$LoadImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Status status, Dogsitter dogsitter) load,
    required TResult Function(String orderId, Person person,
            Dogsitter dogsitter, String serviceTitle, OrderModel order)
        accept,
    required TResult Function(String orderId, Dogsitter dogsitter) complete,
  }) {
    return load(status, dogsitter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Status status, Dogsitter dogsitter)? load,
    TResult? Function(String orderId, Person person, Dogsitter dogsitter,
            String serviceTitle, OrderModel order)?
        accept,
    TResult? Function(String orderId, Dogsitter dogsitter)? complete,
  }) {
    return load?.call(status, dogsitter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Status status, Dogsitter dogsitter)? load,
    TResult Function(String orderId, Person person, Dogsitter dogsitter,
            String serviceTitle, OrderModel order)?
        accept,
    TResult Function(String orderId, Dogsitter dogsitter)? complete,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(status, dogsitter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Accept value) accept,
    required TResult Function(_Complete value) complete,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Accept value)? accept,
    TResult? Function(_Complete value)? complete,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Accept value)? accept,
    TResult Function(_Complete value)? complete,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _Load implements DistributionEvent {
  const factory _Load(
      {required final Status status,
      required final Dogsitter dogsitter}) = _$LoadImpl;

  Status get status;
  @override
  Dogsitter get dogsitter;

  /// Create a copy of DistributionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadImplCopyWith<_$LoadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AcceptImplCopyWith<$Res>
    implements $DistributionEventCopyWith<$Res> {
  factory _$$AcceptImplCopyWith(
          _$AcceptImpl value, $Res Function(_$AcceptImpl) then) =
      __$$AcceptImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String orderId,
      Person person,
      Dogsitter dogsitter,
      String serviceTitle,
      OrderModel order});
}

/// @nodoc
class __$$AcceptImplCopyWithImpl<$Res>
    extends _$DistributionEventCopyWithImpl<$Res, _$AcceptImpl>
    implements _$$AcceptImplCopyWith<$Res> {
  __$$AcceptImplCopyWithImpl(
      _$AcceptImpl _value, $Res Function(_$AcceptImpl) _then)
      : super(_value, _then);

  /// Create a copy of DistributionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? person = null,
    Object? dogsitter = null,
    Object? serviceTitle = null,
    Object? order = null,
  }) {
    return _then(_$AcceptImpl(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      person: null == person
          ? _value.person
          : person // ignore: cast_nullable_to_non_nullable
              as Person,
      dogsitter: null == dogsitter
          ? _value.dogsitter
          : dogsitter // ignore: cast_nullable_to_non_nullable
              as Dogsitter,
      serviceTitle: null == serviceTitle
          ? _value.serviceTitle
          : serviceTitle // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderModel,
    ));
  }
}

/// @nodoc

class _$AcceptImpl implements _Accept {
  const _$AcceptImpl(
      {required this.orderId,
      required this.person,
      required this.dogsitter,
      required this.serviceTitle,
      required this.order});

  @override
  final String orderId;
  @override
  final Person person;
  @override
  final Dogsitter dogsitter;
  @override
  final String serviceTitle;
  @override
  final OrderModel order;

  @override
  String toString() {
    return 'DistributionEvent.accept(orderId: $orderId, person: $person, dogsitter: $dogsitter, serviceTitle: $serviceTitle, order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AcceptImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.person, person) || other.person == person) &&
            (identical(other.dogsitter, dogsitter) ||
                other.dogsitter == dogsitter) &&
            (identical(other.serviceTitle, serviceTitle) ||
                other.serviceTitle == serviceTitle) &&
            (identical(other.order, order) || other.order == order));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, orderId, person, dogsitter, serviceTitle, order);

  /// Create a copy of DistributionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AcceptImplCopyWith<_$AcceptImpl> get copyWith =>
      __$$AcceptImplCopyWithImpl<_$AcceptImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Status status, Dogsitter dogsitter) load,
    required TResult Function(String orderId, Person person,
            Dogsitter dogsitter, String serviceTitle, OrderModel order)
        accept,
    required TResult Function(String orderId, Dogsitter dogsitter) complete,
  }) {
    return accept(orderId, person, dogsitter, serviceTitle, order);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Status status, Dogsitter dogsitter)? load,
    TResult? Function(String orderId, Person person, Dogsitter dogsitter,
            String serviceTitle, OrderModel order)?
        accept,
    TResult? Function(String orderId, Dogsitter dogsitter)? complete,
  }) {
    return accept?.call(orderId, person, dogsitter, serviceTitle, order);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Status status, Dogsitter dogsitter)? load,
    TResult Function(String orderId, Person person, Dogsitter dogsitter,
            String serviceTitle, OrderModel order)?
        accept,
    TResult Function(String orderId, Dogsitter dogsitter)? complete,
    required TResult orElse(),
  }) {
    if (accept != null) {
      return accept(orderId, person, dogsitter, serviceTitle, order);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Accept value) accept,
    required TResult Function(_Complete value) complete,
  }) {
    return accept(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Accept value)? accept,
    TResult? Function(_Complete value)? complete,
  }) {
    return accept?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Accept value)? accept,
    TResult Function(_Complete value)? complete,
    required TResult orElse(),
  }) {
    if (accept != null) {
      return accept(this);
    }
    return orElse();
  }
}

abstract class _Accept implements DistributionEvent {
  const factory _Accept(
      {required final String orderId,
      required final Person person,
      required final Dogsitter dogsitter,
      required final String serviceTitle,
      required final OrderModel order}) = _$AcceptImpl;

  String get orderId;
  Person get person;
  @override
  Dogsitter get dogsitter;
  String get serviceTitle;
  OrderModel get order;

  /// Create a copy of DistributionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AcceptImplCopyWith<_$AcceptImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CompleteImplCopyWith<$Res>
    implements $DistributionEventCopyWith<$Res> {
  factory _$$CompleteImplCopyWith(
          _$CompleteImpl value, $Res Function(_$CompleteImpl) then) =
      __$$CompleteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String orderId, Dogsitter dogsitter});
}

/// @nodoc
class __$$CompleteImplCopyWithImpl<$Res>
    extends _$DistributionEventCopyWithImpl<$Res, _$CompleteImpl>
    implements _$$CompleteImplCopyWith<$Res> {
  __$$CompleteImplCopyWithImpl(
      _$CompleteImpl _value, $Res Function(_$CompleteImpl) _then)
      : super(_value, _then);

  /// Create a copy of DistributionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? dogsitter = null,
  }) {
    return _then(_$CompleteImpl(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      dogsitter: null == dogsitter
          ? _value.dogsitter
          : dogsitter // ignore: cast_nullable_to_non_nullable
              as Dogsitter,
    ));
  }
}

/// @nodoc

class _$CompleteImpl implements _Complete {
  const _$CompleteImpl({required this.orderId, required this.dogsitter});

  @override
  final String orderId;
  @override
  final Dogsitter dogsitter;

  @override
  String toString() {
    return 'DistributionEvent.complete(orderId: $orderId, dogsitter: $dogsitter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompleteImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.dogsitter, dogsitter) ||
                other.dogsitter == dogsitter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderId, dogsitter);

  /// Create a copy of DistributionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompleteImplCopyWith<_$CompleteImpl> get copyWith =>
      __$$CompleteImplCopyWithImpl<_$CompleteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Status status, Dogsitter dogsitter) load,
    required TResult Function(String orderId, Person person,
            Dogsitter dogsitter, String serviceTitle, OrderModel order)
        accept,
    required TResult Function(String orderId, Dogsitter dogsitter) complete,
  }) {
    return complete(orderId, dogsitter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Status status, Dogsitter dogsitter)? load,
    TResult? Function(String orderId, Person person, Dogsitter dogsitter,
            String serviceTitle, OrderModel order)?
        accept,
    TResult? Function(String orderId, Dogsitter dogsitter)? complete,
  }) {
    return complete?.call(orderId, dogsitter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Status status, Dogsitter dogsitter)? load,
    TResult Function(String orderId, Person person, Dogsitter dogsitter,
            String serviceTitle, OrderModel order)?
        accept,
    TResult Function(String orderId, Dogsitter dogsitter)? complete,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(orderId, dogsitter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Accept value) accept,
    required TResult Function(_Complete value) complete,
  }) {
    return complete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Accept value)? accept,
    TResult? Function(_Complete value)? complete,
  }) {
    return complete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Accept value)? accept,
    TResult Function(_Complete value)? complete,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(this);
    }
    return orElse();
  }
}

abstract class _Complete implements DistributionEvent {
  const factory _Complete(
      {required final String orderId,
      required final Dogsitter dogsitter}) = _$CompleteImpl;

  String get orderId;
  @override
  Dogsitter get dogsitter;

  /// Create a copy of DistributionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompleteImplCopyWith<_$CompleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DistributionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<TaskModel> tasks) loaded,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<TaskModel> tasks)? loaded,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<TaskModel> tasks)? loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DistributionStateCopyWith<$Res> {
  factory $DistributionStateCopyWith(
          DistributionState value, $Res Function(DistributionState) then) =
      _$DistributionStateCopyWithImpl<$Res, DistributionState>;
}

/// @nodoc
class _$DistributionStateCopyWithImpl<$Res, $Val extends DistributionState>
    implements $DistributionStateCopyWith<$Res> {
  _$DistributionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DistributionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$DistributionStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of DistributionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'DistributionState.loading()';
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
    required TResult Function() loading,
    required TResult Function(List<TaskModel> tasks) loaded,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<TaskModel> tasks)? loaded,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<TaskModel> tasks)? loaded,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements DistributionState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TaskModel> tasks});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$DistributionStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of DistributionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
  }) {
    return _then(_$LoadedImpl(
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl({required final List<TaskModel> tasks}) : _tasks = tasks;

  final List<TaskModel> _tasks;
  @override
  List<TaskModel> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  String toString() {
    return 'DistributionState.loaded(tasks: $tasks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tasks));

  /// Create a copy of DistributionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<TaskModel> tasks) loaded,
    required TResult Function(String message) failure,
  }) {
    return loaded(tasks);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<TaskModel> tasks)? loaded,
    TResult? Function(String message)? failure,
  }) {
    return loaded?.call(tasks);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<TaskModel> tasks)? loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(tasks);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failure value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements DistributionState {
  const factory _Loaded({required final List<TaskModel> tasks}) = _$LoadedImpl;

  List<TaskModel> get tasks;

  /// Create a copy of DistributionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
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
    extends _$DistributionStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of DistributionState
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
    return 'DistributionState.failure(message: $message)';
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

  /// Create a copy of DistributionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<TaskModel> tasks) loaded,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<TaskModel> tasks)? loaded,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<TaskModel> tasks)? loaded,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements DistributionState {
  const factory _Failure({required final String message}) = _$FailureImpl;

  String get message;

  /// Create a copy of DistributionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
