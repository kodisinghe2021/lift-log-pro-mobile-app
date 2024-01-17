import 'package:flutter/material.dart';
import 'package:liftlogpro_app/presentation/screens/home_tabs/home_screen.dart';
import 'package:liftlogpro_app/presentation/screens/home_tabs/shedule_screen/schedule_screen.dart';
import 'package:liftlogpro_app/presentation/screens/home_tabs/workouts.dart';

class HomeHook extends StatefulWidget {
  const HomeHook({super.key});

  @override
  State<HomeHook> createState() => _HomeHookState();
}

class _HomeHookState extends State<HomeHook> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabPages,
      ),
    );
  }
}

List<Tab> tabs = const [
  Tab(
    child: Text("Home"),
  ),
  Tab(
    child: Text("Workouts"),
  ),
  Tab(
    child: Text("Schedule"),
  ),
];

List<Widget> tabPages = [
  const HomeScreen(),
  const WorkoutsScreen(),
  ScheduleScreen(),
];
