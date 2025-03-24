import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/recourses/theme_manger/theme_manager.dart';
import 'core/services/service_locator.dart';
import 'core/storage/secure_storage.dart';
import 'features/home_service_feature/presentation/pages/home_services_view.dart';
import 'features/onboarding_feature/presentation/pages/on_boarding_view.dart';
bool isLogin = false;
String? token;
String? toGoRoute;

Future<void> loadStorageData() async {
  String? isLoginValue = await SecureStorage.read('isLogin');
  isLogin = (isLoginValue == 'true');
  token = await SecureStorage.read('authToken');
}

void main() async {
  ServiceLocator().setup();
  runApp(const Movies());
  await loadStorageData();

}

class Movies extends StatelessWidget {
  const Movies({super.key});

  @override
  Widget build(BuildContext context) {

    return  ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: getAppTheme(),
          routes: {
            '/': (context) => (isLogin == false)
                ? const OnBoardingView()
                : const HomeServicesView(),

          },

        );
      },
    );
  }
}
