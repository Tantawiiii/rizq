
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/enums/enums.dart';
import 'package:rizq/features/plans/logic/payment_cubit.dart';
import 'package:rizq/features/plans/logic/payment_states.dart';
import 'package:rizq/shared_widgets/svg_image.dart';

class PaymentWidget extends StatelessWidget {
  final String svgImagePath;
  final PaymentMethod paymentMethod;
  const PaymentWidget({super.key, required this.svgImagePath, required this.paymentMethod});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentCubit,PaymentStates>(
        builder: (context,state) {
          var cubit = context.read<PaymentCubit>();
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Radio<PaymentMethod>(
                value: paymentMethod,
                groupValue: cubit.selectedPaymentMethod,
                onChanged: (PaymentMethod? value) {
                  if(value != null){
                    cubit.changePaymentMethod(value);
                  }
                },
                fillColor: WidgetStatePropertyAll(AppColors.primaryColor),
                // side:BorderSide(color: AppColors.primaryColor, width: 1),
                // innerRadius: WidgetStatePropertyAll(6.r),
              ),
              SvgImage(svgPath: svgImagePath, width: 70.r, height: 50.r,),
            ],
          );
        }
    );
  }
}