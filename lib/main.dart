import 'core/utils/constants/application_constants.dart';
import 'package:easy_localization/easy_localization.dart';

import 'data/data_sources/local/preferences_manager.dart';
import 'package:get_it/get_it.dart';

import 'injector.dart';
import 'root_app.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initializeDependencies();
  await PreferencesManager.prefrencesInit();
  await GetIt.I.allReady();

  await Hive.initFlutter();
  runApp(
    EasyLocalization(
      useOnlyLangCode: true,
      child: const RootApp(),
      supportedLocales: AppConstants.supportedLocales,
      fallbackLocale: AppConstants.trLocale,
      useFallbackTranslations: true,
      path: AppConstants.languagePath,
      saveLocale: true,
    ),
  );
}
