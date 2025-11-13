import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/features/auth/widgets/register_progrss_circles/progress_container.dart';

class RegisterProgressCircles extends StatelessWidget {
  final List<String> phases;
  final int currentPhaseIndex;
  const RegisterProgressCircles({
    super.key,
    required this.phases,
    required this.currentPhaseIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: .1 * context.screenWidth),
          child: Row(

            crossAxisAlignment: CrossAxisAlignment.center,
            children: phases.map((phase) {
              int phaseIndex = phases.indexOf(phase);
              if(phaseIndex == phases.length-1){
                return ProgressContainer(
                  phaseNumber: phaseIndex + 1,
                  isCompleted: phaseIndex < currentPhaseIndex,
                  isCurrent: phaseIndex == currentPhaseIndex,
                );
              }
              return Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ProgressContainer(
                      phaseNumber: phaseIndex + 1,
                      isCompleted: phaseIndex < currentPhaseIndex,
                      isCurrent: phaseIndex == currentPhaseIndex,
                    ),
                    if(phaseIndex != phases.length -1)
                      Expanded(
                        child: Container(
                          height: 1.r,
                          color: Color(0xff475467),
                        ),
                      ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        15.vGap,
        Row(
          children: phases
              .map(
                (phase) => Expanded(
                  child: Text(
                    phase,
                    style: AppTextStyles.poppinsTextStyle(
                      size: 12,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
