// ignore_for_file: constant_identifier_names
import 'fm_dbh_api_param_constants.dart';

class FmDbhApiRouteConstants{
  static const BASE_URL = FmDbhApiRouteParamConstants.BASE_URL_PARAM
      + FmDbhApiRouteParamConstants.VERSION_NUMBER_PARAM;

  // Login Routes
  static const login = "/login";

  // Resources Routes
  static const resources="/resources"+FmDbhApiRouteParamConstants.PARAMS_PATH;

  // File Routes
  static const raw="/raw";
}