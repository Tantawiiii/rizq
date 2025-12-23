import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/di/inject.dart';
import 'package:rizq/core/enums/enums.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/theme/theme.dart';
import 'package:rizq/features/plans/logic/payment_cubit.dart';
import 'package:rizq/features/plans/ui/widgets/payment_widget.dart';
import 'package:rizq/generated/locale_keys.g.dart';
import 'package:rizq/shared_widgets/app_bar_backbutton.dart';
import 'package:rizq/shared_widgets/primary_button.dart';


class WalletRechargeScreen extends StatefulWidget {
  const WalletRechargeScreen({super.key});

  @override
  State<WalletRechargeScreen> createState() => _WalletRechargeScreenState();
}

class _WalletRechargeScreenState extends State<WalletRechargeScreen> {
  final TextEditingController _amountController = TextEditingController();
  double _chargeAmount = 0;
  double _serviceFees = 100;
  double get _total => _chargeAmount + _serviceFees;

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>sl<PaymentCubit>(),
      child: Scaffold(
        appBar: AppBar(
          leading: AppBarBackButton(),
          title: Text(
            LocaleKeys.Settings_rechargeWallet.tr(context: context),
          ),
        ),
        backgroundColor: AppColors.whiteBackground,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(

                child: Container(
                  //duration: 400.ms,
                  padding: EdgeInsets.all(AppTheme.defaultEdgePadding),
                  margin: EdgeInsets.symmetric(horizontal: AppTheme.defaultEdgePadding),
                  decoration: BoxDecoration(
                    color: AppColors.scaffoldCyanColor,
                    borderRadius: BorderRadius.circular(16.r),

                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 20.r,
                    children: [
                      _buildAmountInput(),

                      _buildPaymentMethods(),
                      if(_chargeAmount != 0)
                      _buildPurchaseSummary(),

                      PrimaryButton(
                        title: 'AppTexts.confirmPayment',
                        backgroundColor: AppColors.primaryColor,
                        onPressed: () {
                          // TODO: PASS AMOUNT TO CHARGE AND FEE TO PAYMENT CUBIT
                          //  (CUBIT ITSELF HANDLES THE SELECTION OF PAYMENT METHODS )

                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildAmountInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.Settings_enterAmountOfMoney.tr(),
          style: AppTextStyles.cairoTextStyle(
            color: AppColors.greyTextColor,
            size: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        12.verticalSpace,
        Container(
          height: 56.h,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.textFieldBorderColor),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: TextField(
            controller: _amountController,
            textAlign: TextAlign.start,
            style: AppTextStyles.cairoTextStyle(
              color: AppColors.primaryColor,
              size: 16,
              fontWeight: FontWeight.w600,
            ),
            textInputAction: TextInputAction.done,
            //textDirection: ui.TextDirection.ltr,

            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '150000 ل.س',
              hintStyle: AppTextStyles.cairoTextStyle(
                color: AppColors.fieldHintColor,
                size: 15,
              ),
              contentPadding: EdgeInsets.zero,
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (s){
              if(s.isEmpty){
                setState(() {
                  _chargeAmount = 0;
                });
              }
              if(s.isNotEmpty && double.tryParse(s) != null){
                setState(() {
                  _chargeAmount = double.parse(s);
                });
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentMethods() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.createAd_paymentMethod.tr(),
          style: AppTextStyles.cairoTextStyle(
            color: AppColors.primaryColor,
            size: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        16.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            PaymentWidget(svgImagePath: AppAssets.paypalIconSvg, paymentMethod: PaymentMethod.paypal,),
            PaymentWidget(svgImagePath: AppAssets.stripeIconSvg, paymentMethod: PaymentMethod.stripe),
            PaymentWidget(svgImagePath: AppAssets.mastercardIconSvg, paymentMethod: PaymentMethod.masterCard),
          ],
        ),
      ],
    );
  }

  Widget _buildPurchaseSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.createAd_paymentSummary.tr(),
          style: AppTextStyles.cairoTextStyle(
            color: AppColors.primaryColor,
            size: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        16.verticalSpace,
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.textFieldBorderColor, width: .5),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            children: [
              _buildSummaryRow(
              LocaleKeys.createAd_amountCharge.tr()
              , LocaleKeys.createAd_distinguishAdPrice.tr(context: context,args: [_chargeAmount.toString()])

              ),

              16.verticalSpace,
              _buildSummaryRow(
                  LocaleKeys.createAd_serviceMargin.tr()
                  , LocaleKeys.createAd_distinguishAdPrice.tr(context: context,args: [_serviceFees.toString()])

              ),
              16.verticalSpace,
              _buildSummaryRow(LocaleKeys.createAd_totalPrice.tr(),
                  LocaleKeys.createAd_distinguishAdPrice.tr(context: context,args: [_total.toString()])
            , isTotal: true),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          textAlign: TextAlign.start,
          style: AppTextStyles.cairoTextStyle(
            color: AppColors.primaryColor,
            size: isTotal ? 18 : 14,
            fontWeight: isTotal ? FontWeight.w700 : FontWeight.w600,
          )),
        Text(
          value,
          textAlign: TextAlign.end,
          style: AppTextStyles.cairoTextStyle(
            color: AppColors.sconderyColor,
            size: isTotal ? 18 : 14,
            fontWeight: FontWeight.w700,
          ),
        ),


      ],
    );
  }
}
