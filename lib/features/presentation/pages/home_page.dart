import 'package:clean_architecture_nasa/features/presentation/pages/picture_page.dart';
import 'package:clean_architecture_nasa/features/presentation/stores/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  HomeStore store = GetIt.I<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Imagens da NASA')),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Observer(
            builder: ((context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TableCalendar(
                    focusedDay: store.date,
                    calendarStyle: const CalendarStyle(
                      selectedDecoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.lightGreen),
                    ),
                    locale: 'pt_BR',
                    firstDay: DateTime(1990),
                    lastDay: DateTime.now(),
                    selectedDayPredicate: (day) {
                      return isSameDay(store.date, day);
                    },
                    headerStyle: const HeaderStyle(formatButtonVisible: false),
                    onDaySelected: (selectedDay, focusedDay) {
                      store.date = selectedDay;
                    },
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 72,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16), // <-- Radius
                        ),
                      ),
                      onPressed: () async {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => PicturePage(
                                  date: store.date,
                                )),
                          ),
                        );
                      },
                      child: const Text(
                        'Ver Imagem',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  )
                ],
              );
            }),
          )),
    );
  }
}
