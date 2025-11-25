import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/constant/app_texts.dart';
import 'package:rizq/core/shared_widgets/primary_button.dart';
import 'package:rizq/core/theme/app_text_styles.dart';


class WalletRechargeScreen extends StatefulWidget {
  const WalletRechargeScreen({super.key});

  @override
  State<WalletRechargeScreen> createState() => _WalletRechargeScreenState();
}

class _WalletRechargeScreenState extends State<WalletRechargeScreen> {
  final TextEditingController _amountController = TextEditingController(
    text: '150000 ل.س',
  );
  String _selectedPaymentMethod = AppTexts.paypal;
  double _chargeAmount = 30000;
  double _serviceFees = 100;
  double get _total => _chargeAmount + _serviceFees;

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildAmountInput(),
                    32.verticalSpace,
                    _buildPaymentMethods(),
                    32.verticalSpace,
                    _buildPurchaseSummary(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.w),
              child: PrimaryButton(
                title: AppTexts.confirmPayment,
                backgroundColor: AppColors.primaryColor,
                onPressed: () {
                  // Handle payment confirmation
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.of(context).maybePop(),
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 20.w,
              color: AppColors.primaryColor,
            ),
          ),
          Expanded(
            child: Text(
              AppTexts.rechargeWallet,
              textAlign: TextAlign.center,
              style: AppTextStyles.cairoTextStyle(
                color: AppColors.primaryColor,
                size: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chevron_right,
              size: 20.w,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAmountInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppTexts.enterChargeAmount,
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
            textAlign: TextAlign.end,
            style: AppTextStyles.cairoTextStyle(
              color: AppColors.primaryColor,
              size: 16,
              fontWeight: FontWeight.w600,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '150000 ل.س',
              hintStyle: AppTextStyles.cairoTextStyle(
                color: AppColors.fieldHintColor,
                size: 16,
              ),
              contentPadding: EdgeInsets.zero,
            ),
            keyboardType: TextInputType.number,
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
          AppTexts.choosePaymentMethod,
          style: AppTextStyles.cairoTextStyle(
            color: AppColors.primaryColor,
            size: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        16.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildPaymentOption(AppTexts.mastercard, false),
            _buildPaymentOption(AppTexts.stripe, false),
            _buildPaymentOption(AppTexts.paypal, true),
          ],
        ),
      ],
    );
  }

  Widget _buildPaymentOption(String name, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPaymentMethod = name;
        });
      },
      child: Container(
        width: 110.w,
        height: 120.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected
                ? AppColors.primaryColor
                : AppColors.textFieldBorderColor,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (name == AppTexts.mastercard)
              _buildMastercardLogo()
            else if (name == AppTexts.stripe)
              _buildStripeLogo()
            else if (name == AppTexts.paypal)
              _buildPaypalLogo(),
            Radio<String>(
              value: name,
              groupValue: _selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value!;
                });
              },
              activeColor: AppColors.primaryColor,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMastercardLogo() {
    return Container(
      width: 48.w,
      height: 48.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Colors.red.shade400, Colors.orange.shade400],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 4.w,
            top: 8.h,
            child: Container(
              width: 28.w,
              height: 28.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.4),
              ),
            ),
          ),
          Positioned(
            right: 4.w,
            top: 8.h,
            child: Container(
              width: 28.w,
              height: 28.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.4),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStripeLogo() {
    return Container(
      width: 48.w,
      height: 24.h,
      decoration: BoxDecoration(
        color: const Color(0xFF635BFF),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Center(
        child: Text(
          'stripe',
          style: AppTextStyles.cairoTextStyle(
            color: AppColors.white,
            size: 11,
            fontWeight: FontWeight.w700,
          ).copyWith(letterSpacing: 0.5),
        ),
      ),
    );
  }

  Widget _buildPaypalLogo() {
    return Container(
      width: 48.w,
      height: 24.h,
      decoration: BoxDecoration(
        color: const Color(0xFF0070BA),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Center(
        child: Text(
          'PayPal',
          style: AppTextStyles.cairoTextStyle(
            color: AppColors.white,
            size: 11,
            fontWeight: FontWeight.w700,
          ).copyWith(letterSpacing: 0.5),
        ),
      ),
    );
  }

  Widget _buildPurchaseSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppTexts.purchaseSummary,
          style: AppTextStyles.cairoTextStyle(
            color: AppColors.primaryColor,
            size: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        16.verticalSpace,
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.textFieldBorderColor),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            children: [
              _buildSummaryRow(AppTexts.chargeAmount, '$_chargeAmount ل.س'),
              16.verticalSpace,
              _buildSummaryRow(AppTexts.serviceFees, '$_serviceFees ل.س'),
              16.verticalSpace,
              _buildSummaryRow(AppTexts.total, '$_total ل.س', isTotal: true),
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
          value,
          textAlign: TextAlign.end,
          style: AppTextStyles.cairoTextStyle(
            color: AppColors.sconderyColor,
            size: isTotal ? 18 : 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          label,
          textAlign: TextAlign.start,
          style: AppTextStyles.cairoTextStyle(
            color: AppColors.primaryColor,
            size: isTotal ? 18 : 14,
            fontWeight: isTotal ? FontWeight.w700 : FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
