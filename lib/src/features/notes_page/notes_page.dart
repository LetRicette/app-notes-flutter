import 'package:bloco_de_notas/components/notes.list.dart';
import 'package:bloco_de_notas/models/note_model.dart';
import 'package:bloco_de_notas/src/features/new_note/new_note.dart';
import 'package:bloco_de_notas/src/shared/constants/app_colors.dart';

import 'package:flutter/material.dart';

class NotesPage extends StatefulWidget {
  NotesPage({Key? key}) : super(key: key);

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final _notes = [
    Note(
      id: 'n1',
      title: 'Não esquecer',
      text:
          'Lorem ipsum dolor sit amet, consecter adipiscing elit, sed incididunt ut labore et dolore aliqua.',
      date: "08/07/21",
      favorite: true,
      attachment: true,
      deadline: "08/02/21",
      color: 'rosa',
    ),
    Note(
      id: 'n2',
      title: 'Reunião com os stakeholders',
      text:
          'Ipsum dolor sit amet, consectur. Adipiscing elit, sed do eiusmod tempor incidi. Ut labore et dolore magna aliqua.',
      date: "07/07/21",
      favorite: false,
      attachment: true,
      deadline: "08/02/21",
      color: 'verde',
    ),
    Note(
      id: 'n3',
      title: 'Lembretes para o médico',
      text:
          'Lorem ipsum dolor sit amet, consecter adipiscing elit, sed incididunt ut labore et dolore aliqua.',
      date: "06/07/21",
      favorite: true,
      attachment: true,
      deadline: "08/02/21",
      color: 'roxo',
    ),
    Note(
      id: 'n4',
      title: 'Ideias para o novo app 2022',
      text:
          'Ipsum dolor sit amet, consectur. Adipiscing elit, sed do eiusmod tempor incidi. Ut labore et dolore magna aliqua.',
      date: "06/07/21",
      favorite: false,
      attachment: false,
      deadline: "08/02/21",
      color: 'ciano',
    ),
    Note(
      id: 'n5',
      title: 'Reunião do grupo de treinamento',
      text:
          'Lorem ipsum dolor sit amet, consecter adipiscing elit, sed incididunt ut labore et dolore aliqua.',
      date: "04/07/21",
      favorite: true,
      attachment: false,
      deadline: "08/02/21",
      color: 'pink',
    ),
    Note(
      id: 'n6',
      title: 'Estudar!!',
      text:
          'Lorem ipsum dolor sit amet, consecter adipiscing elit, sed incididunt ut labore et dolore aliqua.',
      date: "02/07/21",
      favorite: true,
      attachment: true,
      deadline: "08/02/21",
      color: 'pink',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Image.asset(
          "assets/images/appbar_logo_white.png",
        ),
        toolbarHeight: 65,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[AppColors.ciano, AppColors.roxo])),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15),
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search, size: 26),
                hintText: "Pesquisar",
                hintStyle: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w400,
                  fontSize: 18.0,
                  letterSpacing: 0.15,
                  color: Colors.black.withOpacity(0.54),
                ),
                labelStyle: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w700,
                  fontSize: 16.0,
                  letterSpacing: 0.15,
                  color: Colors.black.withOpacity(0.54),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80, left: 16),
            child: NotesList(_notes),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => NewNotePage(),
            ),
          );
        },
        child: Container(
          width: 56.0,
          height: 56.0,
          decoration: BoxDecoration(
            gradient: AppColors.blueGradient,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                offset: Offset(0.0, 1.0),
                blurRadius: 18.0,
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.14),
                offset: Offset(0.0, 6.0),
                blurRadius: 10.0,
              ),
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(0.0, 3),
                  blurRadius: 5.0,
                  spreadRadius: -1.0),
            ],
          ),
          child: Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
