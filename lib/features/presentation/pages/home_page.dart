import 'package:clean_architecture_nasa/features/presentation/pages/picture_page.dart';
import 'package:clean_architecture_nasa/features/presentation/stores/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  HomeStore homeStore = GetIt.I.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NASA Images')),
      body: Observer(builder: (_) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    '${homeStore.date.day}/${homeStore.date.month}/${homeStore.date.year}'),
                const SizedBox(
                  width: 16,
                ),
                ElevatedButton(
                  onPressed: () async {
                    DateTime? dateEscolhida = await showDatePicker(
                        context: context,
                        initialDate: homeStore.date,
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now());

                    homeStore.setDate(dateEscolhida!);
                  },
                  child: const Text('Selecionar Data'),
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
                onPressed: () async {
                  await homeStore.getSpaceMediaFromDate(homeStore.date);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => PicturePage(
                            mediaUrl: homeStore.spaceMediaEntity!.mediaUrl,
                            data: homeStore.date,
                          )),
                    ),
                  );
                },
                child: const Text('Pesquisar')),
          ],
        );
      }),
    );
  }
}
