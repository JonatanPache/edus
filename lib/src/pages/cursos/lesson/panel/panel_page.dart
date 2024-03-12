import 'dart:async';
import 'package:edus/src/models/error_model.dart';
import 'package:edus/src/models/examen_model.dart';
import 'package:edus/src/models/panel_model.dart';
import 'package:edus/src/pages/learning/question_screen.dart';
import 'package:edus/src/provider/resources_repository.dart';
import 'package:edus/src/utils/ContentArea.dart';
import 'package:edus/src/utils/CustomAppBar.dart';
import 'package:edus/src/utils/background_decoration.dart';
import 'package:edus/src/utils/countdown_timer.dart';
import 'package:edus/src/utils/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Timer? _timer;
int selectedAnswer = -1;
int remainSeconds = 1;
String time = '00.00';

class PanelPage extends ConsumerStatefulWidget {
  final PanelModel panel;
  const PanelPage({super.key, required this.panel});

  @override
  ConsumerState<PanelPage> createState() => _PanelPageState();
}

class _PanelPageState extends ConsumerState<PanelPage> {
  _startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainSeconds = seconds;
    Timer.periodic(duration, (Timer timer) {
      if (remainSeconds == 0) {
        timer.cancel();
      } else {
        int minutes = remainSeconds ~/ 60;
        int seconds = remainSeconds % 60;
        time =
            "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
        remainSeconds--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _startTimer(900);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        leading: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: const ShapeDecoration(
            shape: StadiumBorder(
              side: BorderSide(color: Colors.white, width: 2),
            ),
          ),
          child: CountdownTimer(
            time: time,
          ),
        ),
        showActionIcon: true,
        titleWidget: Text('Panel ${widget.panel.orden}'),
      ),
      body: BackgroundDecoration(
        child: Column(
          children: [
            //QuestionScreenHolder()
            Expanded(
              child: ContentArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 35),
                  child: Column(
                    children: [
                      Text(
                        widget.panel.titulo,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.panel.contenido,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Container(
                          padding: const EdgeInsets.all(5),
                          alignment: Alignment.center,
                          child: Image.network(
                            widget.panel.img.first ?? '',
                            width: 350,
                            height: 380,
                          )),
                      Container(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                            onPressed: () {
                              // showModalBottomSheet(
                              //     context: context,
                              //     builder: (context) {
                              //       return ChatPage(chatApi: ChatApi());
                              //     });
                            },
                            child: const Icon(Icons.question_mark)),
                      )
                    ],
                  ),
                ),
              ),
            ),
            ColoredBox(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Visibility(
                      visible: true,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: SizedBox(
                          width: 55,
                          height: 55,
                          child: MainButton(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const Icon(Icons.arrow_back),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Visibility(
                        visible: true,
                        child: MainButton(
                          onTap: () async {
                            ErrorModel nextPanel = await ref
                                .read(resourcesRepositoryProvider)
                                .getNextPanel(widget.panel.id);
                            if (nextPanel.data != null) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BackgroundDecoration(
                                    child: PanelPage(
                                        panel:
                                            PanelModel.fromMap(nextPanel.data)),
                                  ),
                                ),
                              );
                            } else {
                              ExamenModel question = await ref
                                  .read(resourcesRepositoryProvider)
                                  .getExamen(widget.panel.leccionId);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BackgroundDecoration(
                                    child: QuestionScreen(examen: question),
                                  ),
                                ),
                              );
                            }
                          },
                          title: 'Siguiente',
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
