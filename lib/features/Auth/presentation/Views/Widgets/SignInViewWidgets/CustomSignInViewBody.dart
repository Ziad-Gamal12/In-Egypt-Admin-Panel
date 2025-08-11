import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/core/helpers/ShowSnackBar.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomAppLogoWidget.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomLoadingWidget.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/Widgets/SignInViewWidgets/CustomSignInActionButton.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/Widgets/SignInViewWidgets/CutomSignUpNavigationButton.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/Widgets/SignInViewWidgets/SignInTextFields.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/ResponsiveDashBaoardView.dart';

class CustomSignInViewBody extends StatefulWidget {
  const CustomSignInViewBody({super.key});

  @override
  State<CustomSignInViewBody> createState() => _CustomSignInViewBodyState();
}

class _CustomSignInViewBodyState extends State<CustomSignInViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          GoRouter.of(context).go(ResponsiveDashBaoardView.routeName);
        } else if (state is SignInFailure) {
          showErrorSnackBar(context: context, message: state.errorMessage);
        }
      },
      builder: (context, state) => CustomLoadingWidget(
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),

                  Expanded(child: CustomAppLogoWidget()),
                  SizedBox(height: 20),
                  SignInTextFields(
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                  SizedBox(height: 40),
                  CutomSignUpNavigationButton(),
                  SizedBox(height: 20),
                  CustomSignInActionButton(
                    emailController: emailController,
                    passwordController: passwordController,
                    formKey: formKey,
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
