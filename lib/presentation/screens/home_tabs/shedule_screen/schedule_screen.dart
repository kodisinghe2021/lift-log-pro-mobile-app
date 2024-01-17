import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liftlogpro_app/data/database/sql_db.dart';
import 'package:liftlogpro_app/model/schedule_model.dart';
import 'package:liftlogpro_app/presentation/widgets/toast_message.dart';
import 'package:liftlogpro_app/utils/constants/colors.dart';
import 'package:liftlogpro_app/utils/constants/diamentions.dart';
import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';

part '../../../../logic/controllers/schedule_screen_controller.dart';
part 'widgets.dart';

class ScheduleScreen extends StatelessWidget {
  ScheduleScreen({super.key});
  final ScheduleScreenController _controller =
      Get.put<ScheduleScreenController>(ScheduleScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(

        width: w(context),
        height: h(context),

//-------------STACK
        child: Stack(
          children: [
            Padding(
              padding:
                  EdgeInsets.fromLTRB(0, h(context) * .08, 0, h(context) * .13),
              child: Obx(
                () => ListView.separated(
                  shrinkWrap: true,
                  reverse: true,
                  controller: _controller.scrollController,
                  itemCount: _controller.addedSSList.length,
                  itemBuilder: (context, index) => ListTile(
                    onTap: () {
                      // _controller.setName.text = _controller
                      //     .scheduledSetsList.value[index].name
                      //     .toString();
                      // _controller.isUpdate.value = true;
                      // _controller.tappedIndex.value = index;
                    },
                    leading: Text(
                      (index + 1).toString(),
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        color: kLightRed,
                      ),
                    ),
                    title: Text(
                      _controller.addedSSList[index].setName.toString(),
                      // _controller.scheduledSetsList.value[index].name
                      //     .toString(),
                      style: GoogleFonts.roboto(
                        fontSize: 17,
                        color: kLightRed,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => const Divider(),
                ),
              ),
            ),
            Positioned(
              top: h(context) * .02,
              left: 10,
              child: SizedBox(
                width: w(context) * .7,
                height: h(context) * .3,
                child: const DaySelector(),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: BottomForm(controller: _controller),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
