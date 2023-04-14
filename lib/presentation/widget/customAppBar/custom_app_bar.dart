import 'package:fit_track/config/routes_manager.dart';
import 'package:fit_track/presentation/auth/view_model/login_cubit.dart';
import 'package:fit_track/utils/resources/color_manager.dart';
import 'package:fit_track/utils/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.onPressed,
    this.automaticallyImplyLeading,
    this.action,
  });

  final Widget? title;
  final VoidCallback? onPressed;
  final bool? automaticallyImplyLeading;
  final List<Widget>? action;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      bottom: AppBar(
          automaticallyImplyLeading: automaticallyImplyLeading ?? true,
          leading: IconButton(
              onPressed: onPressed ??
                  () {
                    Navigator.pop(context);
                  },
              icon: Icon(
                Icons.arrow_back_ios,
                size: AppSizeHeight.s16,
              )),
          title: title,
          actions: action ??
              [
                IconButton(
                    onPressed: () {
                      context.read<LoginCubit>().logout().then((value) => {
                            Navigator.pushNamedAndRemoveUntil(
                                context, Routes.loginRoute, (route) => false)
                          });
                    },
                    icon: Icon(
                      Icons.power_settings_new_outlined,
                      color: ColorManager.instance.redColor,
                    ))
              ]),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        AppSizeHeight.s100,
      );
}
