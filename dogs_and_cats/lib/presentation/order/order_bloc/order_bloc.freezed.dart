// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OrderModel order, List<String> petIds) addOrder,
    required TResult Function() loadAllOrders,
    required TResult Function() loadRefusalOrders,
    required TResult Function() loadAdoptedOrders,
    required TResult Function() loadCompletedOrders,
    required TResult Function(String orderId) cancelOrder,
    required TResult Function(Score score) addScore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OrderModel order, List<String> petIds)? addOrder,
    TResult? Function()? loadAllOrders,
    TResult? Function()? loadRefusalOrders,
    TResult? Function()? loadAdoptedOrders,
    TResult? Function()? loadCompletedOrders,
    TResult? Function(String orderId)? cancelOrder,
    TResult? Function(Score score)? addScore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OrderModel order, List<String> petIds)? addOrder,
    TResult Function()? loadAllOrders,
    TResult Function()? loadRefusalOrders,
    TResult Function()? loadAdoptedOrders,
    TResult Function()? loadCompletedOrders,
    TResult Function(String orderId)? cancelOrder,
    TResult Function(Score score)? addScore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddOrder value) addOrder,
    required TResult Function(_LoadAllOrders value) loadAllOrders,
    required TResult Function(_LoadRefusalOrders value) loadRefusalOrders,
    required TResult Function(_LoadAdoptedOrders value) loadAdoptedOrders,
    required TResult Function(_LoadCompletedOrders value) loadCompletedOrders,
    required TResult Function(_CancelOrder value) cancelOrder,
    required TResult Function(_AddScore value) addScore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddOrder value)? addOrder,
    TResult? Function(_LoadAllOrders value)? loadAllOrders,
    TResult? Function(_LoadRefusalOrders value)? loadRefusalOrders,
    TResult? Function(_LoadAdoptedOrders value)? loadAdoptedOrders,
    TResult? Function(_LoadCompletedOrders value)? loadCompletedOrders,
    TResult? Function(_CancelOrder value)? cancelOrder,
    TResult? Function(_AddScore value)? addScore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddOrder value)? addOrder,
    TResult Function(_LoadAllOrders value)? loadAllOrders,
    TResult Function(_LoadRefusalOrders value)? loadRefusalOrders,
    TResult Function(_LoadAdoptedOrders value)? loadAdoptedOrders,
    TResult Function(_LoadCompletedOrders value)? loadCompletedOrders,
    TResult Function(_CancelOrder value)? cancelOrder,
    TResult Function(_AddScore value)? addScore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderEventCopyWith<$Res> {
  factory $OrderEventCopyWith(
          OrderEvent value, $Res Function(OrderEvent) then) =
      _$OrderEventCopyWithImpl<$Res, OrderEvent>;
}

/// @nodoc
class _$OrderEventCopyWithImpl<$Res, $Val extends OrderEvent>
    implements $OrderEventCopyWith<$Res> {
  _$OrderEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AddOrderImplCopyWith<$Res> {
  factory _$$AddOrderImplCopyWith(
          _$AddOrderImpl value, $Res Function(_$AddOrderImpl) then) =
      __$$AddOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({OrderModel order, List<String> petIds});
}

/// @nodoc
class __$$AddOrderImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$AddOrderImpl>
    implements _$$AddOrderImplCopyWith<$Res> {
  __$$AddOrderImplCopyWithImpl(
      _$AddOrderImpl _value, $Res Function(_$AddOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
    Object? petIds = null,
  }) {
    return _then(_$AddOrderImpl(
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderModel,
      petIds: null == petIds
          ? _value._petIds
          : petIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$AddOrderImpl implements _AddOrder {
  const _$AddOrderImpl(
      {required this.order, required final List<String> petIds})
      : _petIds = petIds;

  @override
  final OrderModel order;
  final List<String> _petIds;
  @override
  List<String> get petIds {
    if (_petIds is EqualUnmodifiableListView) return _petIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_petIds);
  }

  @override
  String toString() {
    return 'OrderEvent.addOrder(order: $order, petIds: $petIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddOrderImpl &&
            (identical(other.order, order) || other.order == order) &&
            const DeepCollectionEquality().equals(other._petIds, _petIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, order, const DeepCollectionEquality().hash(_petIds));

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddOrderImplCopyWith<_$AddOrderImpl> get copyWith =>
      __$$AddOrderImplCopyWithImpl<_$AddOrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OrderModel order, List<String> petIds) addOrder,
    required TResult Function() loadAllOrders,
    required TResult Function() loadRefusalOrders,
    required TResult Function() loadAdoptedOrders,
    required TResult Function() loadCompletedOrders,
    required TResult Function(String orderId) cancelOrder,
    required TResult Function(Score score) addScore,
  }) {
    return addOrder(order, petIds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OrderModel order, List<String> petIds)? addOrder,
    TResult? Function()? loadAllOrders,
    TResult? Function()? loadRefusalOrders,
    TResult? Function()? loadAdoptedOrders,
    TResult? Function()? loadCompletedOrders,
    TResult? Function(String orderId)? cancelOrder,
    TResult? Function(Score score)? addScore,
  }) {
    return addOrder?.call(order, petIds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OrderModel order, List<String> petIds)? addOrder,
    TResult Function()? loadAllOrders,
    TResult Function()? loadRefusalOrders,
    TResult Function()? loadAdoptedOrders,
    TResult Function()? loadCompletedOrders,
    TResult Function(String orderId)? cancelOrder,
    TResult Function(Score score)? addScore,
    required TResult orElse(),
  }) {
    if (addOrder != null) {
      return addOrder(order, petIds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddOrder value) addOrder,
    required TResult Function(_LoadAllOrders value) loadAllOrders,
    required TResult Function(_LoadRefusalOrders value) loadRefusalOrders,
    required TResult Function(_LoadAdoptedOrders value) loadAdoptedOrders,
    required TResult Function(_LoadCompletedOrders value) loadCompletedOrders,
    required TResult Function(_CancelOrder value) cancelOrder,
    required TResult Function(_AddScore value) addScore,
  }) {
    return addOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddOrder value)? addOrder,
    TResult? Function(_LoadAllOrders value)? loadAllOrders,
    TResult? Function(_LoadRefusalOrders value)? loadRefusalOrders,
    TResult? Function(_LoadAdoptedOrders value)? loadAdoptedOrders,
    TResult? Function(_LoadCompletedOrders value)? loadCompletedOrders,
    TResult? Function(_CancelOrder value)? cancelOrder,
    TResult? Function(_AddScore value)? addScore,
  }) {
    return addOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddOrder value)? addOrder,
    TResult Function(_LoadAllOrders value)? loadAllOrders,
    TResult Function(_LoadRefusalOrders value)? loadRefusalOrders,
    TResult Function(_LoadAdoptedOrders value)? loadAdoptedOrders,
    TResult Function(_LoadCompletedOrders value)? loadCompletedOrders,
    TResult Function(_CancelOrder value)? cancelOrder,
    TResult Function(_AddScore value)? addScore,
    required TResult orElse(),
  }) {
    if (addOrder != null) {
      return addOrder(this);
    }
    return orElse();
  }
}

abstract class _AddOrder implements OrderEvent {
  const factory _AddOrder(
      {required final OrderModel order,
      required final List<String> petIds}) = _$AddOrderImpl;

  OrderModel get order;
  List<String> get petIds;

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddOrderImplCopyWith<_$AddOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadAllOrdersImplCopyWith<$Res> {
  factory _$$LoadAllOrdersImplCopyWith(
          _$LoadAllOrdersImpl value, $Res Function(_$LoadAllOrdersImpl) then) =
      __$$LoadAllOrdersImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadAllOrdersImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$LoadAllOrdersImpl>
    implements _$$LoadAllOrdersImplCopyWith<$Res> {
  __$$LoadAllOrdersImplCopyWithImpl(
      _$LoadAllOrdersImpl _value, $Res Function(_$LoadAllOrdersImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadAllOrdersImpl implements _LoadAllOrders {
  const _$LoadAllOrdersImpl();

  @override
  String toString() {
    return 'OrderEvent.loadAllOrders()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadAllOrdersImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OrderModel order, List<String> petIds) addOrder,
    required TResult Function() loadAllOrders,
    required TResult Function() loadRefusalOrders,
    required TResult Function() loadAdoptedOrders,
    required TResult Function() loadCompletedOrders,
    required TResult Function(String orderId) cancelOrder,
    required TResult Function(Score score) addScore,
  }) {
    return loadAllOrders();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OrderModel order, List<String> petIds)? addOrder,
    TResult? Function()? loadAllOrders,
    TResult? Function()? loadRefusalOrders,
    TResult? Function()? loadAdoptedOrders,
    TResult? Function()? loadCompletedOrders,
    TResult? Function(String orderId)? cancelOrder,
    TResult? Function(Score score)? addScore,
  }) {
    return loadAllOrders?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OrderModel order, List<String> petIds)? addOrder,
    TResult Function()? loadAllOrders,
    TResult Function()? loadRefusalOrders,
    TResult Function()? loadAdoptedOrders,
    TResult Function()? loadCompletedOrders,
    TResult Function(String orderId)? cancelOrder,
    TResult Function(Score score)? addScore,
    required TResult orElse(),
  }) {
    if (loadAllOrders != null) {
      return loadAllOrders();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddOrder value) addOrder,
    required TResult Function(_LoadAllOrders value) loadAllOrders,
    required TResult Function(_LoadRefusalOrders value) loadRefusalOrders,
    required TResult Function(_LoadAdoptedOrders value) loadAdoptedOrders,
    required TResult Function(_LoadCompletedOrders value) loadCompletedOrders,
    required TResult Function(_CancelOrder value) cancelOrder,
    required TResult Function(_AddScore value) addScore,
  }) {
    return loadAllOrders(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddOrder value)? addOrder,
    TResult? Function(_LoadAllOrders value)? loadAllOrders,
    TResult? Function(_LoadRefusalOrders value)? loadRefusalOrders,
    TResult? Function(_LoadAdoptedOrders value)? loadAdoptedOrders,
    TResult? Function(_LoadCompletedOrders value)? loadCompletedOrders,
    TResult? Function(_CancelOrder value)? cancelOrder,
    TResult? Function(_AddScore value)? addScore,
  }) {
    return loadAllOrders?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddOrder value)? addOrder,
    TResult Function(_LoadAllOrders value)? loadAllOrders,
    TResult Function(_LoadRefusalOrders value)? loadRefusalOrders,
    TResult Function(_LoadAdoptedOrders value)? loadAdoptedOrders,
    TResult Function(_LoadCompletedOrders value)? loadCompletedOrders,
    TResult Function(_CancelOrder value)? cancelOrder,
    TResult Function(_AddScore value)? addScore,
    required TResult orElse(),
  }) {
    if (loadAllOrders != null) {
      return loadAllOrders(this);
    }
    return orElse();
  }
}

abstract class _LoadAllOrders implements OrderEvent {
  const factory _LoadAllOrders() = _$LoadAllOrdersImpl;
}

/// @nodoc
abstract class _$$LoadRefusalOrdersImplCopyWith<$Res> {
  factory _$$LoadRefusalOrdersImplCopyWith(_$LoadRefusalOrdersImpl value,
          $Res Function(_$LoadRefusalOrdersImpl) then) =
      __$$LoadRefusalOrdersImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadRefusalOrdersImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$LoadRefusalOrdersImpl>
    implements _$$LoadRefusalOrdersImplCopyWith<$Res> {
  __$$LoadRefusalOrdersImplCopyWithImpl(_$LoadRefusalOrdersImpl _value,
      $Res Function(_$LoadRefusalOrdersImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadRefusalOrdersImpl implements _LoadRefusalOrders {
  const _$LoadRefusalOrdersImpl();

  @override
  String toString() {
    return 'OrderEvent.loadRefusalOrders()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadRefusalOrdersImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OrderModel order, List<String> petIds) addOrder,
    required TResult Function() loadAllOrders,
    required TResult Function() loadRefusalOrders,
    required TResult Function() loadAdoptedOrders,
    required TResult Function() loadCompletedOrders,
    required TResult Function(String orderId) cancelOrder,
    required TResult Function(Score score) addScore,
  }) {
    return loadRefusalOrders();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OrderModel order, List<String> petIds)? addOrder,
    TResult? Function()? loadAllOrders,
    TResult? Function()? loadRefusalOrders,
    TResult? Function()? loadAdoptedOrders,
    TResult? Function()? loadCompletedOrders,
    TResult? Function(String orderId)? cancelOrder,
    TResult? Function(Score score)? addScore,
  }) {
    return loadRefusalOrders?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OrderModel order, List<String> petIds)? addOrder,
    TResult Function()? loadAllOrders,
    TResult Function()? loadRefusalOrders,
    TResult Function()? loadAdoptedOrders,
    TResult Function()? loadCompletedOrders,
    TResult Function(String orderId)? cancelOrder,
    TResult Function(Score score)? addScore,
    required TResult orElse(),
  }) {
    if (loadRefusalOrders != null) {
      return loadRefusalOrders();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddOrder value) addOrder,
    required TResult Function(_LoadAllOrders value) loadAllOrders,
    required TResult Function(_LoadRefusalOrders value) loadRefusalOrders,
    required TResult Function(_LoadAdoptedOrders value) loadAdoptedOrders,
    required TResult Function(_LoadCompletedOrders value) loadCompletedOrders,
    required TResult Function(_CancelOrder value) cancelOrder,
    required TResult Function(_AddScore value) addScore,
  }) {
    return loadRefusalOrders(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddOrder value)? addOrder,
    TResult? Function(_LoadAllOrders value)? loadAllOrders,
    TResult? Function(_LoadRefusalOrders value)? loadRefusalOrders,
    TResult? Function(_LoadAdoptedOrders value)? loadAdoptedOrders,
    TResult? Function(_LoadCompletedOrders value)? loadCompletedOrders,
    TResult? Function(_CancelOrder value)? cancelOrder,
    TResult? Function(_AddScore value)? addScore,
  }) {
    return loadRefusalOrders?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddOrder value)? addOrder,
    TResult Function(_LoadAllOrders value)? loadAllOrders,
    TResult Function(_LoadRefusalOrders value)? loadRefusalOrders,
    TResult Function(_LoadAdoptedOrders value)? loadAdoptedOrders,
    TResult Function(_LoadCompletedOrders value)? loadCompletedOrders,
    TResult Function(_CancelOrder value)? cancelOrder,
    TResult Function(_AddScore value)? addScore,
    required TResult orElse(),
  }) {
    if (loadRefusalOrders != null) {
      return loadRefusalOrders(this);
    }
    return orElse();
  }
}

abstract class _LoadRefusalOrders implements OrderEvent {
  const factory _LoadRefusalOrders() = _$LoadRefusalOrdersImpl;
}

/// @nodoc
abstract class _$$LoadAdoptedOrdersImplCopyWith<$Res> {
  factory _$$LoadAdoptedOrdersImplCopyWith(_$LoadAdoptedOrdersImpl value,
          $Res Function(_$LoadAdoptedOrdersImpl) then) =
      __$$LoadAdoptedOrdersImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadAdoptedOrdersImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$LoadAdoptedOrdersImpl>
    implements _$$LoadAdoptedOrdersImplCopyWith<$Res> {
  __$$LoadAdoptedOrdersImplCopyWithImpl(_$LoadAdoptedOrdersImpl _value,
      $Res Function(_$LoadAdoptedOrdersImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadAdoptedOrdersImpl implements _LoadAdoptedOrders {
  const _$LoadAdoptedOrdersImpl();

  @override
  String toString() {
    return 'OrderEvent.loadAdoptedOrders()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadAdoptedOrdersImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OrderModel order, List<String> petIds) addOrder,
    required TResult Function() loadAllOrders,
    required TResult Function() loadRefusalOrders,
    required TResult Function() loadAdoptedOrders,
    required TResult Function() loadCompletedOrders,
    required TResult Function(String orderId) cancelOrder,
    required TResult Function(Score score) addScore,
  }) {
    return loadAdoptedOrders();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OrderModel order, List<String> petIds)? addOrder,
    TResult? Function()? loadAllOrders,
    TResult? Function()? loadRefusalOrders,
    TResult? Function()? loadAdoptedOrders,
    TResult? Function()? loadCompletedOrders,
    TResult? Function(String orderId)? cancelOrder,
    TResult? Function(Score score)? addScore,
  }) {
    return loadAdoptedOrders?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OrderModel order, List<String> petIds)? addOrder,
    TResult Function()? loadAllOrders,
    TResult Function()? loadRefusalOrders,
    TResult Function()? loadAdoptedOrders,
    TResult Function()? loadCompletedOrders,
    TResult Function(String orderId)? cancelOrder,
    TResult Function(Score score)? addScore,
    required TResult orElse(),
  }) {
    if (loadAdoptedOrders != null) {
      return loadAdoptedOrders();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddOrder value) addOrder,
    required TResult Function(_LoadAllOrders value) loadAllOrders,
    required TResult Function(_LoadRefusalOrders value) loadRefusalOrders,
    required TResult Function(_LoadAdoptedOrders value) loadAdoptedOrders,
    required TResult Function(_LoadCompletedOrders value) loadCompletedOrders,
    required TResult Function(_CancelOrder value) cancelOrder,
    required TResult Function(_AddScore value) addScore,
  }) {
    return loadAdoptedOrders(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddOrder value)? addOrder,
    TResult? Function(_LoadAllOrders value)? loadAllOrders,
    TResult? Function(_LoadRefusalOrders value)? loadRefusalOrders,
    TResult? Function(_LoadAdoptedOrders value)? loadAdoptedOrders,
    TResult? Function(_LoadCompletedOrders value)? loadCompletedOrders,
    TResult? Function(_CancelOrder value)? cancelOrder,
    TResult? Function(_AddScore value)? addScore,
  }) {
    return loadAdoptedOrders?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddOrder value)? addOrder,
    TResult Function(_LoadAllOrders value)? loadAllOrders,
    TResult Function(_LoadRefusalOrders value)? loadRefusalOrders,
    TResult Function(_LoadAdoptedOrders value)? loadAdoptedOrders,
    TResult Function(_LoadCompletedOrders value)? loadCompletedOrders,
    TResult Function(_CancelOrder value)? cancelOrder,
    TResult Function(_AddScore value)? addScore,
    required TResult orElse(),
  }) {
    if (loadAdoptedOrders != null) {
      return loadAdoptedOrders(this);
    }
    return orElse();
  }
}

abstract class _LoadAdoptedOrders implements OrderEvent {
  const factory _LoadAdoptedOrders() = _$LoadAdoptedOrdersImpl;
}

/// @nodoc
abstract class _$$LoadCompletedOrdersImplCopyWith<$Res> {
  factory _$$LoadCompletedOrdersImplCopyWith(_$LoadCompletedOrdersImpl value,
          $Res Function(_$LoadCompletedOrdersImpl) then) =
      __$$LoadCompletedOrdersImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadCompletedOrdersImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$LoadCompletedOrdersImpl>
    implements _$$LoadCompletedOrdersImplCopyWith<$Res> {
  __$$LoadCompletedOrdersImplCopyWithImpl(_$LoadCompletedOrdersImpl _value,
      $Res Function(_$LoadCompletedOrdersImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadCompletedOrdersImpl implements _LoadCompletedOrders {
  const _$LoadCompletedOrdersImpl();

  @override
  String toString() {
    return 'OrderEvent.loadCompletedOrders()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadCompletedOrdersImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OrderModel order, List<String> petIds) addOrder,
    required TResult Function() loadAllOrders,
    required TResult Function() loadRefusalOrders,
    required TResult Function() loadAdoptedOrders,
    required TResult Function() loadCompletedOrders,
    required TResult Function(String orderId) cancelOrder,
    required TResult Function(Score score) addScore,
  }) {
    return loadCompletedOrders();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OrderModel order, List<String> petIds)? addOrder,
    TResult? Function()? loadAllOrders,
    TResult? Function()? loadRefusalOrders,
    TResult? Function()? loadAdoptedOrders,
    TResult? Function()? loadCompletedOrders,
    TResult? Function(String orderId)? cancelOrder,
    TResult? Function(Score score)? addScore,
  }) {
    return loadCompletedOrders?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OrderModel order, List<String> petIds)? addOrder,
    TResult Function()? loadAllOrders,
    TResult Function()? loadRefusalOrders,
    TResult Function()? loadAdoptedOrders,
    TResult Function()? loadCompletedOrders,
    TResult Function(String orderId)? cancelOrder,
    TResult Function(Score score)? addScore,
    required TResult orElse(),
  }) {
    if (loadCompletedOrders != null) {
      return loadCompletedOrders();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddOrder value) addOrder,
    required TResult Function(_LoadAllOrders value) loadAllOrders,
    required TResult Function(_LoadRefusalOrders value) loadRefusalOrders,
    required TResult Function(_LoadAdoptedOrders value) loadAdoptedOrders,
    required TResult Function(_LoadCompletedOrders value) loadCompletedOrders,
    required TResult Function(_CancelOrder value) cancelOrder,
    required TResult Function(_AddScore value) addScore,
  }) {
    return loadCompletedOrders(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddOrder value)? addOrder,
    TResult? Function(_LoadAllOrders value)? loadAllOrders,
    TResult? Function(_LoadRefusalOrders value)? loadRefusalOrders,
    TResult? Function(_LoadAdoptedOrders value)? loadAdoptedOrders,
    TResult? Function(_LoadCompletedOrders value)? loadCompletedOrders,
    TResult? Function(_CancelOrder value)? cancelOrder,
    TResult? Function(_AddScore value)? addScore,
  }) {
    return loadCompletedOrders?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddOrder value)? addOrder,
    TResult Function(_LoadAllOrders value)? loadAllOrders,
    TResult Function(_LoadRefusalOrders value)? loadRefusalOrders,
    TResult Function(_LoadAdoptedOrders value)? loadAdoptedOrders,
    TResult Function(_LoadCompletedOrders value)? loadCompletedOrders,
    TResult Function(_CancelOrder value)? cancelOrder,
    TResult Function(_AddScore value)? addScore,
    required TResult orElse(),
  }) {
    if (loadCompletedOrders != null) {
      return loadCompletedOrders(this);
    }
    return orElse();
  }
}

abstract class _LoadCompletedOrders implements OrderEvent {
  const factory _LoadCompletedOrders() = _$LoadCompletedOrdersImpl;
}

/// @nodoc
abstract class _$$CancelOrderImplCopyWith<$Res> {
  factory _$$CancelOrderImplCopyWith(
          _$CancelOrderImpl value, $Res Function(_$CancelOrderImpl) then) =
      __$$CancelOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String orderId});
}

/// @nodoc
class __$$CancelOrderImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$CancelOrderImpl>
    implements _$$CancelOrderImplCopyWith<$Res> {
  __$$CancelOrderImplCopyWithImpl(
      _$CancelOrderImpl _value, $Res Function(_$CancelOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
  }) {
    return _then(_$CancelOrderImpl(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CancelOrderImpl implements _CancelOrder {
  const _$CancelOrderImpl({required this.orderId});

  @override
  final String orderId;

  @override
  String toString() {
    return 'OrderEvent.cancelOrder(orderId: $orderId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelOrderImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderId);

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelOrderImplCopyWith<_$CancelOrderImpl> get copyWith =>
      __$$CancelOrderImplCopyWithImpl<_$CancelOrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OrderModel order, List<String> petIds) addOrder,
    required TResult Function() loadAllOrders,
    required TResult Function() loadRefusalOrders,
    required TResult Function() loadAdoptedOrders,
    required TResult Function() loadCompletedOrders,
    required TResult Function(String orderId) cancelOrder,
    required TResult Function(Score score) addScore,
  }) {
    return cancelOrder(orderId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OrderModel order, List<String> petIds)? addOrder,
    TResult? Function()? loadAllOrders,
    TResult? Function()? loadRefusalOrders,
    TResult? Function()? loadAdoptedOrders,
    TResult? Function()? loadCompletedOrders,
    TResult? Function(String orderId)? cancelOrder,
    TResult? Function(Score score)? addScore,
  }) {
    return cancelOrder?.call(orderId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OrderModel order, List<String> petIds)? addOrder,
    TResult Function()? loadAllOrders,
    TResult Function()? loadRefusalOrders,
    TResult Function()? loadAdoptedOrders,
    TResult Function()? loadCompletedOrders,
    TResult Function(String orderId)? cancelOrder,
    TResult Function(Score score)? addScore,
    required TResult orElse(),
  }) {
    if (cancelOrder != null) {
      return cancelOrder(orderId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddOrder value) addOrder,
    required TResult Function(_LoadAllOrders value) loadAllOrders,
    required TResult Function(_LoadRefusalOrders value) loadRefusalOrders,
    required TResult Function(_LoadAdoptedOrders value) loadAdoptedOrders,
    required TResult Function(_LoadCompletedOrders value) loadCompletedOrders,
    required TResult Function(_CancelOrder value) cancelOrder,
    required TResult Function(_AddScore value) addScore,
  }) {
    return cancelOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddOrder value)? addOrder,
    TResult? Function(_LoadAllOrders value)? loadAllOrders,
    TResult? Function(_LoadRefusalOrders value)? loadRefusalOrders,
    TResult? Function(_LoadAdoptedOrders value)? loadAdoptedOrders,
    TResult? Function(_LoadCompletedOrders value)? loadCompletedOrders,
    TResult? Function(_CancelOrder value)? cancelOrder,
    TResult? Function(_AddScore value)? addScore,
  }) {
    return cancelOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddOrder value)? addOrder,
    TResult Function(_LoadAllOrders value)? loadAllOrders,
    TResult Function(_LoadRefusalOrders value)? loadRefusalOrders,
    TResult Function(_LoadAdoptedOrders value)? loadAdoptedOrders,
    TResult Function(_LoadCompletedOrders value)? loadCompletedOrders,
    TResult Function(_CancelOrder value)? cancelOrder,
    TResult Function(_AddScore value)? addScore,
    required TResult orElse(),
  }) {
    if (cancelOrder != null) {
      return cancelOrder(this);
    }
    return orElse();
  }
}

abstract class _CancelOrder implements OrderEvent {
  const factory _CancelOrder({required final String orderId}) =
      _$CancelOrderImpl;

  String get orderId;

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CancelOrderImplCopyWith<_$CancelOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddScoreImplCopyWith<$Res> {
  factory _$$AddScoreImplCopyWith(
          _$AddScoreImpl value, $Res Function(_$AddScoreImpl) then) =
      __$$AddScoreImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Score score});
}

/// @nodoc
class __$$AddScoreImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$AddScoreImpl>
    implements _$$AddScoreImplCopyWith<$Res> {
  __$$AddScoreImplCopyWithImpl(
      _$AddScoreImpl _value, $Res Function(_$AddScoreImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score = null,
  }) {
    return _then(_$AddScoreImpl(
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as Score,
    ));
  }
}

/// @nodoc

class _$AddScoreImpl implements _AddScore {
  const _$AddScoreImpl({required this.score});

  @override
  final Score score;

  @override
  String toString() {
    return 'OrderEvent.addScore(score: $score)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddScoreImpl &&
            (identical(other.score, score) || other.score == score));
  }

  @override
  int get hashCode => Object.hash(runtimeType, score);

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddScoreImplCopyWith<_$AddScoreImpl> get copyWith =>
      __$$AddScoreImplCopyWithImpl<_$AddScoreImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OrderModel order, List<String> petIds) addOrder,
    required TResult Function() loadAllOrders,
    required TResult Function() loadRefusalOrders,
    required TResult Function() loadAdoptedOrders,
    required TResult Function() loadCompletedOrders,
    required TResult Function(String orderId) cancelOrder,
    required TResult Function(Score score) addScore,
  }) {
    return addScore(score);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OrderModel order, List<String> petIds)? addOrder,
    TResult? Function()? loadAllOrders,
    TResult? Function()? loadRefusalOrders,
    TResult? Function()? loadAdoptedOrders,
    TResult? Function()? loadCompletedOrders,
    TResult? Function(String orderId)? cancelOrder,
    TResult? Function(Score score)? addScore,
  }) {
    return addScore?.call(score);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OrderModel order, List<String> petIds)? addOrder,
    TResult Function()? loadAllOrders,
    TResult Function()? loadRefusalOrders,
    TResult Function()? loadAdoptedOrders,
    TResult Function()? loadCompletedOrders,
    TResult Function(String orderId)? cancelOrder,
    TResult Function(Score score)? addScore,
    required TResult orElse(),
  }) {
    if (addScore != null) {
      return addScore(score);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddOrder value) addOrder,
    required TResult Function(_LoadAllOrders value) loadAllOrders,
    required TResult Function(_LoadRefusalOrders value) loadRefusalOrders,
    required TResult Function(_LoadAdoptedOrders value) loadAdoptedOrders,
    required TResult Function(_LoadCompletedOrders value) loadCompletedOrders,
    required TResult Function(_CancelOrder value) cancelOrder,
    required TResult Function(_AddScore value) addScore,
  }) {
    return addScore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddOrder value)? addOrder,
    TResult? Function(_LoadAllOrders value)? loadAllOrders,
    TResult? Function(_LoadRefusalOrders value)? loadRefusalOrders,
    TResult? Function(_LoadAdoptedOrders value)? loadAdoptedOrders,
    TResult? Function(_LoadCompletedOrders value)? loadCompletedOrders,
    TResult? Function(_CancelOrder value)? cancelOrder,
    TResult? Function(_AddScore value)? addScore,
  }) {
    return addScore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddOrder value)? addOrder,
    TResult Function(_LoadAllOrders value)? loadAllOrders,
    TResult Function(_LoadRefusalOrders value)? loadRefusalOrders,
    TResult Function(_LoadAdoptedOrders value)? loadAdoptedOrders,
    TResult Function(_LoadCompletedOrders value)? loadCompletedOrders,
    TResult Function(_CancelOrder value)? cancelOrder,
    TResult Function(_AddScore value)? addScore,
    required TResult orElse(),
  }) {
    if (addScore != null) {
      return addScore(this);
    }
    return orElse();
  }
}

abstract class _AddScore implements OrderEvent {
  const factory _AddScore({required final Score score}) = _$AddScoreImpl;

  Score get score;

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddScoreImplCopyWith<_$AddScoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrderState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TaskModel> tasks) loaded,
    required TResult Function(String message) failure,
    required TResult Function() successAddScore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TaskModel> tasks)? loaded,
    TResult? Function(String message)? failure,
    TResult? Function()? successAddScore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TaskModel> tasks)? loaded,
    TResult Function(String message)? failure,
    TResult Function()? successAddScore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
    required TResult Function(_SuccessAddRating value) successAddScore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_SuccessAddRating value)? successAddScore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    TResult Function(_SuccessAddRating value)? successAddScore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStateCopyWith<$Res> {
  factory $OrderStateCopyWith(
          OrderState value, $Res Function(OrderState) then) =
      _$OrderStateCopyWithImpl<$Res, OrderState>;
}

/// @nodoc
class _$OrderStateCopyWithImpl<$Res, $Val extends OrderState>
    implements $OrderStateCopyWith<$Res> {
  _$OrderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderState
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
    extends _$OrderStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'OrderState.initial()';
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
    required TResult Function(List<TaskModel> tasks) loaded,
    required TResult Function(String message) failure,
    required TResult Function() successAddScore,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TaskModel> tasks)? loaded,
    TResult? Function(String message)? failure,
    TResult? Function()? successAddScore,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TaskModel> tasks)? loaded,
    TResult Function(String message)? failure,
    TResult Function()? successAddScore,
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
    required TResult Function(_SuccessAddRating value) successAddScore,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_SuccessAddRating value)? successAddScore,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    TResult Function(_SuccessAddRating value)? successAddScore,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements OrderState {
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
    extends _$OrderStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'OrderState.loading()';
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
    required TResult Function(List<TaskModel> tasks) loaded,
    required TResult Function(String message) failure,
    required TResult Function() successAddScore,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TaskModel> tasks)? loaded,
    TResult? Function(String message)? failure,
    TResult? Function()? successAddScore,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TaskModel> tasks)? loaded,
    TResult Function(String message)? failure,
    TResult Function()? successAddScore,
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
    required TResult Function(_SuccessAddRating value) successAddScore,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_SuccessAddRating value)? successAddScore,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    TResult Function(_SuccessAddRating value)? successAddScore,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements OrderState {
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
    extends _$OrderStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderState
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
    return 'OrderState.loaded(tasks: $tasks)';
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

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TaskModel> tasks) loaded,
    required TResult Function(String message) failure,
    required TResult Function() successAddScore,
  }) {
    return loaded(tasks);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TaskModel> tasks)? loaded,
    TResult? Function(String message)? failure,
    TResult? Function()? successAddScore,
  }) {
    return loaded?.call(tasks);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TaskModel> tasks)? loaded,
    TResult Function(String message)? failure,
    TResult Function()? successAddScore,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
    required TResult Function(_SuccessAddRating value) successAddScore,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_SuccessAddRating value)? successAddScore,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    TResult Function(_SuccessAddRating value)? successAddScore,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements OrderState {
  const factory _Loaded({required final List<TaskModel> tasks}) = _$LoadedImpl;

  List<TaskModel> get tasks;

  /// Create a copy of OrderState
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
    extends _$OrderStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderState
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
    return 'OrderState.failure(message: $message)';
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

  /// Create a copy of OrderState
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
    required TResult Function(List<TaskModel> tasks) loaded,
    required TResult Function(String message) failure,
    required TResult Function() successAddScore,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TaskModel> tasks)? loaded,
    TResult? Function(String message)? failure,
    TResult? Function()? successAddScore,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TaskModel> tasks)? loaded,
    TResult Function(String message)? failure,
    TResult Function()? successAddScore,
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
    required TResult Function(_SuccessAddRating value) successAddScore,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_SuccessAddRating value)? successAddScore,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    TResult Function(_SuccessAddRating value)? successAddScore,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements OrderState {
  const factory _Failure({required final String message}) = _$FailureImpl;

  String get message;

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessAddRatingImplCopyWith<$Res> {
  factory _$$SuccessAddRatingImplCopyWith(_$SuccessAddRatingImpl value,
          $Res Function(_$SuccessAddRatingImpl) then) =
      __$$SuccessAddRatingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessAddRatingImplCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$SuccessAddRatingImpl>
    implements _$$SuccessAddRatingImplCopyWith<$Res> {
  __$$SuccessAddRatingImplCopyWithImpl(_$SuccessAddRatingImpl _value,
      $Res Function(_$SuccessAddRatingImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SuccessAddRatingImpl implements _SuccessAddRating {
  const _$SuccessAddRatingImpl();

  @override
  String toString() {
    return 'OrderState.successAddScore()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessAddRatingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TaskModel> tasks) loaded,
    required TResult Function(String message) failure,
    required TResult Function() successAddScore,
  }) {
    return successAddScore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TaskModel> tasks)? loaded,
    TResult? Function(String message)? failure,
    TResult? Function()? successAddScore,
  }) {
    return successAddScore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TaskModel> tasks)? loaded,
    TResult Function(String message)? failure,
    TResult Function()? successAddScore,
    required TResult orElse(),
  }) {
    if (successAddScore != null) {
      return successAddScore();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
    required TResult Function(_SuccessAddRating value) successAddScore,
  }) {
    return successAddScore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_SuccessAddRating value)? successAddScore,
  }) {
    return successAddScore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    TResult Function(_SuccessAddRating value)? successAddScore,
    required TResult orElse(),
  }) {
    if (successAddScore != null) {
      return successAddScore(this);
    }
    return orElse();
  }
}

abstract class _SuccessAddRating implements OrderState {
  const factory _SuccessAddRating() = _$SuccessAddRatingImpl;
}
