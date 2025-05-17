// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TaskEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadAllTask,
    required TResult Function() loadAcceptedTask,
    required TResult Function() loadCompletedTask,
    required TResult Function(String orderId, Person person) accept,
    required TResult Function(String orderId) complete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadAllTask,
    TResult? Function()? loadAcceptedTask,
    TResult? Function()? loadCompletedTask,
    TResult? Function(String orderId, Person person)? accept,
    TResult? Function(String orderId)? complete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadAllTask,
    TResult Function()? loadAcceptedTask,
    TResult Function()? loadCompletedTask,
    TResult Function(String orderId, Person person)? accept,
    TResult Function(String orderId)? complete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadAllTask value) loadAllTask,
    required TResult Function(_LoadAcceptedTask value) loadAcceptedTask,
    required TResult Function(_LoadCompletedTask value) loadCompletedTask,
    required TResult Function(_Accept value) accept,
    required TResult Function(_Complete value) complete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadAllTask value)? loadAllTask,
    TResult? Function(_LoadAcceptedTask value)? loadAcceptedTask,
    TResult? Function(_LoadCompletedTask value)? loadCompletedTask,
    TResult? Function(_Accept value)? accept,
    TResult? Function(_Complete value)? complete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadAllTask value)? loadAllTask,
    TResult Function(_LoadAcceptedTask value)? loadAcceptedTask,
    TResult Function(_LoadCompletedTask value)? loadCompletedTask,
    TResult Function(_Accept value)? accept,
    TResult Function(_Complete value)? complete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskEventCopyWith<$Res> {
  factory $TaskEventCopyWith(TaskEvent value, $Res Function(TaskEvent) then) =
      _$TaskEventCopyWithImpl<$Res, TaskEvent>;
}

/// @nodoc
class _$TaskEventCopyWithImpl<$Res, $Val extends TaskEvent>
    implements $TaskEventCopyWith<$Res> {
  _$TaskEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadAllTaskImplCopyWith<$Res> {
  factory _$$LoadAllTaskImplCopyWith(
          _$LoadAllTaskImpl value, $Res Function(_$LoadAllTaskImpl) then) =
      __$$LoadAllTaskImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadAllTaskImplCopyWithImpl<$Res>
    extends _$TaskEventCopyWithImpl<$Res, _$LoadAllTaskImpl>
    implements _$$LoadAllTaskImplCopyWith<$Res> {
  __$$LoadAllTaskImplCopyWithImpl(
      _$LoadAllTaskImpl _value, $Res Function(_$LoadAllTaskImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadAllTaskImpl implements _LoadAllTask {
  const _$LoadAllTaskImpl();

  @override
  String toString() {
    return 'TaskEvent.loadAllTask()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadAllTaskImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadAllTask,
    required TResult Function() loadAcceptedTask,
    required TResult Function() loadCompletedTask,
    required TResult Function(String orderId, Person person) accept,
    required TResult Function(String orderId) complete,
  }) {
    return loadAllTask();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadAllTask,
    TResult? Function()? loadAcceptedTask,
    TResult? Function()? loadCompletedTask,
    TResult? Function(String orderId, Person person)? accept,
    TResult? Function(String orderId)? complete,
  }) {
    return loadAllTask?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadAllTask,
    TResult Function()? loadAcceptedTask,
    TResult Function()? loadCompletedTask,
    TResult Function(String orderId, Person person)? accept,
    TResult Function(String orderId)? complete,
    required TResult orElse(),
  }) {
    if (loadAllTask != null) {
      return loadAllTask();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadAllTask value) loadAllTask,
    required TResult Function(_LoadAcceptedTask value) loadAcceptedTask,
    required TResult Function(_LoadCompletedTask value) loadCompletedTask,
    required TResult Function(_Accept value) accept,
    required TResult Function(_Complete value) complete,
  }) {
    return loadAllTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadAllTask value)? loadAllTask,
    TResult? Function(_LoadAcceptedTask value)? loadAcceptedTask,
    TResult? Function(_LoadCompletedTask value)? loadCompletedTask,
    TResult? Function(_Accept value)? accept,
    TResult? Function(_Complete value)? complete,
  }) {
    return loadAllTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadAllTask value)? loadAllTask,
    TResult Function(_LoadAcceptedTask value)? loadAcceptedTask,
    TResult Function(_LoadCompletedTask value)? loadCompletedTask,
    TResult Function(_Accept value)? accept,
    TResult Function(_Complete value)? complete,
    required TResult orElse(),
  }) {
    if (loadAllTask != null) {
      return loadAllTask(this);
    }
    return orElse();
  }
}

abstract class _LoadAllTask implements TaskEvent {
  const factory _LoadAllTask() = _$LoadAllTaskImpl;
}

/// @nodoc
abstract class _$$LoadAcceptedTaskImplCopyWith<$Res> {
  factory _$$LoadAcceptedTaskImplCopyWith(_$LoadAcceptedTaskImpl value,
          $Res Function(_$LoadAcceptedTaskImpl) then) =
      __$$LoadAcceptedTaskImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadAcceptedTaskImplCopyWithImpl<$Res>
    extends _$TaskEventCopyWithImpl<$Res, _$LoadAcceptedTaskImpl>
    implements _$$LoadAcceptedTaskImplCopyWith<$Res> {
  __$$LoadAcceptedTaskImplCopyWithImpl(_$LoadAcceptedTaskImpl _value,
      $Res Function(_$LoadAcceptedTaskImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadAcceptedTaskImpl implements _LoadAcceptedTask {
  const _$LoadAcceptedTaskImpl();

  @override
  String toString() {
    return 'TaskEvent.loadAcceptedTask()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadAcceptedTaskImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadAllTask,
    required TResult Function() loadAcceptedTask,
    required TResult Function() loadCompletedTask,
    required TResult Function(String orderId, Person person) accept,
    required TResult Function(String orderId) complete,
  }) {
    return loadAcceptedTask();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadAllTask,
    TResult? Function()? loadAcceptedTask,
    TResult? Function()? loadCompletedTask,
    TResult? Function(String orderId, Person person)? accept,
    TResult? Function(String orderId)? complete,
  }) {
    return loadAcceptedTask?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadAllTask,
    TResult Function()? loadAcceptedTask,
    TResult Function()? loadCompletedTask,
    TResult Function(String orderId, Person person)? accept,
    TResult Function(String orderId)? complete,
    required TResult orElse(),
  }) {
    if (loadAcceptedTask != null) {
      return loadAcceptedTask();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadAllTask value) loadAllTask,
    required TResult Function(_LoadAcceptedTask value) loadAcceptedTask,
    required TResult Function(_LoadCompletedTask value) loadCompletedTask,
    required TResult Function(_Accept value) accept,
    required TResult Function(_Complete value) complete,
  }) {
    return loadAcceptedTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadAllTask value)? loadAllTask,
    TResult? Function(_LoadAcceptedTask value)? loadAcceptedTask,
    TResult? Function(_LoadCompletedTask value)? loadCompletedTask,
    TResult? Function(_Accept value)? accept,
    TResult? Function(_Complete value)? complete,
  }) {
    return loadAcceptedTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadAllTask value)? loadAllTask,
    TResult Function(_LoadAcceptedTask value)? loadAcceptedTask,
    TResult Function(_LoadCompletedTask value)? loadCompletedTask,
    TResult Function(_Accept value)? accept,
    TResult Function(_Complete value)? complete,
    required TResult orElse(),
  }) {
    if (loadAcceptedTask != null) {
      return loadAcceptedTask(this);
    }
    return orElse();
  }
}

abstract class _LoadAcceptedTask implements TaskEvent {
  const factory _LoadAcceptedTask() = _$LoadAcceptedTaskImpl;
}

/// @nodoc
abstract class _$$LoadCompletedTaskImplCopyWith<$Res> {
  factory _$$LoadCompletedTaskImplCopyWith(_$LoadCompletedTaskImpl value,
          $Res Function(_$LoadCompletedTaskImpl) then) =
      __$$LoadCompletedTaskImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadCompletedTaskImplCopyWithImpl<$Res>
    extends _$TaskEventCopyWithImpl<$Res, _$LoadCompletedTaskImpl>
    implements _$$LoadCompletedTaskImplCopyWith<$Res> {
  __$$LoadCompletedTaskImplCopyWithImpl(_$LoadCompletedTaskImpl _value,
      $Res Function(_$LoadCompletedTaskImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadCompletedTaskImpl implements _LoadCompletedTask {
  const _$LoadCompletedTaskImpl();

  @override
  String toString() {
    return 'TaskEvent.loadCompletedTask()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadCompletedTaskImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadAllTask,
    required TResult Function() loadAcceptedTask,
    required TResult Function() loadCompletedTask,
    required TResult Function(String orderId, Person person) accept,
    required TResult Function(String orderId) complete,
  }) {
    return loadCompletedTask();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadAllTask,
    TResult? Function()? loadAcceptedTask,
    TResult? Function()? loadCompletedTask,
    TResult? Function(String orderId, Person person)? accept,
    TResult? Function(String orderId)? complete,
  }) {
    return loadCompletedTask?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadAllTask,
    TResult Function()? loadAcceptedTask,
    TResult Function()? loadCompletedTask,
    TResult Function(String orderId, Person person)? accept,
    TResult Function(String orderId)? complete,
    required TResult orElse(),
  }) {
    if (loadCompletedTask != null) {
      return loadCompletedTask();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadAllTask value) loadAllTask,
    required TResult Function(_LoadAcceptedTask value) loadAcceptedTask,
    required TResult Function(_LoadCompletedTask value) loadCompletedTask,
    required TResult Function(_Accept value) accept,
    required TResult Function(_Complete value) complete,
  }) {
    return loadCompletedTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadAllTask value)? loadAllTask,
    TResult? Function(_LoadAcceptedTask value)? loadAcceptedTask,
    TResult? Function(_LoadCompletedTask value)? loadCompletedTask,
    TResult? Function(_Accept value)? accept,
    TResult? Function(_Complete value)? complete,
  }) {
    return loadCompletedTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadAllTask value)? loadAllTask,
    TResult Function(_LoadAcceptedTask value)? loadAcceptedTask,
    TResult Function(_LoadCompletedTask value)? loadCompletedTask,
    TResult Function(_Accept value)? accept,
    TResult Function(_Complete value)? complete,
    required TResult orElse(),
  }) {
    if (loadCompletedTask != null) {
      return loadCompletedTask(this);
    }
    return orElse();
  }
}

abstract class _LoadCompletedTask implements TaskEvent {
  const factory _LoadCompletedTask() = _$LoadCompletedTaskImpl;
}

/// @nodoc
abstract class _$$AcceptImplCopyWith<$Res> {
  factory _$$AcceptImplCopyWith(
          _$AcceptImpl value, $Res Function(_$AcceptImpl) then) =
      __$$AcceptImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String orderId, Person person});
}

/// @nodoc
class __$$AcceptImplCopyWithImpl<$Res>
    extends _$TaskEventCopyWithImpl<$Res, _$AcceptImpl>
    implements _$$AcceptImplCopyWith<$Res> {
  __$$AcceptImplCopyWithImpl(
      _$AcceptImpl _value, $Res Function(_$AcceptImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? person = null,
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
    ));
  }
}

/// @nodoc

class _$AcceptImpl implements _Accept {
  const _$AcceptImpl({required this.orderId, required this.person});

  @override
  final String orderId;
  @override
  final Person person;

  @override
  String toString() {
    return 'TaskEvent.accept(orderId: $orderId, person: $person)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AcceptImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.person, person) || other.person == person));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderId, person);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AcceptImplCopyWith<_$AcceptImpl> get copyWith =>
      __$$AcceptImplCopyWithImpl<_$AcceptImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadAllTask,
    required TResult Function() loadAcceptedTask,
    required TResult Function() loadCompletedTask,
    required TResult Function(String orderId, Person person) accept,
    required TResult Function(String orderId) complete,
  }) {
    return accept(orderId, person);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadAllTask,
    TResult? Function()? loadAcceptedTask,
    TResult? Function()? loadCompletedTask,
    TResult? Function(String orderId, Person person)? accept,
    TResult? Function(String orderId)? complete,
  }) {
    return accept?.call(orderId, person);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadAllTask,
    TResult Function()? loadAcceptedTask,
    TResult Function()? loadCompletedTask,
    TResult Function(String orderId, Person person)? accept,
    TResult Function(String orderId)? complete,
    required TResult orElse(),
  }) {
    if (accept != null) {
      return accept(orderId, person);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadAllTask value) loadAllTask,
    required TResult Function(_LoadAcceptedTask value) loadAcceptedTask,
    required TResult Function(_LoadCompletedTask value) loadCompletedTask,
    required TResult Function(_Accept value) accept,
    required TResult Function(_Complete value) complete,
  }) {
    return accept(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadAllTask value)? loadAllTask,
    TResult? Function(_LoadAcceptedTask value)? loadAcceptedTask,
    TResult? Function(_LoadCompletedTask value)? loadCompletedTask,
    TResult? Function(_Accept value)? accept,
    TResult? Function(_Complete value)? complete,
  }) {
    return accept?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadAllTask value)? loadAllTask,
    TResult Function(_LoadAcceptedTask value)? loadAcceptedTask,
    TResult Function(_LoadCompletedTask value)? loadCompletedTask,
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

abstract class _Accept implements TaskEvent {
  const factory _Accept(
      {required final String orderId,
      required final Person person}) = _$AcceptImpl;

  String get orderId;
  Person get person;

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AcceptImplCopyWith<_$AcceptImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CompleteImplCopyWith<$Res> {
  factory _$$CompleteImplCopyWith(
          _$CompleteImpl value, $Res Function(_$CompleteImpl) then) =
      __$$CompleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String orderId});
}

/// @nodoc
class __$$CompleteImplCopyWithImpl<$Res>
    extends _$TaskEventCopyWithImpl<$Res, _$CompleteImpl>
    implements _$$CompleteImplCopyWith<$Res> {
  __$$CompleteImplCopyWithImpl(
      _$CompleteImpl _value, $Res Function(_$CompleteImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
  }) {
    return _then(_$CompleteImpl(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CompleteImpl implements _Complete {
  const _$CompleteImpl({required this.orderId});

  @override
  final String orderId;

  @override
  String toString() {
    return 'TaskEvent.complete(orderId: $orderId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompleteImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderId);

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompleteImplCopyWith<_$CompleteImpl> get copyWith =>
      __$$CompleteImplCopyWithImpl<_$CompleteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadAllTask,
    required TResult Function() loadAcceptedTask,
    required TResult Function() loadCompletedTask,
    required TResult Function(String orderId, Person person) accept,
    required TResult Function(String orderId) complete,
  }) {
    return complete(orderId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadAllTask,
    TResult? Function()? loadAcceptedTask,
    TResult? Function()? loadCompletedTask,
    TResult? Function(String orderId, Person person)? accept,
    TResult? Function(String orderId)? complete,
  }) {
    return complete?.call(orderId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadAllTask,
    TResult Function()? loadAcceptedTask,
    TResult Function()? loadCompletedTask,
    TResult Function(String orderId, Person person)? accept,
    TResult Function(String orderId)? complete,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(orderId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadAllTask value) loadAllTask,
    required TResult Function(_LoadAcceptedTask value) loadAcceptedTask,
    required TResult Function(_LoadCompletedTask value) loadCompletedTask,
    required TResult Function(_Accept value) accept,
    required TResult Function(_Complete value) complete,
  }) {
    return complete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadAllTask value)? loadAllTask,
    TResult? Function(_LoadAcceptedTask value)? loadAcceptedTask,
    TResult? Function(_LoadCompletedTask value)? loadCompletedTask,
    TResult? Function(_Accept value)? accept,
    TResult? Function(_Complete value)? complete,
  }) {
    return complete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadAllTask value)? loadAllTask,
    TResult Function(_LoadAcceptedTask value)? loadAcceptedTask,
    TResult Function(_LoadCompletedTask value)? loadCompletedTask,
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

abstract class _Complete implements TaskEvent {
  const factory _Complete({required final String orderId}) = _$CompleteImpl;

  String get orderId;

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompleteImplCopyWith<_$CompleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TaskState {
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
abstract class $TaskStateCopyWith<$Res> {
  factory $TaskStateCopyWith(TaskState value, $Res Function(TaskState) then) =
      _$TaskStateCopyWithImpl<$Res, TaskState>;
}

/// @nodoc
class _$TaskStateCopyWithImpl<$Res, $Val extends TaskState>
    implements $TaskStateCopyWith<$Res> {
  _$TaskStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskState
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
    extends _$TaskStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'TaskState.loading()';
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

abstract class _Loading implements TaskState {
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
    extends _$TaskStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskState
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
    return 'TaskState.loaded(tasks: $tasks)';
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

  /// Create a copy of TaskState
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

abstract class _Loaded implements TaskState {
  const factory _Loaded({required final List<TaskModel> tasks}) = _$LoadedImpl;

  List<TaskModel> get tasks;

  /// Create a copy of TaskState
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
    extends _$TaskStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskState
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
    return 'TaskState.failure(message: $message)';
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

  /// Create a copy of TaskState
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

abstract class _Failure implements TaskState {
  const factory _Failure({required final String message}) = _$FailureImpl;

  String get message;

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
