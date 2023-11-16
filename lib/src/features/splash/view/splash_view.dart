import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:flutter_riverpod_mvc/src/core/extension/ref_extension.dart';
import 'package:flutter_riverpod_mvc/src/features/splash/controller/splash_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/base/base_view.dart';
import '../../../core/constants/image/svg_constatns.dart';

@RoutePage(name: 'SplashRoute')
class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashController>(
        initNotifier: (ref) => ref.read(splashController.notifier),
        onModelReady: (notifier) {
          notifier.setContext(context);
          notifier.init();
        },
        onPageBuilder: (context, notifier, ref) {
          return Scaffold(
            backgroundColor: ref.colorScheme.primary,
            body: splashViewBody(ref),
          );
        });
  }

  AnimatedSlide splashViewBody(WidgetRef ref) {
    return AnimatedSlide(
      offset: ref.watch(splashController).isStarted
          ? Offset.zero
          : const Offset(0, -1),
      duration: const Duration(milliseconds: 700),
      curve: Curves.ease,
      child: Center(
        child: splashLogoImage(),
      ),
    );
  }

  SizedBox splashLogoImage() {
    return SizedBox(
      height: 150.h,
      width: 150.w,
      child: SvgPicture.asset(SVGImageConstants.instance.splashLogo),
    );
  }
}
