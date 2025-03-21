import 'package:evoltsoft/src/features/chargerdiscovery/presentation/cubit/getnearbystations/getnearbystations_cubit.dart';
import 'package:evoltsoft/src/features/chargerdiscovery/presentation/widgets/evoltsoft_charging_station_card_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class ChargingStationMapScreen extends StatefulWidget {
  const ChargingStationMapScreen({super.key});

  @override
  State<ChargingStationMapScreen> createState() =>
      _ChargingStationMapScreenState();
}

class _ChargingStationMapScreenState extends State<ChargingStationMapScreen> {
  GoogleMapController? _mapController;
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create:
          (_) =>
              context.read<GetNearByStationsCubit>()
                ..getNearbyChargingStations(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Evoltsoft"),
          centerTitle: false,
          // leadingWidth: 40,
          titleSpacing: 5,
          leading: Image.asset(
            'assets/images/flash_icon.png',
            width: 30,
            height: 30,
          ),
        ),
        body: BlocBuilder<GetNearByStationsCubit, GetNearByStationsState>(
          builder: (context, state) {
            if (state is GetNearByStationsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is GetNearByStationsError) {
              return Center(
                child: Text(
                  state.failure.message ?? "Failed to get nearby stations.",
                ),
              );
            } else if (state is GetNearByStationsComplete) {
              return Stack(
                children: [
                  GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                      target: state.userLocation,
                      zoom: 14,
                    ),
                    markers:
                        state.markers.map((marker) {
                          return marker.copyWith(
                            onTapParam: () {
                              int index = state.markers.toList().indexOf(
                                marker,
                              );
                              _pageController.animateToPage(
                                index,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                          );
                        }).toSet(),
                    onMapCreated: (controller) {
                      _mapController = controller;
                      _mapController!.animateCamera(
                        CameraUpdate.newLatLngBounds(
                          _getLatLngBounds(state.markers),
                          100,
                        ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 165,
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: state.stations.length,
                            onPageChanged: (index) {
                              final station = state.stations[index];
                              setState(() => _selectedIndex = index);
                              _mapController?.animateCamera(
                                CameraUpdate.newLatLng(
                                  LatLng(station.latitude, station.longitude),
                                ),
                              );
                            },
                            itemBuilder: (context, index) {
                              final station = state.stations[index];
                              return ChargingStationCard(
                                stationName: station.name,
                                address: station.address,
                                operatingHours: station.openHours,
                                status: "Open",
                              );
                            },
                          ),
                        ),
                        //Connector Types Widget
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: colorScheme.surface,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Type Connector",
                                    style: textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                              ...state.stations[_selectedIndex].connectors.map(
                                (e) => ListTile(
                                  leading: Icon(Icons.flash_on),
                                  title: Text(e.type),
                                  trailing: Text(
                                    e.isAvailable
                                        ? "Available"
                                        : "Not Available",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Center(child: Text("Something went wrong"));
            }
          },
        ),
      ),
    );
  }

  LatLngBounds _getLatLngBounds(Set<Marker> markers) {
    double minLat = markers.first.position.latitude;
    double maxLat = markers.first.position.latitude;
    double minLng = markers.first.position.longitude;
    double maxLng = markers.first.position.longitude;

    for (Marker marker in markers) {
      if (marker.position.latitude < minLat) minLat = marker.position.latitude;
      if (marker.position.latitude > maxLat) maxLat = marker.position.latitude;
      if (marker.position.longitude < minLng) {
        minLng = marker.position.longitude;
      }
      if (marker.position.longitude > maxLng) {
        maxLng = marker.position.longitude;
      }
    }

    return LatLngBounds(
      southwest: LatLng(minLat, minLng),
      northeast: LatLng(maxLat, maxLng),
    );
  }
}

class EvoltsoftNearbyChargingStationsPage extends StatelessWidget {
  static const route = "/nearby_charging_stations";
  const EvoltsoftNearbyChargingStationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChargingStationMapScreen();
  }
}
