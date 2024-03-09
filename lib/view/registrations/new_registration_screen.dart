import 'package:classroom_manager/core/theme/app_colors.dart';
import 'package:classroom_manager/core/utils/constants.dart';
import 'package:classroom_manager/core/utils/string_constants.dart';
import 'package:classroom_manager/view/registrations/widgets/button_widget.dart';
import 'package:classroom_manager/view/registrations/widgets/register_card.dart';
import 'package:classroom_manager/widgets/common_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewRegistrationScreen extends StatelessWidget {
  const NewRegistrationScreen({super.key});

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
                  StringConstants.NEW_REGISTRATION,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Constants.pheight04(context),
              const RegisterCard(title: StringConstants.SELECT_STUDENT),
              Constants.pheight02(context),
              const RegisterCard(title: StringConstants.SELECT_SUBJECT),
              Constants.pheight08(context),
              ButtonWidget(
                title: StringConstants.REGISTER,
                backgroundColor: AppColor.primaryButtonColor,
                textColor: AppColor.primaryColor,
                onTap: () {
                  alertDialog(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  alertDialog(BuildContext context) {
    return showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: const Text(StringConstants.DELETE),
              actions: [
                CupertinoDialogAction(
                    onPressed: () {},
                    child: const Text(
                      StringConstants.NO,
                      style: TextStyle(color: AppColor.blueColor),
                    )),
                CupertinoDialogAction(
                    onPressed: () {},
                    child: const Text(
                      StringConstants.YES,
                      style: TextStyle(color: AppColor.blueColor),
                    ))
              ],
              content: const Text(StringConstants.DO_YOU_WANT_DELETE),
            ));
  }
}
