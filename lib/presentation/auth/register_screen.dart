import 'package:fit_track/config/routes_manager.dart';
import 'package:fit_track/presentation/auth/view_model/login_cubit.dart';
import 'package:fit_track/presentation/widget/customAppBar/custom_app_bar.dart';
import 'package:fit_track/presentation/widget/customButton/custom_elevated_button.dart';
import 'package:fit_track/presentation/widget/customCircularProgress/custom_loading.dart';
import 'package:fit_track/presentation/widget/customTextField/custom_text_field.dart';
import 'package:fit_track/utils/resources/decoration_manager.dart';
import 'package:fit_track/utils/resources/string_manager.dart';
import 'package:fit_track/utils/resources/utils.dart';
import 'package:fit_track/utils/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController nameController;

  late TextEditingController emailController;
  late TextEditingController passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    nameController = TextEditingController();
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
      appBar: const CustomAppBar(
        title: Text("Create An Account"),
        action: [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p24, vertical: AppPadding.p80),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildNameTextField(),
                    SizedBoxManager.instance.sized12h,
                    _buildEmailTextField(),
                    SizedBoxManager.instance.sized12h,
                    _buildPasswordTextField(),
                  ],
                ),
                SizedBoxManager.instance.sized40h,
                SizedBoxManager.instance.sized40h,
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildCreateAccountButton(context),
                    SizedBoxManager.instance.sized12h,
                    Text(StringManager.instance.alreadyHaveAnAccount),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.loginRoute);
                        },
                        child: Text(StringManager.instance.signIn)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  CustomTextField _buildPasswordTextField() {
    return CustomTextField(
      obscure: true,
      controller: passwordController,
      validator: Utils.isEmptyValidator,
      hintText: StringManager.instance.password,
    );
  }

  CustomTextField _buildEmailTextField() {
    return CustomTextField(
      controller: emailController,
      validator: Utils.isEmptyValidator,
      hintText: StringManager.instance.yourMail,
    );
  }

  CustomTextField _buildNameTextField() {
    return CustomTextField(
      controller: nameController,
      validator: Utils.isEmptyValidator,
      hintText: StringManager.instance.yourName,
    );
  }

  SizedBox _buildCreateAccountButton(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: CustomElevatedButton(
          widget: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                Navigator.pushReplacementNamed(context, Routes.homeRoute);
              } else if (state is LoginError) {
                Utils.snackbar(context, state.title);
              }
            },
            builder: (context, state) {
              if (state is LoginLoading) {
                return const CustomLoading();
              } else {
                return Text(StringManager.instance.createAccount);
              }
            },
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              context.read<LoginCubit>().register(
                  name: nameController.text,
                  email: emailController.text,
                  password: passwordController.text);
            }
          },
        ));
  }
}
