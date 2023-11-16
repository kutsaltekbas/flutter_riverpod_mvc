import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_mvc/src/core/constants/enums/loading_state_enum.dart';
import 'package:flutter_riverpod_mvc/src/core/extension/ref_extension.dart';
import 'package:flutter_riverpod_mvc/src/core/extension/string_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../../core/base/base_view.dart';
import '../../../core/constants/image/svg_constatns.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../controller/login_controller.dart';

@RoutePage(name: 'LoginRoute')
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginController>(
      initNotifier: (ref) => ref.read(loginController.notifier),
      onModelReady: (notifier) {
        notifier.setContext(context);
        notifier.init();
      },
      onPageBuilder: (context, notifier, ref) {
        return Scaffold(
          backgroundColor: ref.colorScheme.background,
          body: SingleChildScrollView(
            child: Padding(
              padding: ref.paddingHorizontal2,
              child: Column(
                children: [
                  SizedBox(height: 84.h),
                  logo(),
                  SizedBox(height: 25.h),
                  firstHeader(ref),
                  SizedBox(height: 4.h),
                  secondHeader(ref),
                  SizedBox(height: 65.h),
                  textfields(notifier, ref),
                  SizedBox(height: 26.h),
                  SizedBox(height: 50.h),
                  loginButton(ref, notifier, context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Form textfields(LoginController notifier, WidgetRef ref) {
    return Form(
      key: notifier.formKey,
      child: Column(
        children: [
          emailTextfield(ref, notifier),
          SizedBox(height: 16.h),
          passwordTextfield(ref, notifier),
        ],
      ),
    );
  }

  Center logo() {
    return Center(
      child: SizedBox(
          height: 98.h,
          width: 207.w,
          child: SvgPicture.asset(SVGImageConstants.instance.splashLogo)),
    );
  }

  Text firstHeader(WidgetRef ref) {
    return Text(
      LocaleKeys.login_screen_welcome.locale,
      style: ref.textTheme.titleSmall,
    );
  }

  Text secondHeader(WidgetRef ref) {
    return Text(
      LocaleKeys.login_screen_pls_login.locale,
      style: ref.textTheme.headlineMedium,
    );
  }

  Column emailTextfield(WidgetRef ref, LoginController notifier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: ref.paddingHorizontal1,
          child: Text(
            LocaleKeys.login_screen_mail.locale,
            style: ref.textTheme.headlineSmall,
          ),
        ),
        SizedBox(height: 5.h),
        SizedBox(
            width: 358.w,
            child: Center(
              child: FormBuilderTextField(
                name: "email",
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.email(
                      errorText: LocaleKeys
                          .login_screen_mail_check_invalid_email.locale),
                  FormBuilderValidators.required(
                      errorText:
                          LocaleKeys.login_screen_mail_check_empty_email.locale)
                ]),
                controller: notifier.emailController,
                style: ref.textTheme.labelSmall,
                decoration: emailTextfieldDecoration(ref),
              ),
            ))
      ],
    );
  }

  InputDecoration emailTextfieldDecoration(WidgetRef ref) {
    return InputDecoration(
        errorStyle: TextStyle(fontSize: 12.sp, color: ref.colorScheme.error),
        prefixIcon: Icon(
          Icons.mail_outline,
          size: 20.w,
        ),
        prefixIconColor: ref.colorScheme.secondary,
        contentPadding: ref.paddingVertical1,
        filled: true,
        fillColor: ref.colorScheme.onPrimary);
  }

  Column passwordTextfield(WidgetRef ref, LoginController notifier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: ref.paddingHorizontal1,
          child: Text(
            LocaleKeys.login_screen_password.locale,
            style: ref.textTheme.headlineSmall,
          ),
        ),
        SizedBox(height: 5.h),
        SizedBox(
            width: 358.w,
            child: Center(
              child: TextField(
                controller: notifier.passwordController,
                obscureText: ref.watch(loginController).obscureText,
                obscuringCharacter: "*",
                style: ref.textTheme.labelSmall,
                decoration: passwordTextfieldDecoration(notifier, ref),
              ),
            ))
      ],
    );
  }

  InputDecoration passwordTextfieldDecoration(
      LoginController notifier, WidgetRef ref) {
    return InputDecoration(
        suffixIcon: IconButton(
          splashRadius: 10.w,
          onPressed: notifier.changePasswordVisibility,
          icon: ref.watch(loginController).obscureText
              ? Icon(
                  Icons.visibility,
                  size: 20.w,
                )
              : Icon(
                  Icons.visibility_off_outlined,
                  size: 20.w,
                ),
        ),
        suffixIconColor: ref.colorScheme.onInverseSurface,
        prefixIcon: Icon(
          Icons.lock_outline,
          size: 20.w,
        ),
        prefixIconColor: ref.colorScheme.onSecondary,
        contentPadding: ref.paddingVertical1,
        filled: true,
        fillColor: ref.colorScheme.onPrimary);
  }

  SizedBox loginButton(
      WidgetRef ref, LoginController notifier, BuildContext context) {
    LoadingStateEnum loadingState =
        ref.watch(loginServiceProvider).requestState.state;
    return SizedBox(
      width: 284.w,
      height: 45.h,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 10.h, backgroundColor: ref.colorScheme.inverseSurface),
          onPressed: notifier.login,
          child: switch (loadingState) {
            LoadingStateEnum.NONE => Text(
                LocaleKeys.login_screen_login_button.locale,
                style: ref.textTheme.displaySmall,
              ),
            LoadingStateEnum.LOADING => Center(
                child: CircularProgressIndicator(),
              ),
            LoadingStateEnum.SUCCESS => Icon(
                Icons.check,
                size: 15.w,
              ),
            LoadingStateEnum.FAIL => Icon(
                Icons.error,
                size: 15.w,
              ),
          }),
    );
  }
}
