import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_mvc/src/core/base/base_view.dart';
import 'package:flutter_riverpod_mvc/src/core/extension/ref_extension.dart';
import 'package:flutter_riverpod_mvc/src/core/init/lang/locale_keys.g.dart';
import 'package:flutter_riverpod_mvc/src/features/home/controller/home_controller.dart';
import 'package:flutter_riverpod_mvc/src/features/home/model/user_data_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage(name: 'HomeRoute')
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeController>(
        initNotifier: (ref) => ref.read(homeController.notifier),
        onModelReady: (notifier) {
          notifier.setContext(context);
          notifier.init();
        },
        onPageBuilder: (context, notifier, ref) {
          return Scaffold(
            appBar: appBar(notifier, ref),
            body: pageBody(ref),
          );
        });
  }

  SizedBox pageBody(WidgetRef ref) {
    return SizedBox(
        width: ref.width,
        height: ref.height,
        child: ref.watch(getUserDataProvider).when(
              loading: () => loadingAnimation(),
              error: (error, stackTrace) => errorPageBody(ref),
              data: (data) => loadedPageBody(ref, data),
            ));
  }

  SingleChildScrollView loadedPageBody(
      WidgetRef ref, List<UserInfoModel?>? data) {
    return SingleChildScrollView(
      child: Padding(
        padding: ref.padding2,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: data!.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => userInfoCard(ref, data, index),
        ),
      ),
    );
  }

  Column errorPageBody(WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error,
          color: ref.colorScheme.error,
          size: 24.w,
        ),
        SizedBox(height: 10.h),
        Text(
          LocaleKeys.home_screen_error,
          style: ref.textTheme.bodyMedium,
        )
      ],
    );
  }

  Center loadingAnimation() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  AppBar appBar(HomeController notifier, WidgetRef ref) {
    return AppBar(
      actions: [
        IconButton(
            onPressed: notifier.logout,
            icon: Icon(
              Icons.exit_to_app,
              size: 18.w,
            ))
      ],
      centerTitle: true,
      title: Text(
        LocaleKeys.home_screen_my_team.tr(),
        style: ref.textTheme.displayLarge,
      ),
    );
  }

  Container userInfoCard(WidgetRef ref, List<UserInfoModel?> data, int index) {
    return Container(
      padding: ref.paddingHorizontal2,
      height: 50.h,
      decoration: userCardDecoration(ref),
      margin: ref.paddingVertical1,
      child: Row(
        children: [
          profileImage(data, index),
          SizedBox(width: 10.w),
          userFullname(data, index, ref),
          const Spacer(),
          userId(data, index, ref)
        ],
      ),
    );
  }

  BoxDecoration userCardDecoration(WidgetRef ref) {
    return BoxDecoration(
        boxShadow: List.generate(
          1,
          (index) => BoxShadow(
              blurRadius: 5.w,
              spreadRadius: 0,
              offset: const Offset(0, 0),
              color: ref.colorScheme.onError.withOpacity(0.25)),
        ),
        color: ref.colorScheme.background,
        borderRadius: BorderRadius.circular(10.w));
  }

  Text userId(List<UserInfoModel?> data, int index, WidgetRef ref) {
    return Text(
      "ID: ${data[index]?.id}",
      style: ref.textTheme.headlineSmall,
    );
  }

  Column userFullname(List<UserInfoModel?> data, int index, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${data[index]?.firstName} "
          "${data[index]?.lastName} ",
          style: ref.textTheme.headlineSmall,
        ),
        Text(
          "${data[index]?.email}",
          style: ref.textTheme.bodyMedium,
        )
      ],
    );
  }

  Container profileImage(List<UserInfoModel?> data, int index) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35.w),
          image: DecorationImage(
              image: NetworkImage(
            data[index]!.avatar!,
          ))),
      width: 40.w,
      height: 40.w,
    );
  }
}
