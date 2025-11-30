sealed class UpdateAdStates {}

final class UpdateAdInitialState extends UpdateAdStates{}

final class UpdateAdGettingDataState extends UpdateAdStates{}
final class UpdateAdGotDataState extends UpdateAdStates{}
final class UpdateAdGetDataFailureState extends UpdateAdStates{
  final String errorMessage;
  UpdateAdGetDataFailureState({required this.errorMessage});
}

final class UpdateAdChangedImagesState extends UpdateAdStates{}
