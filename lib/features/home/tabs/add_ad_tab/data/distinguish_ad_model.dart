import 'package:equatable/equatable.dart';

final class DistinguishAdModel extends Equatable {
  final int noDaysToMarketAd;
  final double pricePerDay;
  final int watchFactor;

  const DistinguishAdModel(this.noDaysToMarketAd, this.pricePerDay, this.watchFactor);

  @override
  // TODO: implement props
  List<Object?> get props => [noDaysToMarketAd, pricePerDay, watchFactor];

}