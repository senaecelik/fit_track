import 'package:fit_track/domain/model/workout.dart';
import 'package:fit_track/presentation/home/list_training/view_model/list_training_cubit.dart';
import 'package:fit_track/presentation/widget/customAppBar/custom_app_bar.dart';
import 'package:fit_track/presentation/widget/customCard/custom_card_list_tile.dart';
import 'package:fit_track/presentation/widget/customCard/custom_not_found_card.dart';
import 'package:fit_track/presentation/widget/customCircularProgress/custom_loading.dart';
import 'package:fit_track/presentation/widget/customText/head_text.dart';
import 'package:fit_track/utils/resources/color_manager.dart';
import 'package:fit_track/utils/resources/decoration_manager.dart';
import 'package:fit_track/config/routes_manager.dart';
import 'package:fit_track/utils/resources/string_manager.dart';
import 'package:fit_track/utils/resources/styles_manager.dart';
import 'package:fit_track/utils/resources/utils.dart';
import 'package:fit_track/utils/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListTrainingScreen extends StatefulWidget {
  const ListTrainingScreen({super.key, required this.dayName});

  final String dayName;

  @override
  State<ListTrainingScreen> createState() => _ListTrainingScreenState();
}

class _ListTrainingScreenState extends State<ListTrainingScreen> {
  @override
  void initState() {
    context.read<ListTrainingCubit>().getTraining(day: widget.dayName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      floatingActionButton: _buildAddTrainingFloatingActionButton(context),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p35, vertical: AppPadding.p20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeadText(),
            Text(
              StringManager.instance.listTrailingSubs,
              style: getSubHeadStyle(),
            ),
            SizedBoxManager.instance.sized20h,
            _buildTrainingList()
          ],
        ),
      ),
    );
  }

  BlocConsumer<ListTrainingCubit, ListTrainingState> _buildTrainingList() {
    return BlocConsumer<ListTrainingCubit, ListTrainingState>(
      listener: (context, state) {
        if (state is ListTrainingSuccess) {
          Utils.snackbar(context, state.title);
        }
      },
      builder: (context, state) {
        debugPrint(state.toString());
        if (state is ListTrainingLoading) {
          return Center(
            child: CustomLoading(
              color: ColorManager.instance.primary,
            ),
          );
        }
        if (state is ListTrainingDisplay) {
          return _listTrainingDisplay(state);
        } else if (state is ListTrainingNotFound) {
          return const CustomNotFoundCard();
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _listTrainingDisplay(ListTrainingDisplay state) {
    return SizedBox(
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBoxManager.instance.sized8h;
        },
        shrinkWrap: true,
        itemCount: state.workoutList.length,
        itemBuilder: (context, index) {
          return CustomCardListTile(
            title:
                "${state.workoutList[index].name} - ${state.workoutList[index].time} ",
            trailing: IconButton(
                onPressed: () {
                  context.read<ListTrainingCubit>().deleteTraining(
                      day: widget.dayName,
                      documentID: state.workoutList[index].id);
                },
                icon: Icon(
                  Icons.delete_outline,
                  color: ColorManager.instance.black,
                )),
            onTap: () {
              Workout workout = state.workoutList[index];
              Navigator.pushNamed(context, Routes.editingTrainingRoute,
                  arguments: workout);
            },
          );
        },
      ),
    );
  }

  FloatingActionButton _buildAddTrainingFloatingActionButton(
      BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          String dayName = widget.dayName;
          Navigator.pushNamed(context, Routes.addTraningRoute,
              arguments: dayName);
        },
        child: const Icon(Icons.add));
  }

  CustomAppBar _buildAppBar() {
    return CustomAppBar(
      title: Text(StringManager.instance.workout),
    );
  }
}
