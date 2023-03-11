import 'package:chat_gpt_app/ui/view/widgets/drop_down.dart';
import 'package:flutter/material.dart';

import '../../ui/view/widgets/text_widget.dart';
import '../constants/constants.dart';

class Services {
  static Future<void> showModalSheet({required BuildContext context}) async {
    await showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        backgroundColor: scaffoldBgColor,
        context: context,
        builder: (context) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  TextWidget(
                    label: "Chosen Model",
                    fontSize: 16,
                  ),
                  Flexible(
                    flex: 2,
                    child: ModelsDropDownWidget(),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
