import 'package:fit_track/presentation/home/add_training/view_model/add_training_cubit.dart';
import 'package:fit_track/presentation/home/list_training/view_model/list_training_cubit.dart';
import 'package:fit_track/presentation/widget/customAppBar/custom_app_bar.dart';
import 'package:fit_track/presentation/widget/customButton/custom_elevated_button.dart';
import 'package:fit_track/presentation/widget/customCircularProgress/custom_loading.dart';
import 'package:fit_track/presentation/widget/customTextField/custom_text_field.dart';
import 'package:fit_track/utils/resources/decoration_manager.dart';
import 'package:fit_track/utils/resources/string_manager.dart';
import 'package:fit_track/utils/resources/styles_manager.dart';
import 'package:fit_track/utils/resources/utils.dart';
import 'package:fit_track/utils/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTrainingScreen extends StatefulWidget {
  const AddTrainingScreen({super.key, required this.dayName});
  final String dayName;
  @override
  State<AddTrainingScreen> createState() => _AddTrainingScreenState();
}

class _AddTrainingScreenState extends State<AddTrainingScreen> {
  TextEditingController workoutNameController = TextEditingController();
  TextEditingController workoutTimeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          StringManager.instance.addTraining,
        ),
        onPressed: () {
          Navigator.pop(context);
          context.read<ListTrainingCubit>().getTraining(day: widget.dayName);
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p35, vertical: AppPadding.p20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringManager.instance.addSubs,
                style: getHeadStyle(),
              ),
              SizedBoxManager.instance.sized20h,
              _buildAddTraininForm(size, context),
            ],
          ),
        ),
      ),
    );
  }

  Form _buildAddTraininForm(Size size, BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildTrainingNameTextField(),
          SizedBoxManager.instance.sized20h,
          _buildTrainingTimeTextField(),
          SizedBoxManager.instance.sized20h,
          _buildAddButton(size, context),
        ],
      ),
    );
  }

  SizedBox _buildAddButton(Size size, BuildContext context) {
    return SizedBox(
      width: size.width * 0.400,
      child: CustomElevatedButton(
          widget: BlocConsumer<AddTrainingCubit, AddTrainingState>(
            listener: (context, state) {
              if (state is AddTrainingError) {
                Utils.snackbar(context, state.title);
              } else if (state is AddTrainingSuccess) {
                Utils.snackbar(context, state.title);
                context
                    .read<ListTrainingCubit>()
                    .getTraining(day: widget.dayName)
                    .then((value) => Navigator.pop(context));
              }
            },
            builder: (context, state) {
              if (state is AddTrainingLoading) {
                return const CustomLoading();
              }
              return Text(StringManager.instance.add);
            },
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              context.read<AddTrainingCubit>().addWorkout(
                  workoutName: workoutNameController.text,
                  workoutTime: workoutTimeController.text,
                  date: widget.dayName);
            }
          }),
    );
  }

  Widget _buildTrainingTimeTextField() {
    return CustomTextField(
      validator: Utils.isEmptyValidator,
      controller: workoutTimeController,
      hintText: StringManager.instance.traningTime,
    );
  }

  Widget _buildTrainingNameTextField() {
    return CustomTextField(
      validator: Utils.isEmptyValidator,
      controller: workoutNameController,
      hintText: StringManager.instance.traningName,
    );
  }
}
