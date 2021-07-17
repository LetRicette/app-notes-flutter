import 'package:bloco_de_notas/models/note_model.dart';
import 'package:bloco_de_notas/src/shared/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class NotesList extends StatelessWidget {
  final List<Note> notes;

  NotesList(this.notes);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.90,
      height: MediaQuery.of(context).size.height * 0.80,
      child: RawScrollbar(
        isAlwaysShown: true,
        thumbColor: Colors.blueGrey.shade100,
        radius: Radius.circular(20),
        thickness: 9,
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          itemCount: notes.length,
          itemBuilder: (BuildContext context, int index) => Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 38),
                child: Container(
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey.shade50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45.withOpacity(0.3),
                        spreadRadius: 0.5,
                        blurRadius: 10,
                        offset: Offset(0, 5), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          "Título muito tituloso",
                          style: TextStyles.white16w700Roboto,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            onPressed: () {},
                            icon: Icon(
                              Icons.date_range,
                              color: Colors.black.withOpacity(0.54),
                              size: 16,
                            ),
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            onPressed: () {},
                            icon: Icon(
                              Icons.attach_file_outlined,
                              color: Colors.black.withOpacity(0.54),
                              size: 16,
                            ),
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.black.withOpacity(0.54),
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 8.0, right: 8, top: 4),
                        child: Container(
                          child: Text(
                            "Lorem ipsum dolor sit amet, consecter adipiscing elit, sed incididunt ut labore et dolore aliqua.",
                            style: TextStyles.w400Roboto,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 10, left: 8),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Criação: 05/07/21",
                            style: TextStyles.w300Roboto,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 160,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45.withOpacity(0.3),
                      spreadRadius: 0.5,
                      blurRadius: 5,
                      offset: Offset(0, 5), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8, left: 8, right: 8, bottom: 6),
                  child: Text(
                    "Título muito tituloso",
                    style: TextStyles.white16w700Roboto,
                  ),
                ),
              ),
            ],
          ),
          staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
          mainAxisSpacing: 16,
        ),
      ),
    );
  }
}
