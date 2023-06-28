import 'package:flutter/material.dart';

import '../models/curso_model.dart';
// Colores
Color buttonColor = const Color.fromRGBO(5, 181, 123, 100);
Color titleColor = const Color.fromRGBO(26, 1, 45, 100);
Color textRefLInk = const Color.fromRGBO(0, 88, 181, 100);


// API
const host = '';

// prueba

List<CursoModel> listaCurso = [
  CursoModel(id: 1, name: 'Biologia', descripcion: 'asdasda asdas dasd',
      categoria: 'Ciencias', duracion: 2, experiencia: 10, img: 'https://ljlgwsbkxwovnagqpjvs.supabase.co/storage/v1/object/public/photos/img/kisspng-computer-icons-biology-science-laboratory-vector-g-5d2f9d960b2cb9.4715284215634016220458.png?t=2023-06-28T03%3A57%3A57.991Z',),
  CursoModel(id: 1, name: 'Quimica', descripcion: 'asdasda asdas dasd',
      categoria: 'Ciencias', duracion: 2, experiencia: 10, img: 'https://ljlgwsbkxwovnagqpjvs.supabase.co/storage/v1/object/public/photos/img/kisspng-symbol-science-atom-chemistry-clip-art-png-free-atom-download-images-5abb014abc5fd1.7376547215222050027716.png?t=2023-06-28T03%3A58%3A12.348Z')
];