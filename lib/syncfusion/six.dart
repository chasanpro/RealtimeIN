import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:realtime/widget.dart';

class sixpreset extends StatefulWidget {
  final DateTime? minimumDate;

  final DateTime? maximumDate;

  final DateTime? initialStartDate;

  final DateTime? initialEndDate;
  final String? typeofCalandar;

  final Function(DateTime, DateTime)? startEndDateChange;

  const sixpreset({
    Key? key,
    this.typeofCalandar,
    this.initialStartDate,
    this.initialEndDate,
    this.startEndDateChange,
    this.minimumDate,
    this.maximumDate,
  }) : super(key: key);

  @override
  sixpresetState createState() => sixpresetState();
}

class sixpresetState extends State<sixpreset> {
  List<DateTime> dateList = <DateTime>[];

  DateTime currentMonthDate = DateTime.now();

  DateTime? startDate;

  DateTime? endDate;

  @override
  void initState() {
    setListOfDate(currentMonthDate);
    if (widget.initialStartDate != null) {
      startDate = widget.initialStartDate;
    }
    if (widget.initialEndDate != null) {
      endDate = widget.initialEndDate;
    }

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

//getting days form month
  void setListOfDate(DateTime monthDate) {
    print("select list of date");
    dateList.clear();
    var x = 0;
    final DateTime newDate = DateTime(monthDate.year, monthDate.month, 0);
    int previousMothDay = 0;

    if (newDate.weekday < 6) {
      previousMothDay = newDate.weekday;
      //past month dates
      for (int i = 0; i <= previousMothDay + 1; i++) {
        dateList.add(newDate.subtract(Duration(days: previousMothDay - i)));
      }

      dateList.removeLast();
    } else if (newDate.weekday == 7) {
      previousMothDay = 1;
      //past month dates
      for (int i = 0; i <= previousMothDay + 1; i++) {
        dateList.add(newDate.subtract(Duration(days: previousMothDay - i)));
      }

      dateList.removeLast();
    }

    if (newDate.weekday == 6) {
      for (int i = 0; i < (34 - previousMothDay + 1); i++) {
        dateList.add(newDate.add(Duration(days: i + 1)));
      }
    } else if (newDate.weekday == 5) {
      for (int i = 0; i < (41 - previousMothDay); i++) {
        dateList.add(newDate.add(Duration(days: i + 1)));
      }
    } else {
      for (int i = 0; i < (34 - previousMothDay); i++) {
        dateList.add(newDate.add(Duration(days: i + 1)));
      }
    }
  }

  String action = "Today";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          // if (widget.typeofCalandar == "4P")
          Row(
            children: [
              SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width / 2.25,
                child: MaterialButton(
                  elevation: 0,
                  color: isActive("Y") ? Colors.blue : Colors.blue[50],
                  onPressed: () {
                    setState(() {
                      action = "Y";
                      print(action);
                      updateAction(action);
                    });
                  },
                  child: Center(
                    child: Text(
                      'Yesterday',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: isActive("Y") ? Colors.white : Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width / 2.25,
                child: MaterialButton(
                  elevation: 0,
                  color: isActive("Tod") ? Colors.blue : Colors.blue[50],
                  onPressed: () {
                    setState(() {
                      action = "Tod";
                      updateAction(action);
                    });
                  },
                  child: Center(
                    child: Text(
                      'Today',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: isActive("Tod") ? Colors.white : Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          spaceBox(20),
          Row(
            children: [
              SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width / 2.25,
                child: MaterialButton(
                  elevation: 0,
                  color: isActive("Tom") ? Colors.blue : Colors.blue[50],
                  onPressed: () {
                    setState(() {
                      action = "Tom";
                      updateAction(action);
                    });
                  },
                  child: Center(
                    child: Text(
                      'Tommorrow',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: isActive("Tom") ? Colors.white : Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width / 2.25,
                child: MaterialButton(
                  elevation: 0,
                  color: isActive("TSAT") ? Colors.blue : Colors.blue[50],
                  onPressed: () {
                    setState(() {
                      action = "TSAT";
                      updateAction(action);
                    });
                  },
                  child: Center(
                    child: Text(
                      'This Saturday',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: isActive("TSAT") ? Colors.white : Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          spaceBox(20),
          Row(
            children: [
              SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width / 2.25,
                child: MaterialButton(
                  elevation: 0,
                  color: isActive("TSUN") ? Colors.blue : Colors.blue[50],
                  onPressed: () {
                    setState(() {
                      action = "TSUN";
                      updateAction(action);
                    });
                  },
                  child: Center(
                    child: Text(
                      'This Sunday',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: isActive("TSUN") ? Colors.white : Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width / 2.25,
                child: MaterialButton(
                  elevation: 0,
                  color: isActive("NT") ? Colors.blue : Colors.blue[50],
                  onPressed: () {
                    setState(() {
                      action = "NT";
                      updateAction(action);
                    });
                  },
                  child: Center(
                    child: Text(
                      'Next Tuesday',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: isActive("NT") ? Colors.white : Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding:
                const EdgeInsets.only(left: 4.0, right: 4.0, top: 4, bottom: 4),
            //Header Row
            child: Row(
              children: <Widget>[
                const SizedBox(
                  width: 35,
                ),
                InkWell(
                  //left Arrow
                  child: Ink(
                      decoration: const ShapeDecoration(
                        shape: CircleBorder(),
                      ),
                      child: const Icon(Icons.arrow_left_rounded, size: 52)),
                  onTap: () {
                    setState(() {
                      currentMonthDate = DateTime(
                          currentMonthDate.year, currentMonthDate.month, 0);
                      setListOfDate(currentMonthDate);
                    });
                  },
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      DateFormat('MMMM yyyy').format(currentMonthDate),
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  child: Ink(
                      decoration: const ShapeDecoration(
                        shape: CircleBorder(),
                      ),
                      child: const Icon(Icons.arrow_right_rounded, size: 52)),
                  onTap: () {
                    setState(() {
                      currentMonthDate = DateTime(
                          currentMonthDate.year, currentMonthDate.month + 2, 0);
                      setListOfDate(currentMonthDate);
                    });
                  },
                ),
                const SizedBox(
                  width: 35,
                ),
              ],
            ),
          ),
          //Day names
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: getDaysNameUI(),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 2, left: 2),
            child: Column(
              children: getDaysNoUI(),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 8),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.blue,
                        size: 22,
                      ),
                      Text(
                        endDate != null
                            ? DateFormat('dd MMM yyyy').format(endDate!)
                            : '           ',
                        style: const TextStyle(fontSize: 13),
                      ),
                      const SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 6,
                ),
                SizedBox(
                  width: 60,
                  child: MaterialButton(
                    elevation: 0,
                    color: Colors.blue[50],
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Center(
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  width: 60,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(1.0)),
                      highlightColor: Colors.transparent,
                      onTap: () {},
                      child: const Center(
                        child: Text(
                          'Save',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Widget> getDaysNameUI() {
    final List<Widget> listUI = <Widget>[];
    for (int i = 0; i < 7; i++) {
      listUI.add(
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                DateFormat('EEE').format(dateList[i]),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return listUI;
  }

  bool isActive(String value) {
    if (value == action) {
      return true;
    }

    return false;
  }

  updateAction(String instruction) {
    if (instruction == "Tod") {
      setState(() {
        onDateClick(DateTime.now());
      });
    }
  }

  bool isThisMonth(DateTime testDate) {
    DateTime now = DateTime.now();
    if (DateFormat('MMMM yyyy').format(testDate) ==
        DateFormat('MMMM yyyy').format(currentMonthDate)) {
      return true;
    }
    return false;
  }

  Color cellColor(DateTime date) {
    if (date == startDate) {
      return Colors.white;
    } else if (date.day == DateTime.now().day &&
        date.month == DateTime.now().month &&
        date.year == DateTime.now().year) {
      return Colors.blue;
    } else if (isThisMonth(date)) {
      return Colors.black;
    }
    return Colors.grey;
  }

  List<Widget> getDaysNoUI() {
    final List<Widget> noList = <Widget>[];
    int count = 0;
    for (int i = 0; i < dateList.length / 7; i++) {
      final List<Widget> listUI = <Widget>[];
      for (int i = 0; i < 7; i++) {
        final DateTime date = dateList[count];

        listUI.add(
          Expanded(
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Stack(
                children: <Widget>[
                  //Date Cells list
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(32.0)),
                      onTap: () {
                        onDateClick(date);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                          width: 27,
                          height: 25,
                          child: Container(
                            width: 27,
                            height: 25,
                            decoration: BoxDecoration(
                              color: date == startDate
                                  ? Colors.blue
                                  : Colors.transparent,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(32.0)),
                              border: Border.all(
                                color: Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: Center(
                              //the text inside the cell
                              child: Text(
                                '${date.day}',
                                style: TextStyle(
                                    color: cellColor(date),
                                    //past month color
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
        count += 1;
      }
      noList.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: listUI,
      ));
    }

    return noList;
  }

  // bool getIsInRange(DateTime date) {
  //   if (startDate != null && endDate != null) {
  //     if (date.isAfter(startDate!) && date.isBefore(endDate!)) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } else {
  //     return false;
  //   }
  // }

//start DAte selctor
  void onDateClick(DateTime date) {
    // if (startDate!.month != date.month) {
    //   setListOfDate(startDate!);
    // }

    setState(() {
      startDate = endDate = date;
      currentMonthDate = startDate!;
      setListOfDate(currentMonthDate);
    });
  }

  bool is15(bool value) {
    return !value;
  }

  void addDAys(DateTime date, int count) {
    setState(() {
      final startDate = endDate = date.add(Duration(days: count));

      onDateClick(startDate);
    });
  }

  void work(String todo) {}
}