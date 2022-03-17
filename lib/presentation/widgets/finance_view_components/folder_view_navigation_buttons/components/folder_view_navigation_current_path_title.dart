part of '../folder_view_navigation_buttons.dart';

class _FolderViewNavigationCurrentPathTitle extends SizedBox {
  _FolderViewNavigationCurrentPathTitle({
    Key? key,
    required String folderPath
  }) : super(
    key: key,
    width: double.infinity,
    height: _FolderViewNavigationButtonsSizes.instance.folderViewNavigationButtonHeight,
      child: Padding(
        padding: EdgeInsets.only(
          left: 30.0.w,
          right: 15.0.w
        ),
        child: Align(
          alignment: Alignment.topLeft,
          child:  FontText.jost(
            text: "/"+folderPath,
            translate: false,
            fontSize: 16.5,
            fontWeight: FontWeight.normal,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            color: ColorConstants.instance.darkGray,
          ),
        ),
      )
  );

  const _FolderViewNavigationCurrentPathTitle.shrink({Key? key}) : super.shrink(key: key);
}
