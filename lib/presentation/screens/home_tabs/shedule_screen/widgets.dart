part of 'schedule_screen.dart';

class BottomForm extends StatelessWidget {
  const BottomForm({
    super.key,
    required ScheduleScreenController controller,
  }) : _controller = controller;

  final ScheduleScreenController _controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h(context) * .14,
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: TextFormField(
                    controller: _controller.setName,
                    decoration: InputDecoration(
                      hintText: "Enter your set name",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: kLightRed,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Expanded(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          width: 3,
                          color: kLightRed,
                        ),
                      ),
                      child: _controller.isUpdate.value
                          ? IconButton(
                              padding: const EdgeInsets.all(5),
                              onPressed: () {
                                if (_controller.setName.text.isEmpty) {
                                  tShowWarning("Empty set Name");
                                  return;
                                }
                                _controller.setName.clear();
                              },
                              icon: const Icon(Icons.upload),
                            )
                          : IconButton(
                              padding: const EdgeInsets.all(5),
                              onPressed: () {
                                if (_controller.setName.text.isEmpty) {
                                  tShowWarning("Empty set Name");
                                  return;
                                }
                                _controller.saveItem();
                                _controller.setName.clear();
                                _controller.scrollController.animateTo(
                                  _controller.scrollController.position
                                      .maxScrollExtent,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.fastOutSlowIn,
                                );
                              },
                              icon: const Icon(Icons.skip_next_rounded),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () async {
              //  await LiftProDB().insertToSets("BBBB");
                Logger().f("SUCCESS");
              //  await LiftProDB().fetchAll();
              },
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: w(context) * .15,
                  vertical: h(context) * .005,
                ),
                // height: h(context) * .06,
                // width: w(context) * .4,
                decoration: BoxDecoration(
                  color: kLightRed,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    "Save",
                    style: TextStyle(
                      fontFamily: 'Roboto-bold',
                      fontSize: 16,
                      color: kWhite,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      //child: BottomForm(),
      //  child: BottomForm(),
    );
  }
}

//====================================================================

class DaySelector extends StatefulWidget {
  const DaySelector({super.key});

  @override
  State<DaySelector> createState() => _DaySelectorState();
}

class _DaySelectorState extends State<DaySelector>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _paddingAnimation;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _paddingAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn, // Choose a curve that suits your animation
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget oneCard(String text, Color color) => Container(
        height: h(context) * .06,
        width: w(context) * .3,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: color.withOpacity(.7),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.roboto(
              color: kWhite,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );

  // int frontIndex = 0;

  void tapped(int index) async {
    if (_animationController.status == AnimationStatus.completed) {
      await _animationController.reverse();
    } else {
      await _animationController.forward();
    }
    frontIndexRx.value = index;
    // isNotExpandedRx.value = !isNotExpandedRx.value;
  }

  ValueNotifier<int> frontIndexRx = ValueNotifier(0);
  ValueNotifier<bool> isNotExpandedRx = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    List<Widget> wList = [
      InkWell(
        onTap: () {
          Logger().i("Tap");
          tapped(0);
        },
        child: oneCard("Select Day", const Color(0xFF0F1035)),
      ),
      InkWell(
        onTap: () => tapped(1),
        child: oneCard("Day 1", const Color(0xFF030637)),
      ),
      InkWell(
        onTap: () => tapped(2),
        child: oneCard("Day 2", const Color(0xFF3C0753)),
      ),
      InkWell(
        onTap: () => tapped(3),
        child: oneCard("Day 3", const Color(0xFF720455)),
      ),
      InkWell(
        onTap: () => tapped(4),
        child: oneCard("Day 4", const Color(0xFF910A67)),
      ),
    ];

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) => Stack(
        children: [
          Positioned(
            left: w(context) * .4 * _paddingAnimation.value,
            top: h(context) * .220 * _paddingAnimation.value,
            child: wList[4],
          ),
          Positioned(
            left: w(context) * .3 * _paddingAnimation.value,
            top: h(context) * .165 * _paddingAnimation.value,
            child: wList[3],
          ),
          Positioned(
            left: w(context) * .2 * _paddingAnimation.value,
            top: h(context) * .11 * _paddingAnimation.value,
            child: wList[2],
          ),
          Positioned(
            left: w(context) * .1 * _paddingAnimation.value,
            top: h(context) * .055 * _paddingAnimation.value,
            child: wList[1],
          ),
          ValueListenableBuilder(
            valueListenable: frontIndexRx,
            builder: (context, value, child) => Positioned(
              top: 0,
              left: 0,
              child: wList[frontIndexRx.value],
            ),
          ),
        ],
      ),
    );
  }
}
