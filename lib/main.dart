import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orders_insights/app/core/values/app_theme.dart';
import 'package:orders_insights/app/data/providers/fetch_orders_list.dart';
import 'package:orders_insights/app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServices();
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  ).then((_) {
    runApp(const MyApp());
  });
}

void initServices() {
  Get.put(OrdersListProvider());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(430, 932),
      builder: (context, widget) {
        return GetMaterialApp(
          title: 'Orders Insights',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.appTheme,
          initialRoute: AppPages.kINITIAL,
          getPages: AppPages.routes,
          locale: const Locale('en'),
          builder: (context, widget) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: const TextScaler.linear(1.6),
              ),
              child: widget!,
            );
          },
        );
      },
    );
  }
}
