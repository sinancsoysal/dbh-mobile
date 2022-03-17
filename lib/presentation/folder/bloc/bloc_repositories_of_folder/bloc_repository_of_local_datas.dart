part of '../../view/folder_view.dart';

class _BlocRepositoryOfLocalDatas{
  const _BlocRepositoryOfLocalDatas();

  String? get getCachedToken => PreferencesManager.instance.getStringValue(PreferencesKeys.token);
  String? get getCachedxArea => PreferencesManager.instance.getStringValue(PreferencesKeys.xarea);
  String? get getFmDbhAuthToken => PreferencesManager.instance.getStringValue(PreferencesKeys.fmDbhAuthToken);
}