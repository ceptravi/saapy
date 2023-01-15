import 'package:moon_start_builders/utils/export_file.dart';

import '../bindings/home_bindings.dart';
import '../bindings/login_bindings.dart';
import '../bindings/signUp_bindings.dart';
import '../bindings/wallet_bindings.dart';
import '../screens/myOrders_view.dart';
import '../screens/recharge/circle_screen.dart';

class Routes {
  static List<GetPage<dynamic>> routes = [
    GetPage(
      name: kSplashPage,
      transition: Transition.rightToLeft,
      page: () => const Onbording(),
    ),
    GetPage(
      name: kDashboardPage,
      transition: Transition.rightToLeft,
      page: () => const Dashboard(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: kHomePage,
      transition: Transition.rightToLeft,
      page: () => const Home_Screen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: kAllserviesPage,
      transition: Transition.rightToLeft,
      page: () => const AllServiesScreen(),
    ),
    GetPage(
      name: kChatPage,
      transition: Transition.rightToLeft,
      page: () => const Chat_Screen(),
    ),
    GetPage(
      name: kMenuPage,
      transition: Transition.rightToLeft,
      page: () => const Menu_Screen(),
    ),
    GetPage(
      name: KWallet,
      transition: Transition.rightToLeft,
      page: () => const Own_Wallet(),
      binding: WalletBinding(),
    ),
    GetPage(
      name: KQrcode,
      transition: Transition.rightToLeft,
      page: () => QRView_Screen(),
    ),
    GetPage(
      name: KTransfer,
      transition: Transition.rightToLeft,
      page: () => const Transfer(),
    ),
    GetPage(
      name: KUPI_Qr,
      transition: Transition.rightToLeft,
      page: () => const UPI_code(),
    ),
    GetPage(
      name: KProfile,
      transition: Transition.rightToLeft,
      page: () => const Profile(),
    ),
    GetPage(
      name: KRecipet,
      transition: Transition.rightToLeft,
      page: () => const Recipet(),
    ),
    GetPage(
      name: KCoupons,
      transition: Transition.rightToLeft,
      page: () => const Coupons_view(),
    ),
    GetPage(
      name: KSign_up,
      transition: Transition.rightToLeft,
      page: () => const Sign_up(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: KLogin,
      transition: Transition.rightToLeft,
      page: () => const Login_view(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: KMobile_Screen,
      transition: Transition.rightToLeft,
      page: () => const Mobile_login(),
    ),
    GetPage(
      name: KOTP_screen,
      transition: Transition.rightToLeft,
      page: () => const OTP_view(),
    ),
    GetPage(
      name: KSupport,
      transition: Transition.rightToLeft,
      page: () => const Support(),
    ),
    GetPage(
      name: KHelp,
      transition: Transition.rightToLeft,
      page: () => const support_list(),
    ),
    GetPage(
      name: KKyc,
      transition: Transition.rightToLeft,
      page: () => const Kyc_screen(),
    ),
    GetPage(
      name: KId_proof,
      transition: Transition.rightToLeft,
      page: () => const IdProof(),
    ),
    GetPage(
      name: KReferral,
      transition: Transition.rightToLeft,
      page: () => const Referral_view(),
    ),
    GetPage(
      name: KRecharge,
      transition: Transition.rightToLeft,
      page: () => const Recharge(),
    ),
    GetPage(
      name: KPaid_Recharge,
      transition: Transition.rightToLeft,
      page: () => const Paid_Recharge(),
    ),
    GetPage(
      name: KAllCircles,
      transition: Transition.rightToLeft,
      page: () => const AllCircles(),
    ),
    GetPage(
      name: KPersonal_Recharge,
      transition: Transition.rightToLeft,
      page: () => const Personal_recharge(),
    ),
    GetPage(
      name: KRecharge_Payment,
      transition: Transition.rightToLeft,
      page: () => const Recharge_payment(),
    ),
    GetPage(
      name: KSelf_Tranfer,
      transition: Transition.rightToLeft,
      page: () => const Self_tranfer(),
    ),
    GetPage(
      name: KPayment_done,
      transition: Transition.rightToLeft,
      page: () => const Payment_done(),
    ),
    GetPage(
      name: KAmount_screen,
      transition: Transition.rightToLeft,
      page: () => const Amount_Screen(),
    ),
    GetPage(
      name: KSelect_bank,
      transition: Transition.rightToLeft,
      page: () => const Select_bank(),
    ),
    GetPage(
      name: kAdd_acount,
      transition: Transition.rightToLeft,
      page: () => const Add_acount(),
    ),
    GetPage(
      name: KPassbook_view,
      transition: Transition.rightToLeft,
      page: () => const Passbook(),
    ),
    GetPage(
      name: KMyorders,
      transition: Transition.rightToLeft,
      page: () => const MyOrders(),
    ),
    GetPage(
      name: KPersonal_chat,
      transition: Transition.rightToLeft,
      page: () => const ChatPage(),
    ),
    GetPage(
      name: KScratch,
      transition: Transition.rightToLeft,
      page: () => const Scratch_Screen(),
    ),
    GetPage(
      name: KSearch,
      transition: Transition.rightToLeft,
      page: () => const Search_view(),
    ),
    GetPage(
      name: KNotify,
      transition: Transition.rightToLeft,
      page: () => const Notification_view(),
    ),
  ];
}
