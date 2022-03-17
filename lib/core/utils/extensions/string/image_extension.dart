extension ImageExtension on String {
  String get iconToPng => 'assets/icons/$this.png';

  String get applicationIconToPng =>
      'assets/icons/application_icons/$this.png';
  String get drawerIconToPng =>
      'assets/icons/drawer_icons/$this.png';
  String get folderViewIconToPng=>'assets/icons/folder_view_icons/$this.png';

  String get imageToPng => 'assets/images/$this.png';
}
