import 'package:freezed_annotation/freezed_annotation.dart';

part 'train_detail_model.freezed.dart';

@freezed
class TrainDetailModel with _$TrainDetailModel{
  const factory TrainDetailModel({
    required int trainNo,
    required String trainName,
    required List<HaltsModel> schedule,
  }) = _TrainDetailModel;
}

@freezed
class HaltsModel with _$HaltsModel{
  const factory HaltsModel({
    required DateTime time,
    required String station,
  }) = _HaltsModel;
}