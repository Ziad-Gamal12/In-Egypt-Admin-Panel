import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/Features/Auth/presentation/Views/Widgets/SignInViewWidgets/CustomRemmberMeWidget.dart';
import 'package:in_egypt_admin_panel/Features/Auth/presentation/Views/Widgets/SignInViewWidgets/CustomSeperatedWidget.dart';
import 'package:in_egypt_admin_panel/Features/Auth/presentation/Views/Widgets/SignInViewWidgets/CustomSignInActionButton.dart';
import 'package:in_egypt_admin_panel/Features/Auth/presentation/Views/Widgets/SignInViewWidgets/CutomSignUpNavigationButton.dart';
import 'package:in_egypt_admin_panel/Features/Auth/presentation/Views/Widgets/SignInViewWidgets/ForgetPasswordText.dart';
import 'package:in_egypt_admin_panel/Features/Auth/presentation/Views/Widgets/SignInViewWidgets/SignInTextFields.dart';
import 'package:in_egypt_admin_panel/Features/Auth/presentation/Views/Widgets/SignInViewWidgets/SigninSocialButtons.dart';
import 'package:in_egypt_admin_panel/Features/Auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/core/helpers/ShowSnackBar.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomAppLogoWidget.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomLoadingWidget.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
        } else if (state is SignInFailure) {
          showErrorSnackBar(context: context, message: state.errorMessage);
        }
      },
      builder: (context, state) {
        return CustomLoadingWidget(
          isloading: state is SignInLoading,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kHorizentalPadding,
                vertical: kVerticalPadding,
              ),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: CustomAppLogoWidget(),
                    ),
                    Spacer(),
                    SignInTextFields(
                      emailController: emailController,
                      passwordController: passwordController,
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [CustomRemmberMeWidget(), ForgetPasswordText()],
                    ),
                    SizedBox(height: 40),
                    CutomSignUpNavigationButton(),
                    SizedBox(height: 20),
                    CustomSignInActionButton(
                      emailController: emailController,
                      passwordController: passwordController,
                      formKey: formKey,
                    ),
                    SizedBox(height: 20),
                    CustomSeperatedWidget(),
                    SizedBox(height: 20),
                    SigninSocialButtons(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
