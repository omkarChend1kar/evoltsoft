import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:evoltsoft/src/core/utills/network/dio_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  Connectivity get connectivity => Connectivity();
  @preResolve
  Future<SharedPreferences> get prefs async => await SharedPreferences.getInstance();
  FirebaseAuth get auth => FirebaseAuth.instance;
  DioProvider get dioProvider => DioProvider();
}
