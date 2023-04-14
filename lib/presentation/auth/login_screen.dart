import 'package:fit_track/presentation/auth/view_model/login_cubit.dart';
import 'package:fit_track/presentation/widget/customButton/custom_elevated_button.dart';
import 'package:fit_track/presentation/widget/customButton/custom_icon_button.dart';
import 'package:fit_track/presentation/widget/customCircularProgress/custom_loading.dart';
import 'package:fit_track/presentation/widget/customTextField/custom_text_field.dart';
import 'package:fit_track/utils/resources/color_manager.dart';
import 'package:fit_track/utils/resources/decoration_manager.dart';
import 'package:fit_track/utils/resources/font_manager.dart';
import 'package:fit_track/config/routes_manager.dart';
import 'package:fit_track/utils/resources/image_path_manager.dart';
import 'package:fit_track/utils/resources/string_manager.dart';
import 'package:fit_track/utils/resources/styles_manager.dart';
import 'package:fit_track/utils/resources/utils.dart';
import 'package:fit_track/utils/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildLoginBody(),
    );
  }

  Widget _buildLoginBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p24, vertical: AppPadding.p80),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringManager.instance.welcomeBack,
                    style: getBoldStyle(
                        color: ColorManager.instance.black,
                        fontSize: FontSize.s28),
                  ),
                  SizedBoxManager.instance.sized4h,
                  Text(StringManager.instance.loginIntoYourAccout,
                      style:
                          getRegularStyle(color: ColorManager.instance.gray)),
                  SizedBoxManager.instance.sized40h,
                  _buildLoginForm(),
                  SizedBoxManager.instance.sized40h,
                  _buildOtherSignIn(),
                  SizedBoxManager.instance.sized130h,
                  Container(
                    height: AppSizeHeight.s50,
                    child: SizedBox(
                        width: double.infinity,
                        child: CustomElevatedButton(
                          widget: BlocConsumer<LoginCubit, LoginState>(
                            listener: (context, state) {
                              if (state is LoginSuccess) {
                                Navigator.pushReplacementNamed(
                                    context, Routes.homeRoute);
                              } else if (state is LoginError) {
                                Utils.snackbar(context, state.title);
                              }
                            },
                            builder: (context, state) {
                              if (state is LoginLoading) {
                                return const CustomLoading();
                              } else {
                                return Text(StringManager.instance.signIn);
                              }
                            },
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<LoginCubit>().signIn(
                                  emailController.text,
                                  passwordController.text);
                            }
                          },
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildOtherSignIn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.registerRoute);
            },
            child: Text(StringManager.instance.signUp)),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomIconButton(
              onPressed: () {},
              icon: Image.asset(ImagePathManager.instance.facebookPath),
            ),
            SizedBoxManager.instance.sized12w,
            CustomIconButton(
              onPressed: () {},
              icon: Image.asset(ImagePathManager.instance.googlePath),
            ),
            SizedBoxManager.instance.sized12w,
            CustomIconButton(
              onPressed: () {},
              icon: Image.asset(ImagePathManager.instance.macPath),
            ),
          ],
        ),
      ],
    );
  }

  Form _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
              validator: Utils.isEmptyValidator,
              controller: emailController,
              hintText: StringManager.instance.yourAcount),
          SizedBoxManager.instance.sized24h,
          CustomTextField(
              validator: Utils.isEmptyValidator,
              controller: passwordController,
              obscure: true,
              hintText: StringManager.instance.password)
        ],
      ),
    );
  }
}
