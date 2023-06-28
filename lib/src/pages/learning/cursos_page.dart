import 'package:edus/src/models/curso_model.dart';
import 'package:edus/src/pages/learning/curso_card.dart';
import 'package:edus/src/utils/constantes.dart';
import 'package:flutter/material.dart';

class CursosPage extends StatefulWidget {
  const CursosPage({super.key});

  @override
  State<CursosPage> createState() => _CursosPageState();
}

class _CursosPageState extends State<CursosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 20);
        },
        itemCount: listaCurso.length,
        itemBuilder: (BuildContext context, int index) {
          return CursoCard(model: listaCurso[index]);
        },
      ),
    );
  }
}
