import 'dart:convert';
import 'dart:io';

import 'package:evoltsoft/src/core/utills/error/exceptions.dart';
import 'package:evoltsoft/src/features/chargerdetails/data/models/charging_station_model.dart';
import 'package:evoltsoft/src/features/chargerdetails/domain/entities/charging_station_entity.dart';
import 'package:evoltsoft/src/features/chargerdetails/domain/entities/connector_entity.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

abstract class ChargerDiscoveryRemotedatasource {
  /// Fetches a list of charging stations based on location and filters.
  Future<List<ChargingStationModel>> getNearbyChargers({
    required double latitude,
    required double longitude,
    double radius = 5000, // Default 5 km
    List<ConnectorEntity>? connectorTypes,
    bool? onlyAvailable, // Show only available stations
  });

  /// Searches for charging stations by keyword.
  Future<List<ChargingStationEntity>> searchChargers(String query);

  /// Fetches charging stations based on dynamic filters.
  Future<List<ChargingStationEntity>> filterChargers({
    required Map<String, dynamic> filters,
  });
}

@Singleton(as: ChargerDiscoveryRemotedatasource)
class ChargerDiscoveryRemotedatasourceImpl
    extends ChargerDiscoveryRemotedatasource {
  @override
  Future<List<ChargingStationEntity>> filterChargers({
    required Map<String, dynamic> filters,
  }) {
    // TODO: implement filterChargers
    throw UnimplementedError();
  }

  @override
  Future<List<ChargingStationModel>> getNearbyChargers({
    required double latitude,
    required double longitude,
    double radius = 5000,
    List<ConnectorEntity>? connectorTypes,
    bool? onlyAvailable,
  }) async {
    try {
      // Define base URL (ensure it's correct)
      const String baseUrl =
          "http://127.0.0.1:3000/api/v1/get-near-by-charging-station-list"; // Adjust if needed

      // Prepare request body
      Map<String, dynamic> body = {
        "lat": latitude,
        "long": longitude,
        "radius": radius,
        if (onlyAvailable != null) "onlyAvailable": onlyAvailable,
      };

      // Make HTTP POST request
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode(body),
      );

      // Handle response
      if (response.statusCode == 201 || response.statusCode == 200) {
        print("Success: ${response.body}");
        final encodedJson = response.body;
        return (jsonDecode(encodedJson)['data'] as List)
            .map((e) => ChargingStationModel.fromJson(e))
            .toList();
      } else {
        throw HttpException(
          "Failed to post data. Status Code: ${response.statusCode}",
        );
      }
    } on HttpException catch (e) {
      throw ServerException(errorMessage: e.message, errorCode: "HTTP_ERROR");
    } catch (e) {
      if (e is ServerException) {
        throw ServerException(
          errorMessage: e.errorMessage,
          errorCode: e.errorCode,
        );
      } else {
        throw ServerException(errorMessage: "Unexpected error: $e");
      }
    }
  }

  @override
  Future<List<ChargingStationEntity>> searchChargers(String query) {
    // TODO: implement searchChargers
    throw UnimplementedError();
  }
}
