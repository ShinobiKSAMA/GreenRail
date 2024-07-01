import 'package:freezed_annotation/freezed_annotation.dart';

part 'station_model.freezed.dart';

@freezed
class StationModel with _$StationModel{
  const factory StationModel({
    required String name,
    required String city,
    required String code,
  }) = _StationModel;
}