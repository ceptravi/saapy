// ignore_for_file: constant_identifier_names

import 'package:moon_start_builders/utils/export_file.dart';

///Routes
const String kSplashPage = '/splash';
const String kappbarPage = '/components/custom_appbar.dart';
const String kDashboardPage = '/dashboard';
const String kHomePage = '/home/home.dart';
const String kChatPage = '/chat/chat.dart';
const String KPersonal_chat = '/chat/personal_chat.dart';
const String kAllserviesPage = '/all_servies.dart/all_servies.dart';
const String kMenuPage = '/menu/menu.dart';
const String KSearch = '/screens/search_view.dart';
const String KWallet = '/own_wallet.dart';
const String KQrcode = '/qr_view.dart';
const String KUPI_Qr = '/upi_qrcode.dart';
const String KTransfer = '/money_transfer/money_transfer.dart';
const String KProfile = '/profile/profile_view.dart';
const String KRecipet = '/reciept.dart';
const String KCoupons = '/coupons.dart';
const String KSign_up = '/login/sign_up.dart';
const String KLogin = '/login/login_screen.dart';
const String KMobile_Screen = '/login/mobile_login.dart';
const String KOTP_screen = '/login/otp_screen.dart';
const String KSupport = '/support/help.dart';
const String KHelp = '/support/support.dart';
const String KKyc = '/kyc/kyc.dart';
const String KId_proof = '/kyc/idproof.dart';
const String KReferral = '/referral.dart';
const String KRecharge = '/rechange/rechange.dart';
const String KPaid_Recharge = '/recharge/paid_recharge.dart';
const String KAllCircles = '/recharge/circle_screen.dart';
const String KPersonal_Recharge = '/recharge/personal_recharge.dart';
const String KRecharge_Payment = '/recharge/recharge_payment.dart';
const String KSelf_Tranfer = '/self_transfer/self_tranfer.dart';
const String KPayment_done = '/self_transfer/payment_done.dart';
const String KAmount_screen = '/self_transfer/amount_screen.dart';
const String KSelect_bank = '/select_bank/select_bank.dart';
const String kAdd_acount = '/select_bank/add_acount.dart';
const String KPassbook_view = '/passbook_view.dart';
const String KMyorders = '/myOrders_view.dart';
const String KScratch = '/screens/scratch_screen.dart';
const String KNotify = '/screens/notify_screen.dart';
const String KStatement = '/components/statement.dart';

///Font sizes
double kTenFont = MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .size
            .shortestSide <
        600
    ? 10.sp
    : 6.sp;
double kTwelveFont = MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .size
            .shortestSide <
        600
    ? 12.sp
    : 7.sp;

double kFourteenFont = MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .size
            .shortestSide <
        600
    ? 14.sp
    : 9.sp;
double kSixteenFont = MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .size
            .shortestSide <
        600
    ? 16.sp
    : 11.sp;
double kEighteenFont = MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .size
            .shortestSide <
        600
    ? 18.sp
    : 13.sp;
double kTwentyFont = MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .size
            .shortestSide <
        600
    ? 20.sp
    : 15.sp;
double kTwentyTwoFont =
    MediaQueryData.fromWindow(WidgetsBinding.instance.window)
                .size
                .shortestSide <
            600
        ? 22.sp
        : 17.sp;
double kTwentyFourFont =
    MediaQueryData.fromWindow(WidgetsBinding.instance.window)
                .size
                .shortestSide <
            600
        ? 24.sp
        : 19.sp;
double kTwentySixFont =
    MediaQueryData.fromWindow(WidgetsBinding.instance.window)
                .size
                .shortestSide <
            600
        ? 26.sp
        : 21.sp;

///Font weights

const FontWeight kFW400 = FontWeight.w400;
const FontWeight kFW500 = FontWeight.w500;
const FontWeight kFW600 = FontWeight.w600;
const FontWeight kFW700 = FontWeight.w700;

///Colors
const Color kInactiveIndicatorColor = Color(0xff82A9C8);
const Color darkGrey = Color.fromRGBO(37, 37, 37, 1);
const Color purple = Color.fromRGBO(90, 100, 191, 1);
const Color grey = Color.fromRGBO(81, 81, 81, 1);
const Color lightgrey = Color(0xff6A6A6A);
const Color brown = Color.fromRGBO(229, 120, 55, 1);
const Color kgreen = Color(0xffEAF7FF);
const Color kblue = Color(0xffDEFFE9);
const Color klightpurple = Color(0xff5A6ABF);
const Color darkblue = Color.fromRGBO(11, 40, 167, 1);
const Color white = Color.fromRGBO(255, 255, 255, 1);

///Others

const String kDEVURL = "http://13.126.82.177/api/doctor/";
const String NewDEVURL = "http://97.74.81.248:2020/api/";

final GlobalKey<ScaffoldState> kScaffoldKey = GlobalKey<ScaffoldState>();