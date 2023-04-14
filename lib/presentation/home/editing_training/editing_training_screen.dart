import 'package:fit_track/domain/model/workout.dart';
import 'package:fit_track/presentation/home/editing_training/view_model/editing_training_cubit.dart';
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

class EditingTrainingScreen extends StatefulWidget {
  const EditingTrainingScreen({
    super.key,
    required this.workout,
  });

  final Workout workout;

  @override
  State<EditingTrainingScreen> createState() => _EditingTrainingScreenState();
}

class _EditingTrainingScreenState extends State<EditingTrainingScreen> {
  TextEditingController workupNameController = TextEditingController();
  TextEditingController workupTimeController = TextEditingController();

  @override
  void initState() {
    workupNameController.text = widget.workout.name;
    workupTimeController.text = widget.workout.time;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _buildEditingAppBar(),
      body: _buildEditingBody(size, context),
    );
  }

  Padding _buildEditingBody(Size size, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p35, vertical: AppPadding.p20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringManager.instance.editingTrailingSubs,
              style: getHeadStyle(),
            ),
            SizedBoxManager.instance.sized20h,
            _buildEditingForm(size, context),
          ],
        ),
      ),
    );
  }

  Form _buildEditingForm(Size size, BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildTraningName(),
          SizedBoxManager.instance.sized20h,
          _buildTraninngTime(),
          SizedBoxManager.instance.sized20h,
          _buildUpdateButton(size, context),
        ],
      ),
    );
  }

  SizedBox _buildUpdateButton(Size size, BuildContext context) {
    return SizedBox(
        width: size.width * 0.400,
        child: CustomElevatedButton(
            widget: BlocConsumer<EditingTrainingCubit, EditingTrainingState>(
              listener: (context, state) {
                if (state is EditingTrainingSuccess) {
                     Utils.snackbar(context, state.title!);

                  context
                      .read<ListTrainingCubit>()
                      .getTraining(day: widget.workout.day)
                      .then((value) => Navigator.pop(context));
                } else if (state is EditingTrainingError) {
                     Utils.snackbar(context, state.title);
                }
              },
              builder: (context, state) {
                if (state is EditingTrainingLoading) {
                  return const CustomLoading();
                }
                return Text(StringManager.instance.update);
              },
            ),
            onPressed: () {
              context.read<EditingTrainingCubit>().editWorkout(
                  workoutName: workupNameController.text,
                  workoutTime: workupTimeController.text,
                  day: widget.workout.day,
                  documentID: widget.workout.id);
            }));
  }

  Widget _buildTraninngTime() {
    return CustomTextField(
      controller: workupTimeController,
      hintText: StringManager.instance.traningTime,
    );
  }

  Widget _buildTraningName() {
    return CustomTextField(
      controller: workupNameController,
      hintText: StringManager.instance.traningName,
    );
  }

  CustomAppBar _buildEditingAppBar() {
    return CustomAppBar(
      title: Text(widget.workout.name),
    );
  }
}
