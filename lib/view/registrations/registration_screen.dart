import 'package:classroom_manager/core/theme/app_colors.dart';
import 'package:classroom_manager/core/utils/constants.dart';
import 'package:classroom_manager/core/utils/string_constants.dart';
import 'package:classroom_manager/view/class_rooms/conference_room.dart';
import 'package:classroom_manager/view/registrations/new_registration_screen.dart';
import 'package:classroom_manager/view/registrations/widgets/button_widget.dart';
import 'package:classroom_manager/view/registrations/widgets/register_card.dart';
import 'package:classroom_manager/widgets/common_appbar.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text(
                StringConstants.REGISTRATION,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Constants.pheight03(context),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ConferenceRoomScreen()));
                        },
                        child:
                            const RegisterCard(title: 'Registration id: #660'),
                      ),
                    );
                  }),
            ),
            Constants.pheight02(context),
            ButtonWidget(
              title: StringConstants.NEW_REGISTRATION,
              backgroundColor: AppColor.secondaryButtonColor,
              textColor: AppColor.blueColor,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NewRegistrationScreen()));
              },
            ),
          ],
        ),
      )),
    );
  }
}
