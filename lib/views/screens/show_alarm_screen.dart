import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tingting/views/widgets/custom_clock/clock.dart';

import '../../constants/dimens.dart';
import '../widgets/app_button.dart';
import '../widgets/custom_title.dart';

class ShowAlarmScreen extends StatelessWidget {
  const ShowAlarmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(Dimens.size24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: size.height * Dimens.size0dot02),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTitle(title: 'alarm_hello'.tr, style: theme.headline1),
                CustomTitle(title: 'alarm_add'.tr, style: theme.headline1),
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: size.height * Dimens.size0dot45,
              child: const Clock(),
            ),
            AppButton(
              onPressed: () => Get.toNamed("/add_alarm"),
              borderRadius: BorderRadius.circular(Dimens.size36),
              child: CustomTitle(
                title: 'alarm_add_btn'.tr,
                style: theme.button,
              ),
            )
          ],
        ),
      ),
    );
  }
}
