import '../extensions/string/image_extension.dart';

class ImageConstants {
  ImageConstants._init();

  static ImageConstants? _instance;

  static ImageConstants get instance => _instance ??= ImageConstants._init();

  // Images
  String get globalSolutions => "global_solutions".imageToPng;

  String get dbhSystems => "dbh_systems".imageToPng;

  String get dbh => "dbh".imageToPng;

  String get rectangle => "rectangle".imageToPng;

  String get profileBackground => "profile_background".imageToPng;

  String get profilePhoto => "profile_photo".imageToPng;

  // ICONS
  String get menuIcon => "menu_icon".iconToPng;

  String get searchIcon => "search_icon".iconToPng;

  String get microphoneIcon => "microphone_icon".iconToPng;

  String get reloadIcon => "reload_icon".iconToPng;

  // ICONS
  // APPLICATION_ICONS
  String get costControlApplicationIcon =>
      "cost_control_application_icon".applicationIconToPng;

  String get reportApplicationIcon =>
      "report_application_icon".applicationIconToPng;

  String get progressPaymentApplicationIcon =>
      "progress_payment_application_icon".applicationIconToPng;

  String get folderApplicationIcon =>
      "folder_control_application_icon".applicationIconToPng;

  String get generalSituationApplicationIcon =>
      "general_situation_application_icon".applicationIconToPng;

  // ICONS
  // DRAWER_ICONS

  String get drawerHomeIcon => "home_icon".drawerIconToPng;

  String get drawerProfileIcon => "profile_icon".drawerIconToPng;

  String get drawerReportsIcon => "reports_icon".drawerIconToPng;

  String get drawerSearchIcon => "search_icon".drawerIconToPng;

  String get drawerActivityLog => "activity_log_icon".drawerIconToPng;

  String get drawerSettingsIcon => "settings_icon".drawerIconToPng;

  String get drawerAppsIcon => "apps_icon".drawerIconToPng;

  ///FolderViewIcons
  String get folderViewAttachedFileIcon=>"attached_file".folderViewIconToPng;
  String get folderViewCrossWithCircleIcon=>"cross_with_circle".folderViewIconToPng;
  String get folderViewEyeWithCrossIcon=>"eye_with_cross".folderViewIconToPng;
  String get folderViewLockIcon=>"lock".folderViewIconToPng;
  String get folderViewNavigationRouteIcon=>"navigation_route".folderViewIconToPng;
  String get folderViewQuestionMarkIcon=>"question_mark".folderViewIconToPng;
  String get folderViewStepsIcon=>"steps".folderViewIconToPng;
  String get folderViewStopHandIcon=>"stop_hand".folderViewIconToPng;
  String get folderViewTelescopeIcon=>"telescope".folderViewIconToPng;

}
