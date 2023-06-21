import 'package:app/pages/index.dart';
import 'package:app/pages/profile/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class RoutePages {
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static List<GetPage> list = [
    GetPage(
      name: RouteNames.welcome,
      page: () => const WelcomePage(),
    ),
    GetPage(
      name: RouteNames.getStarted,
      page: () => const GetStartedPage(),
    ),
    GetPage(
      name: RouteNames.mnemonicGen,
      page: () => const MnemonicGenPage(),
    ),
    GetPage(
      name: RouteNames.createPwd,
      page: () => const CreatePwdPage(),
    ),
    GetPage(
      name: RouteNames.successSignUp,
      page: () => const SuccessSignupPage(),
    ),
    GetPage(
      name: RouteNames.signin,
      page: () => const SigninPage(),
    ),
    GetPage(
      name: RouteNames.signinIncorrect,
      page: () => const SigninIncorrectPage(),
    ),
    GetPage(
      name: RouteNames.forgotPwd,
      page: () => const ForgotPwdPage(),
    ),
    GetPage(
      name: RouteNames.backWelcome,
      page: () => const BackWelcomePage(),
    ),
    GetPage(
      name: RouteNames.notExist,
      page: () => const NotExistPage(),
    ),
    //---------------------------------------------------------------------------//
    GetPage(
      name: RouteNames.main,
      page: () => const MainPage(),
      binding: MainBinding(),
    ),
    //---------------------------------------------------------------------------//
    GetPage(
      name: RouteNames.myId,
      page: () => const MyIDPage(),
    ),
    GetPage(
      name: RouteNames.profile,
      page: () => const ProfilePage(),
    ),
    GetPage(
      name: RouteNames.email,
      page: () => const EmailPage(),
    ),
    GetPage(
      name: RouteNames.twitter,
      page: () => const TwitterPage(),
    ),
    GetPage(
      name: RouteNames.twitterVerified,
      page: () => const TwitterVerifiedPage(),
    ),
    GetPage(
      name: RouteNames.secretRecoveryPhrase,
      page: () => const SecretRecoveryPhrasePage(),
    ),
    //---------------------------------------------------------------------------//
    GetPage(
      name: RouteNames.addChallengeCard,
      page: () => const AddChallengeCardPage(),
    ),
    GetPage(
      name: RouteNames.alcohol,
      page: () => const AlcoholPage(),
    ),
    GetPage(
      name: RouteNames.alcoholDate,
      page: () => const AlcoholDatePage(),
    ),
    GetPage(
      name: RouteNames.bodyPain,
      page: () => const BodyPainPage(),
    ),
    GetPage(
      name: RouteNames.mood,
      page: () => const MoodPage(),
    ),
    //---------------------------------------------------------------------------//
    GetPage(
      name: RouteNames.moodStatistics,
      page: () => const MoodStatisticsPage(),
    ),
    GetPage(
      name: RouteNames.alcoholStatistics,
      page: () => const AlcoholStatisticsPage(),
    ),
    GetPage(
      name: RouteNames.bodyPainStatistics,
      page: () => const BodyPainStatisticsPage(),
    ),
    GetPage(
      name: RouteNames.bodyPainStatDetail,
      page: () => const BodyPainStatDetailPage(),
    ),
  ];
}
