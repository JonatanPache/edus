import 'package:cached_network_image/cached_network_image.dart';
import 'package:edus/src/models/curso_model.dart';
import 'package:edus/src/pages/cursos/lesson/lesson_page.dart';
import 'package:edus/src/utils/AppIconText.dart';
import 'package:flutter/material.dart';

class CursoCard extends StatelessWidget {
  const CursoCard({super.key, required this.model});
  final CursoModel model;

  void navigateToQuestions({required CursoModel paper}){

  }

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: const Color.fromARGB(255, 254, 254, 255)
      ),
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
              LessonsPage(model)
          ));
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
                          width: MediaQuery.of(context).size.width*0.15,
                          height: MediaQuery.of(context).size.width*0.15,
                          child: CachedNetworkImage(
                            imageUrl: model.imgLogo,
                            placeholder: (context, url) =>Container(
                                alignment: Alignment.center,
                                child: const CircularProgressIndicator()
                            ),
                          )
                      ),
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
                          model.name,
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 15),
                            child: Text(model.descripcionShort)
                        ),
                        Row(
                          children: [
                            AppIconText(
                              icon: const Icon(Icons.edit_document),
                              text: Text(
                                '${model.lessonCount} lecciones',
                                style: const TextStyle(
                                    fontSize: 14
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            AppIconText(
                              icon: const Icon(Icons.timer),
                              text: Text(
                                '${model.duracion} hrs',
                                style: const TextStyle(
                                    fontSize: 14
                                ),
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
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0)
                        ),
                        color: model.free
                            ? Colors.green
                            : Colors.redAccent
                    ),
                    child: model.free
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
