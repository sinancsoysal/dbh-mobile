import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  PreferencesManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }

  static final PreferencesManager _instance = PreferencesManager._init();

  SharedPreferences? _preferences;

  static PreferencesManager get instance => _instance;

  static Future prefrencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
  }

  Future<void> clearAll() async {
    await _preferences!.clear();
  }

  Future<void> clearAllSaveFirst() async {
    if (_preferences != null) {
      await _preferences!.clear();
      await setBoolValue(PreferencesKeys.isFirstApp, true);
    }
  }

  Future<bool> setStringValue(PreferencesKeys key, String value) async {
    return await _preferences!.setString(key.toString(), value);
  }

  Future<void> setBoolValue(PreferencesKeys key, bool value) async {
    await _preferences!.setBool(key.toString(), value);
  }

  String getStringValue(PreferencesKeys key) =>
      _preferences?.getString(key.toString()) ?? '';

  bool getBoolValue(PreferencesKeys key) =>
      _preferences!.getBool(key.toString()) ?? false;

  Future<void> setStringList(PreferencesKeys key, List<String> value)=>_preferences!.setStringList(
      key.toString(),
      value
  );

  List<String> getStringList(PreferencesKeys key) => _preferences!.getStringList(key.toString())??[];
}

enum PreferencesKeys {
  token,
  refreshToken,
  userName,
  xarea,
  xareaName,
  selectedTheme,
  isFirstApp,
  ///[selectedApplicationRoute] will use for decide to which drawer buttons will draw and which
  ///view will be navigated while application usage.
  selectedApplicationRoute,
  ///[fmDbhAuthToken] will use at fm.dbhsystems request - cookie and x-auth headers.
  ///you can think it's smilar to our token.
  fmDbhAuthToken,

  ///ForFmDbhApi, downloaded items name list, it will be used on delete operation that items.
  downloadedFilesNameList
}
