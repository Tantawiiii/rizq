sealed class CreateAdStates {}

final class CreateAdInitialState extends CreateAdStates{}

final class CreateAdGettingDataState extends CreateAdStates{}
final class CreateAdGotDataState extends CreateAdStates{}
final class CreateAdGetDataFailureState extends CreateAdStates{
  final String errorMessage;
  CreateAdGetDataFailureState({required this.errorMessage});
}

final class CreateAdChangedImagesState extends CreateAdStates{}
