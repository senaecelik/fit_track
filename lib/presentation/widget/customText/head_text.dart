import 'package:fit_track/presentation/auth/view_model/login_cubit.dart';
import 'package:fit_track/utils/resources/string_manager.dart';
import 'package:fit_track/utils/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeadText extends StatefulWidget {
  const HeadText({
    super.key,
  });

  @override
  State<HeadText> createState() => _HeadTextState();
}

class _HeadTextState extends State<HeadText> {
  @override
  void initState() {
    context.read<LoginCubit>().getUserName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      if (state is LoginDisplay) {
        return Text(
          "${StringManager.instance.hello} ${state.userName}",
          style: getHeadStyle(),
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
