import 'dart:async';
import 'package:edus/src/models/examen_model.dart';
import 'package:edus/src/pages/learning/answer_card.dart';
import 'package:edus/src/provider/resources_repository.dart';
import 'package:edus/src/utils/ContentArea.dart';
import 'package:edus/src/utils/CustomAppBar.dart';
import 'package:edus/src/utils/background_decoration.dart';
import 'package:edus/src/utils/countdown_timer.dart';
import 'package:edus/src/utils/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Timer? _timer;
int selectedAnswer=-1;
int remainSeconds = 1;
String time = '00.00';
int i=0;
List<String> misRespuestas = [];
int correctos =0;
class QuestionScreen extends ConsumerStatefulWidget {
  final ExamenModel examen;
  const QuestionScreen({super.key, required this.examen});

  @override
  ConsumerState<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends ConsumerState<QuestionScreen> {
  _startTimer(int seconds){
    const duration = Duration(seconds: 1);
    remainSeconds = seconds;
    Timer.periodic(duration, (Timer timer) {
      if( remainSeconds==0){
        timer.cancel();
      }else{
        int minutes = remainSeconds~/60;
        int seconds = remainSeconds%60;
        time = "${minutes.toString().padLeft(2,"0")}:${seconds.toString().padLeft(2,"0")}";
        remainSeconds--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _startTimer(widget.examen.preguntas.first.duration);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        leading: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: const ShapeDecoration(
            shape: StadiumBorder(
              side: BorderSide(
                  color: Colors.white,
                  width: 2
              ),
            ),
          ),
          child: CountdownTimer(time: time,),
        ),
        showActionIcon: true,
        titleWidget: const Text('Preguntas'),
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
                        widget.examen.preguntas[i].pregunta,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(top: 25),
                          itemBuilder: (BuildContext context, int index) {
                            return AnswerCard(
                              answer: widget.examen.preguntas[i].respuestas[index],
                              onTap: () {
                                selectedAnswer=index;
                                (context as Element).markNeedsBuild();
                              },
                              isSelected: index==selectedAnswer,
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                            height: 10,
                          ),
                          itemCount: widget.examen.preguntas[i].respuestas.length),
                      Container(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                            onPressed: (){
                              // showModalBottomSheet(
                              //     context: context,
                              //     builder: (context){
                              //       return ChatPage();
                              //     });
                            },
                            child: const Icon(Icons.question_mark)
                        ),
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
                            onTap: (){},
                            child: const Icon(Icons.arrow_back),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Visibility(
                        visible: true,
                        child: MainButton(
                          onTap: (){
                            correctos = selectedAnswer == widget.examen.preguntas[i].respuestaCorrecta
                                ? correctos+1 :correctos;
                            // save response
                            ref.read(resourcesRepositoryProvider).saveResponse(
                                widget.examen.preguntas[i].id, selectedAnswer == widget.examen.preguntas[i].respuestaCorrecta);
                            if(i==widget.examen.preguntas.length-1){
                              misRespuestas.add(selectedAnswer.toString());
                              // save examen
                              ref.read(resourcesRepositoryProvider)
                                  .setExamen(widget.examen.id, correctos,
                                  widget.examen.preguntas.length);
                              // update levelOfLearning
                              Navigator.of(context).pop();
                            }else{
                              // simplemente cambia de panel de preguntas
                              misRespuestas.add(selectedAnswer.toString());
                              i++;
                              selectedAnswer=-1;
                              (context as Element).markNeedsBuild();
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
