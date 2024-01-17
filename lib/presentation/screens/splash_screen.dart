import 'package:flutter/material.dart';
import 'package:liftlogpro_app/data/database/sql_db.dart';
import 'package:logger/logger.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // Future.delayed(
    //   const Duration(milliseconds: 100),
    //   () => Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => const HomeHook(),
    //     )
    //   ),
    // );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("Splash Screen"),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     Initializing db = Initializing();
      //     // for (var i = 0; i < preScheduleList.length; i++) {
      //     //   await db.createScheduleSetsTable();
      //     //   await db.insertDataToScheduleSetsTable(preScheduleList[i]);
      //     // }
      //     //await db.retrieveDataFromTable();
      //    // await db.searchDataFromTable();
      //     Logger().i("SUCCESS");
      //   },
      //   child: const Icon(Icons.data_array),
      // ),
    );
  }
}
