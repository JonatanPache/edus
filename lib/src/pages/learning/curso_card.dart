import 'package:cached_network_image/cached_network_image.dart';
import 'package:edus/src/models/curso_model.dart';
import 'package:flutter/material.dart';

class CursoCard extends StatelessWidget {
  const CursoCard({super.key, required this.model});
  final CursoModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Stack(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ColoredBox(
                  color: Theme.of(context).primaryColor.withOpacity(0.2),
                  child: SizedBox(
                    width: 0.5,
                    height: 0.5,
                    child: Image.network(model.img)
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(model.name), Text(model.descripcion)],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
