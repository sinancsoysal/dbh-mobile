part of '../folder_view_navigation_buttons.dart';

class _FolderViewNavigationButton extends GestureDetector {
  _FolderViewNavigationButton.rootFolderNavigatorButton({
    Key? key,
    required FutureOr<void> Function() navigatorFunction
  }) : super(
    key: key,
    onTap: navigatorFunction,
    child: _folderViewNavigationButtonFrame(Icons.home)
  );

  _FolderViewNavigationButton.previousFolderNavigatorButton({
    Key? key,
    required FutureOr<void> Function() navigatorFunction
  }) : super(
      key: key,
      onTap: navigatorFunction,
      child: _folderViewNavigationButtonFrame(Icons.arrow_back_ios_rounded)
  );
}


Container _folderViewNavigationButtonFrame(IconData icon)=>Container(
  height: _FolderViewNavigationButtonsSizes.instance.folderViewNavigationButtonHeight,
  width: _FolderViewNavigationButtonsSizes.instance.folderViewNavigationButtonHeight,
  margin: _FolderViewNavigationButtonsVariables.instance._folderViewNavigationButtonMargin,
  decoration: BoxDecoration(
    gradient: ColorConstants.instance.primaryBlueGradientLinear,
    borderRadius: BorderRadius.all(Radius.circular(8.0.r)),
  ),
  child: FractionallySizedBox(
    heightFactor: 0.7,
    alignment: Alignment.center,
    child: FittedBox(
      alignment: Alignment.center,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    ),
  ),
);
