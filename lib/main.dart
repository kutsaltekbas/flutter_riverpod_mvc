import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'src/core/constants/app/app_constants.dart';
import 'src/core/init/lang/language_manager.dart';
import 'src/core/init/navigation/navigation_route.dart';
import 'src/core/init/notifier/theme_notifer.dart';

Future<void> main() async {
  await _init();
  runApp(ProviderScope(child: MyApp()));
}

Future<void> _init() async {}

class MyApp extends ConsumerStatefulWidget {
  final _appRouter = AppRouter();

  MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: LanguageManager.instance.supportedLocales,
      path: ApplicationConstants.LANG_ASSET_PATH,
      startLocale: LanguageManager.instance.enLocale,
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: ref.watch(themeProvider).themeData,
          themeMode: ref.watch(themeProvider).mode,
          routerDelegate: widget._appRouter.delegate(),
          routeInformationParser: widget._appRouter.defaultRouteParser(),
          builder: (context, widget) {
            ScreenUtil.init(context);
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            );
          },
        ),
      ),
    );
  }
}
