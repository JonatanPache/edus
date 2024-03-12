import 'package:cached_network_image/cached_network_image.dart';
import 'package:edus/src/models/panel_model.dart';
import 'package:edus/src/pages/cursos/lesson/panel/panel_page.dart';
import 'package:edus/src/provider/resources_repository.dart';
import 'package:edus/src/utils/AppIconText.dart';
import 'package:edus/src/utils/background_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/lesson_model.dart';

class LessonCard extends ConsumerStatefulWidget {
  const LessonCard({super.key, required this.model});
  final LeccionModel model;

  @override
  ConsumerState<LessonCard> createState() => _LessonCardState();
}

class _LessonCardState extends ConsumerState<LessonCard> {
  late PanelModel panelActual;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: const Color.fromARGB(255, 254, 254, 255)),
      child: InkWell(
        onTap: () async {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FutureBuilder(
                future: ref
                    .read(resourcesRepositoryProvider)
                    .getPanel(widget.model.progreso.panelActual),
                builder:
                    (BuildContext context, AsyncSnapshot<PanelModel> snapshot) {
                  if(snapshot.hasData){
                    return BackgroundDecoration(
                      child: PanelPage(
                        panel: snapshot.data!,
                      ),
                    );
                  }else{
                    return Container();
                  }
                },
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ColoredBox(
                      color: Theme.of(context).primaryColor.withOpacity(0.2),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.width * 0.15,
                          child: CachedNetworkImage(
                            imageUrl: widget.model.img,
                            placeholder: (context, url) => Container(
                                alignment: Alignment.center,
                                child: const CircularProgressIndicator()),
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.model.titulo,
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 15),
                            child: Text(widget.model.descripcion)),
                        Row(
                          children: [
                            AppIconText(
                              icon: Icon(widget.model.dificultad == 'Facil'
                                  ? Icons.sentiment_satisfied_alt
                                  : Icons.sentiment_dissatisfied_outlined),
                              text: Text(
                                widget.model.dificultad,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                            const SizedBox(width: 15),
                            AppIconText(
                              icon: const Icon(Icons.timer_sharp),
                              text: Text(
                                '${widget.model.duracion} hrs',
                                style: const TextStyle(fontSize: 14),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: -10.0,
                right: -10.0,
                child: GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0)),
                        color: Colors.redAccent),
                    child: widget.model.id != ''
                        ? const Icon(Icons.lock_open_rounded)
                        : const Icon(Icons.lock),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
