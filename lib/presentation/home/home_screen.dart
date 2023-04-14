import 'package:fit_track/domain/model/days.dart';
import 'package:fit_track/presentation/widget/customAppBar/custom_app_bar.dart';
import 'package:fit_track/presentation/widget/customCard/custom_card_list_tile.dart';
import 'package:fit_track/presentation/widget/customText/head_text.dart';
import 'package:fit_track/utils/resources/decoration_manager.dart';
import 'package:fit_track/config/routes_manager.dart';
import 'package:fit_track/utils/resources/string_manager.dart';
import 'package:fit_track/utils/resources/styles_manager.dart';
import 'package:fit_track/utils/resources/values_manager.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildHomeBody(),
    );
  }

  Padding _buildHomeBody() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p35, vertical: AppPadding.p20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeadText(),
          SizedBoxManager.instance.sized4h,
          Text(StringManager.instance.daysSubs, style: getSubHeadStyle()),
          SizedBoxManager.instance.sized20h,
          _buildDayList()
        ],
      ),
    );
  }

  Expanded _buildDayList() {
    return Expanded(
      child: SizedBox(
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBoxManager.instance.sized8h;
          },
          shrinkWrap: true,
          itemCount: dayList.length,
          itemBuilder: (context, index) {
            return CustomCardListTile(
              title: dayList[index].dayName,
              onTap: () {
                String dayName = dayList[index].dayName;

                Navigator.pushNamed(context, Routes.listTrainingRoute,
                    arguments: dayName);
              },
            );
          },
        ),
      ),
    );
  }

  CustomAppBar _buildAppBar(BuildContext context) {
    return CustomAppBar(
      automaticallyImplyLeading: false,
      onPressed: () {},
      title: Text(StringManager.instance.days),
    );
  }
}
