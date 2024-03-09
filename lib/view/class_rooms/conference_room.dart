import 'package:classroom_manager/core/utils/assets.dart';
import 'package:classroom_manager/core/utils/constants.dart';
import 'package:classroom_manager/core/utils/string_constants.dart';
import 'package:classroom_manager/view/class_rooms/widgets/classroom_detail_card_widget.dart';
import 'package:classroom_manager/widgets/common_appbar.dart';
import 'package:flutter/material.dart';

class ConferenceRoomScreen extends StatelessWidget {
  const ConferenceRoomScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "Dodgerblue",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Constants.pheight04(context),
              ClassroomDetailCardWidget(
                onTap: () {},
                title: "Chemistry",
                buttonTitle: StringConstants.CHANGE,
              ),
              Constants.pheight10(context),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: 20,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 15,
                      childAspectRatio: 0.8 / 0.85,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: Center(
                          child: Image.asset(
                            Assets.IC_STUDENT_LEFT,
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
