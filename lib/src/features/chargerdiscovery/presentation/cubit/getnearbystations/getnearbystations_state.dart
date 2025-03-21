part of 'getnearbystations_cubit.dart';

abstract class GetNearByStationsState extends Equatable {
  const GetNearByStationsState();

  @override
  List<Object> get props => [];
}

class GetNearByStationsInitial extends GetNearByStationsState {}

class GetNearByStationsLoading extends GetNearByStationsState {}

class GetNearByStationsError extends GetNearByStationsState {
  final Failure failure;
  const GetNearByStationsError({required this.failure});
}

class GetNearByStationsComplete extends GetNearByStationsState {
  final List<ChargingStationDTO> stations;
  final Set<Marker> markers;
  final LatLng userLocation;

  const GetNearByStationsComplete({
    required this.stations,
    required this.markers,
    required this.userLocation,
  });
  @override
  List<Object> get props => [stations, markers, userLocation];
}
