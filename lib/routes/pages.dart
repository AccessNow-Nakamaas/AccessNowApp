// ignore_for_file: unused_import

import 'package:get/get.dart';
import 'package:qrpay/controller/profile_controllers/two_factor_otp_controller.dart';
import 'package:qrpay/views/auth/sign_in_screen/reset_password.dart';
import 'package:qrpay/views/auth/sign_in_screen/sign_in_screen.dart';
import 'package:qrpay/views/auth/sign_up_screens/facelock_enter_screen.dart';
import 'package:qrpay/views/auth/sign_up_screens/facelock_screen.dart';
import 'package:qrpay/views/auth/sign_up_screens/fingerprint_screen.dart';
import 'package:qrpay/views/auth/sign_up_screens/kyc_from_screen.dart';
import 'package:qrpay/views/auth/sign_up_screens/otp_verification_screen.dart';
import 'package:qrpay/views/auth/sign_up_screens/sign_up.dart';
import 'package:qrpay/views/categories_screen/billpay_screen.dart';
import 'package:qrpay/views/categories_screen/mobile_top_up_screen.dart';
import 'package:qrpay/views/categories_screen/my_giftcard_screen.dart';
import 'package:qrpay/views/drawer_screens/bill_payment_log_screen.dart';
import 'package:qrpay/views/drawer_screens/giftcard_log_screen.dart';
import 'package:qrpay/views/drawer_screens/mobile_topup_log_screen.dart';
import 'package:qrpay/views/drawer_screens/save_receipient_screen.dart';
import 'package:qrpay/views/drawer_screens/change_password_screen.dart';
import 'package:qrpay/views/drawer_screens/settings_screen.dart';
import 'package:qrpay/views/drawer_screens/transactions_log_screen.dart';
import 'package:qrpay/views/onboard/onboard_screen.dart';
import 'package:qrpay/views/profile_screens/my_wallet_screen.dart';
import 'package:qrpay/views/profile_screens/profile_screen.dart';
import 'package:qrpay/views/profile_screens/two_factor_secuirity_screen.dart';
import 'package:qrpay/views/profile_screens/update_kyc_screen.dart';
import 'package:qrpay/views/profile_screens/update_profile_screen.dart';
import 'package:qrpay/views/scan_qr_screens/scanner_screen.dart';
import '../binding/splash_binding.dart';
import '../controller/splsh_controller/splash_controller.dart';
import '../views/auth/sign_in_screen/sign_in_options_screen.dart';
import '../views/auth/sign_in_screen/signin_otp_verification.dart';
import '../views/bottom_navbar/bottom_navbar.dart';
import '../views/bottom_navbar/dashboard_screen.dart';
import '../views/buy_giftcard/buy_giftcard_screen.dart';
import '../views/buy_giftcard/card_view_screen.dart';
import '../views/categories_screen/money_receive_screen.dart';
import '../views/confirmation_screens/confirmation_screen.dart';
import '../views/confirmation_screens/wait_for_aproval_screen.dart';
import '../views/profile_screens/two_factor_otp_screen.dart';
import '../views/remitance/add_receipient_screen.dart';
import '../views/remitance/remittance_screen.dart';
import '../views/scan_qr_screens/money_transfer_screen.dart';
import '../views/scan_qr_screens/preview_screen.dart';
import '../views/splash_screen/splash_screen.dart';
import '../views/virtual_card_screens/details_screen.dart';
import '../views/virtual_card_screens/found_screen.dart';
import '../views/virtual_card_screens/transaction_screen.dart';
import '../views/virtual_card_screens/virtual_card_screen.dart';
import 'routes.dart';

class Pages {
  static var list = [
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
      binding: BindingsBuilder(() {
        Get.put(
          SplashController(),
        );
      }),
    ),
    GetPage(
      name: Routes.onboardScreen,
      page: () => const OnboardSceen(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: Routes.otpVerificationScreen,
      page: () => OtpVerificationScreen(),
    ),
    GetPage(
      name: Routes.kYCFromScreen,
      page: () => KYCFromScreen(),
    ),
    GetPage(
      name: Routes.fingerPrintScreen,
      page: () => FingerPrintScreen(),
    ),
    GetPage(
      name: Routes.facelockScreen,
      page: () => FacelockScreen(),
    ),
    GetPage(
      name: Routes.facelockEnterScreen,
      page: () => FacelockEnterScreen(),
    ),
    GetPage(
      name: Routes.waitForApprovalScreen,
      page: () => WaitForApprovalScreen(),
    ),
    GetPage(
      name: Routes.signInOptionsScreen,
      page: () => SignInOptionsScreen(),
    ),
    GetPage(
      name: Routes.signInScreen,
      page: () => SignInScreen(),
    ),
    GetPage(
      name: Routes.signinOTPVerificationScreen,
      page: () => SigninOTPVerificationScreen(),
    ),
    GetPage(
      name: Routes.resetPasswordScreen,
      page: () => ResetPasswordScreen(),
    ),
    GetPage(
      name: Routes.congratulationScreen,
      page: () => CongratulationScreen(),
    ),
    GetPage(
      name: Routes.bottomNavBarScreen,
      page: () => BottomNavBarScreen(),
    ),
    GetPage(
      name: Routes.dashBordScreen,
      page: () => DashBordScreen(),
    ),
    GetPage(
      name: Routes.moneyTransferScreen,
      page: () => MoneyTransferScreen(),
    ),
    GetPage(
      name: Routes.previewScreen,
      page: () => PreviewScreen(),
    ),
    GetPage(
      name: Routes.scanQrScreen,
      page: () => const ScanQrScreen(),
    ),
    GetPage(
      name: Routes.moneyReceiveScreen,
      page: () => MoneyReceiveScreen(),
    ),
    GetPage(
      name: Routes.remittanceScreen,
      page: () => RemittanceScreen(),
    ),
    GetPage(
      name: Routes.addReceipientScreen,
      page: () => AddReceipientScreen(),
    ),
    GetPage(
      name: Routes.virtualCardScreen,
      page: () => VirtualCardScreen(),
    ),
    GetPage(
      name: Routes.detailsScreen,
      page: () => const DetailsScreen(),
    ),
    GetPage(
      name: Routes.foundScreen,
      page: () => FoundScreen(),
    ),
    GetPage(
      name: Routes.transactionScreen,
      page: () => const TransactionScreen(),
    ),
    GetPage(
      name: Routes.billPayScreen,
      page: () => BillPayScreen(),
    ),
    GetPage(
      name: Routes.mobileTopUpScreen,
      page: () => MobileTopUpScreen(),
    ),
    GetPage(
      name: Routes.myGiftCardScreen,
      page: () => const MyGiftCardScreen(),
    ),
    GetPage(
      name: Routes.buyGiftCardScreen,
      page: () => BuyGiftCardScreen(),
    ),
    GetPage(
      name: Routes.cardViewScreen,
      page: () => CardViewScreen(),
    ),

    //drawer
    GetPage(
      name: Routes.saveReceipientScreen,
      page: () => const SaveReceipientScreen(),
    ),
    GetPage(
      name: Routes.transactionLogScreen,
      page: () => const TransactionLogScreen(),
    ),
    GetPage(
      name: Routes.giftCardLogScreen,
      page: () => const GiftCardLogScreen(),
    ),
    GetPage(
      name: Routes.billPaymentLogScreen,
      page: () => const BillPaymentLogScreen(),
    ),

    GetPage(
      name: Routes.mobileTopUpLogScreen,
      page: () => const MobileTopUpLogScreen(),
    ),
    GetPage(
      name: Routes.settingScreen,
      page: () => SettingScreen(),
    ),
    GetPage(
      name: Routes.changePasswordScreen,
      page: () => ChangePasswordScreen(),
    ),
    GetPage(
      name: Routes.profileScreen,
      page: () => ProfileScreen(),
    ),
    GetPage(
      name: Routes.myWalletScreen,
      page: () => const MyWalletScreen(),
    ),
    GetPage(
      name: Routes.updateProfileScreen,
      page: () => UpdateProfileScreen(),
    ),
    GetPage(
      name: Routes.updateKycScreen,
      page: () => const UpdateKycScreen(),
    ),
    GetPage(
      name: Routes.twoFactorSecuirityScreen,
      page: () => TwoFactorSecuirityScreen(),
    ),
    GetPage(
      name: Routes.twoFactorOtpScreen,
      page: () => TwoFactorOtpScreen(),
    ),
  ];
}
