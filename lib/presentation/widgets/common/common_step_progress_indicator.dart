import 'dart:math' show pi;
import 'package:mobile/core/utils/constants/color_constants.dart';
import 'package:mobile/presentation/widgets/common/font_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonStepProgressIndicator extends SizedBox {
  CommonStepProgressIndicator({
    Key? key,
    required double size,
    required double fontSize,
    required int currentStep,
    required int totalStep,
    Color? selectedColor,
    Color? unselectedColor,
    Color? textColor,
    ///RadialPadding must be: pi/padding percent
    double? radialPadding
  }) : super(
      key: key,
      width: size,
      height: size,
      child: FractionallySizedBox(
          heightFactor: 0.8,
          widthFactor: 0.8,
          alignment: Alignment.center,
          child: CircularStepProgressIndicator(
              totalSteps: 100,
              currentStep: (totalStep>0 && currentStep>=0)
                  ?((currentStep/totalStep)*100).floor()
                  :0,
              selectedStepSize: size*0.15,
              unselectedStepSize: size*0.03,
              stepSize: 3.r,
              padding: radialPadding??(pi/100),
              startingAngle: 0,
              width: double.infinity,
              height: double.infinity,
              unselectedColor: unselectedColor??ColorConstants.instance.white,
              selectedColor: selectedColor??ColorConstants.instance.primaryBlue,
              child: SizedBox(
                width: size*0.75,
                height: size*0.75,
                child: Padding(
                  padding: EdgeInsets.all(size*0.025),
                  child: Center(
                    child: FontText.jost(
                      text: "${
                          (totalStep>0 && currentStep>=0)
                              ?((currentStep/totalStep)*100).floor()
                              :0
                      }%",
                      translate: false,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.bold,
                      color: textColor??ColorConstants.instance.white,
                      fontSize: fontSize
                    ),
                  )
                ),
              )
          )
      )
  );
}
