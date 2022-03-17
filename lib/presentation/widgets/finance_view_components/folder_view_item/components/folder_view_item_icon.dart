part of '../folder_view_item.dart';

class _FolderViewItemIcon extends Container{
  _FolderViewItemIcon({
    Key? key,
    required String? extension
  }) : super(
    key: key,
    height: _FolderViewItemSizes.instance.folderViewItemChildHeight,
    width: _FolderViewItemSizes.instance.folderViewItemChildHeight,
    decoration: _financeItemIconBoxDecoration,
    child: _financeItemIconFrame(
        icon: (extension??"").extensionIcon,
        extension: extension??"-"
    )
  );

  _FolderViewItemIcon.downloading({
    Key? key,
    required int currentStep,
    required int totalStep
  }): super(
      key: key,
      height: _FolderViewItemSizes.instance.folderViewItemChildHeight,
      width: _FolderViewItemSizes.instance.folderViewItemChildHeight,
      decoration: _financeItemIconBoxDecoration,
      child: CommonStepProgressIndicator(
        size: _FolderViewItemSizes.instance.folderViewItemChildHeight,
        fontSize: 12.0,
        currentStep: currentStep,
        totalStep: totalStep,
        textColor: Colors.white,
        unselectedColor: Colors.white,
        selectedColor: ColorConstants.instance.white,
        radialPadding: 3.14159265/100,
      )
  );

  _FolderViewItemIcon.error({
    Key? key
  }) : super(
      key: key,
      height: _FolderViewItemSizes.instance.folderViewItemChildHeight,
      width: _FolderViewItemSizes.instance.folderViewItemChildHeight,
      decoration: _financeItemIconBoxDecoration,
      child: _financeItemIconFrame(
          icon:Icons.error,
          extension: LocaleKeys.folderView_error.tr()
      )
  );
}

BoxDecoration get _financeItemIconBoxDecoration=>BoxDecoration(
  gradient: ColorConstants.instance.primaryBlueGradientLinear,
  borderRadius: BorderRadius.only(
      topLeft: Radius.circular(8.0.r),
      bottomRight: Radius.circular(8.0.r)
  ),
);

Widget _financeItemIconFrame({
  required IconData icon,
  required String? extension
})=>Column(
  mainAxisSize: MainAxisSize.max,
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Expanded(
        child: FractionallySizedBox(
          heightFactor: 0.9,
          alignment: Alignment.bottomCenter,
          child: FittedBox(
            alignment: Alignment.center,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
        )
    ),
    Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0.h, horizontal: 3.0.w),
      child: FontText.inter(
          text: ((extension==null||extension.isEmpty)
              ?LocaleKeys.folderView_unknown.tr()
              :extension).toUpperCase(),
          translate: false,
          color: Colors.white,
          overflow: TextOverflow.clip,
          fontWeight: FontWeight.w400,
          fontSize: 10.0
      )
    )
  ],
);


