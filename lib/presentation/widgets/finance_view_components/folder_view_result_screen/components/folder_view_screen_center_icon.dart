part of '../folder_view_result_screen.dart';

class _FolderViewScreenCenterIcon extends Container {
  _FolderViewScreenCenterIcon({
    Key? key,
    required IconData icon
  }) : super(
    key: key,
    height: 50.0.r,
    width: 50.0.r,
    decoration: BoxDecoration(
        gradient: ColorConstants.instance.primaryBlueGradientLinear,
        borderRadius: BorderRadius.all(Radius.circular(8.0.r))
    ),
    alignment: Alignment.center,
    child: Icon(
      icon,
      color: Colors.white,
      size: 32.r,
    ),
  );
}