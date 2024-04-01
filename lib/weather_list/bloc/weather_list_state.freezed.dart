// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WeatherListState {
  WeatherResponse? get weatherResponse => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  WeatherListStatus? get weatherListStatus =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeatherListStateCopyWith<WeatherListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherListStateCopyWith<$Res> {
  factory $WeatherListStateCopyWith(
          WeatherListState value, $Res Function(WeatherListState) then) =
      _$WeatherListStateCopyWithImpl<$Res, WeatherListState>;
  @useResult
  $Res call(
      {WeatherResponse? weatherResponse,
      String? errorMessage,
      WeatherListStatus? weatherListStatus});
}

/// @nodoc
class _$WeatherListStateCopyWithImpl<$Res, $Val extends WeatherListState>
    implements $WeatherListStateCopyWith<$Res> {
  _$WeatherListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weatherResponse = freezed,
    Object? errorMessage = freezed,
    Object? weatherListStatus = freezed,
  }) {
    return _then(_value.copyWith(
      weatherResponse: freezed == weatherResponse
          ? _value.weatherResponse
          : weatherResponse // ignore: cast_nullable_to_non_nullable
              as WeatherResponse?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      weatherListStatus: freezed == weatherListStatus
          ? _value.weatherListStatus
          : weatherListStatus // ignore: cast_nullable_to_non_nullable
              as WeatherListStatus?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherListStateImplCopyWith<$Res>
    implements $WeatherListStateCopyWith<$Res> {
  factory _$$WeatherListStateImplCopyWith(_$WeatherListStateImpl value,
          $Res Function(_$WeatherListStateImpl) then) =
      __$$WeatherListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {WeatherResponse? weatherResponse,
      String? errorMessage,
      WeatherListStatus? weatherListStatus});
}

/// @nodoc
class __$$WeatherListStateImplCopyWithImpl<$Res>
    extends _$WeatherListStateCopyWithImpl<$Res, _$WeatherListStateImpl>
    implements _$$WeatherListStateImplCopyWith<$Res> {
  __$$WeatherListStateImplCopyWithImpl(_$WeatherListStateImpl _value,
      $Res Function(_$WeatherListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weatherResponse = freezed,
    Object? errorMessage = freezed,
    Object? weatherListStatus = freezed,
  }) {
    return _then(_$WeatherListStateImpl(
      weatherResponse: freezed == weatherResponse
          ? _value.weatherResponse
          : weatherResponse // ignore: cast_nullable_to_non_nullable
              as WeatherResponse?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      weatherListStatus: freezed == weatherListStatus
          ? _value.weatherListStatus
          : weatherListStatus // ignore: cast_nullable_to_non_nullable
              as WeatherListStatus?,
    ));
  }
}

/// @nodoc

class _$WeatherListStateImpl implements _WeatherListState {
  const _$WeatherListStateImpl(
      {this.weatherResponse, this.errorMessage, this.weatherListStatus});

  @override
  final WeatherResponse? weatherResponse;
  @override
  final String? errorMessage;
  @override
  final WeatherListStatus? weatherListStatus;

  @override
  String toString() {
    return 'WeatherListState(weatherResponse: $weatherResponse, errorMessage: $errorMessage, weatherListStatus: $weatherListStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherListStateImpl &&
            (identical(other.weatherResponse, weatherResponse) ||
                other.weatherResponse == weatherResponse) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.weatherListStatus, weatherListStatus) ||
                other.weatherListStatus == weatherListStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, weatherResponse, errorMessage, weatherListStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherListStateImplCopyWith<_$WeatherListStateImpl> get copyWith =>
      __$$WeatherListStateImplCopyWithImpl<_$WeatherListStateImpl>(
          this, _$identity);
}

abstract class _WeatherListState implements WeatherListState {
  const factory _WeatherListState(
      {final WeatherResponse? weatherResponse,
      final String? errorMessage,
      final WeatherListStatus? weatherListStatus}) = _$WeatherListStateImpl;

  @override
  WeatherResponse? get weatherResponse;
  @override
  String? get errorMessage;
  @override
  WeatherListStatus? get weatherListStatus;
  @override
  @JsonKey(ignore: true)
  _$$WeatherListStateImplCopyWith<_$WeatherListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
