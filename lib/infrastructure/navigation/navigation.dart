import 'package:appentus_dummy/infrastructure/navigation/routes.dart';
import 'package:appentus_dummy/presentation/category/category_binding.dart';
import 'package:appentus_dummy/presentation/category/category_page.dart';
import 'package:appentus_dummy/presentation/changePassword/changePasswordBinding.dart';
import 'package:appentus_dummy/presentation/changePassword/changePasswordPage.dart';
import 'package:appentus_dummy/presentation/dashboard/dashboard_binding.dart';
import 'package:appentus_dummy/presentation/dashboard/dashboard_page.dart';
import 'package:appentus_dummy/presentation/filter/filter_binding.dart';
import 'package:appentus_dummy/presentation/filter/filter_page.dart';
import 'package:appentus_dummy/presentation/forgotPassword/ForgotPaswordPage.dart';
import 'package:appentus_dummy/presentation/forgotPassword/forgot_password_binding.dart';
import 'package:appentus_dummy/presentation/forgotUsername/emailSent/email_sent_binding.dart';
import 'package:appentus_dummy/presentation/forgotUsername/emailSent/email_sent_page.dart';
import 'package:appentus_dummy/presentation/forgotUsername/forgot_username_binding.dart';
import 'package:appentus_dummy/presentation/forgotUsername/forgot_username_page.dart';
import 'package:appentus_dummy/presentation/home/home_binding.dart';
import 'package:appentus_dummy/presentation/home/home_page.dart';
import 'package:appentus_dummy/presentation/identity/categorey_type_binding.dart';
import 'package:appentus_dummy/presentation/identity/category_type_page.dart';
import 'package:appentus_dummy/presentation/language/choose_lang_binding.dart';
import 'package:appentus_dummy/presentation/language/choose_lang_page.dart';
import 'package:appentus_dummy/presentation/login/login_binding.dart';
import 'package:appentus_dummy/presentation/login/login_page.dart';
import 'package:appentus_dummy/presentation/notification/notification_binding.dart';
import 'package:appentus_dummy/presentation/notification/notification_page.dart';
import 'package:appentus_dummy/presentation/profile/profile_binding.dart';
import 'package:appentus_dummy/presentation/profile/profile_page.dart';
import 'package:appentus_dummy/presentation/signup/signup_binding.dart';
import 'package:appentus_dummy/presentation/signup/signup_page.dart';
import 'package:appentus_dummy/presentation/verify/verify_binding.dart';
import 'package:appentus_dummy/presentation/verify/verify_page.dart';
import 'package:appentus_dummy/presentation/welcome/welcome_binding.dart';
import 'package:appentus_dummy/presentation/welcome/welcome_page.dart';
import 'package:get/get.dart';

import '../../presentation/splash/splash_binding.dart';
import '../../presentation/splash/splash_page.dart';

class AppPages {
  static List<GetPage> pageList = [

    GetPage(
      name: Routes.splash,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.chooselanguage,
      page: () => ChooseLangPage(),
      binding: ChooseLangBinding(),
    ),
    GetPage(
      name: Routes.welcomepage,
      page: () => WelcomePage(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: Routes.signup,
      page: () => SignUpPage(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.verify,
      page: () => VerifyPage(),
      binding: VerifyBinding(),
    ),
    GetPage(
      name: Routes.forgotUsername,
      page: () => ForgotUsernamePage(),
      binding: ForgotUsernameBinding(),
    ),
    GetPage(
      name: Routes.emailSent,
      page: () => EmailSentPage(),
      binding: EmailSentBinding(),
    ),
    GetPage(
      name: Routes.forgotPassword,
      page: () => ForgotPasswordPage(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: Routes.changePassword,
      page: () => ChangePasswordPage(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: Routes.dashboard,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.notification,
      page: () => NotificationPage(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => ProfilePage(),
      binding: ProfileBnding(),
    ),
    GetPage(
      name: Routes.category,
      page: () => CategoryPage(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: Routes.identity,
      page: () => CategoryTypePage(),
      binding: CategoryTypeBinding(),
    ),
    GetPage(
      name: Routes.filter,
      page: () => FilterPage(),
      binding: FilterBinding(),
    ),

  ];
}

