import 'package:bloco_de_notas/src/features/notes_page/notes_page.dart';
import 'package:bloco_de_notas/src/shared/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:bloco_de_notas/src/shared/constants/app_colors.dart';

class NewNotePage extends StatefulWidget {
  const NewNotePage({Key? key}) : super(key: key);

  @override
  _NewNotePageState createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotePage> {
  late DropDownItemData _value = DropDownItemData(
    color: AppColors.rosa,
    value: "rosa",
  );

  final List<DropDownItemData> list = [
    DropDownItemData(
      color: AppColors.rosa,
      value: "rosa",
    ),
    DropDownItemData(
      color: AppColors.verde,
      value: "verde",
    ),
    DropDownItemData(
      color: AppColors.roxo,
      value: "roxo",
    ),
    DropDownItemData(
      color: AppColors.ciano,
      value: "ciano",
    ),
    DropDownItemData(
      color: AppColors.amarelo,
      value: "amarelo",
    ),
  ];

  final textController = TextEditingController();

  int charLength = 0;

  bool status = false;

  _onChanged(String value) {
    setState(() {
      charLength = value.length;
    });

    if (charLength > 10) {
      setState(() {
        status = true;
      });
    } else {
      setState(() {
        status = false;
      });
    }
  }

  @override
  void initState() {
    _value = list[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Image.asset("assets/images/app_bar_logo.png"),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Título",
                            hintStyle: TextStyle(
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w700,
                              fontSize: 16.0,
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
                            border: InputBorder.none,
                            errorBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      DropdownButton(
                        underline: Container(),
                        onChanged: (value) {
                          setState(() {
                            _value = value as DropDownItemData;
                          });
                        },
                        value: _value,
                        selectedItemBuilder: (BuildContext context) {
                          return list.map<Widget>((DropDownItemData item) {
                            return Center(
                              child: Container(
                                height: 18.0,
                                width: 18.0,
                                decoration: BoxDecoration(
                                  color: _value.color,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            );
                          }).toList();
                        },
                        focusColor: Colors.transparent,
                        items: list
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Center(
                                  child: Container(
                                    height: 18.0,
                                    width: 18.0,
                                    decoration: BoxDecoration(
                                      color: e.color,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                  TextField(
                    maxLines: 125,
                    minLines: 10,
                    decoration: InputDecoration(
                      hintText: "Digite algo...",
                      hintStyle: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.15,
                        color: Colors.black.withOpacity(0.54),
                      ),
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                    onChanged: _onChanged,
                  ),
                  SizedBox(
                    height: 24.0,
                  )
                ],
              ),
            ),
          ),
          Visibility(
            visible: MediaQuery.of(context).viewInsets.bottom == 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 24.0,
                  right: 24.0,
                  bottom: 24.0,
                ),
                child: SafeArea(
                  bottom: true,
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.date_range,
                            color: Colors.black.withOpacity(0.54),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.attach_file_outlined,
                            color: Colors.black.withOpacity(0.54),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite_border,
                            color: Colors.black.withOpacity(0.54),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.share,
                            color: Colors.black.withOpacity(0.54),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete,
                            color: Colors.black.withOpacity(0.54),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Visibility(
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: status,
              child: Center(
                child: Container(
                    // margin: EdgeInsets.only(top: 20),
                    child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: AppColors.blueGradient,
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
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        shadowColor: Colors.transparent),
                    child: Text(
                      'SALVAR',
                      style: TextStyles.whitew500Roboto,
                    ),
                    onPressed: () => {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => NotesPage(),
                        ),
                      )
                    },
                  ),
                )),
              ))
        ],
      ),
    );
  }
}

class DropDownItemData {
  final Color color;
  final String value;

  DropDownItemData({
    required this.color,
    required this.value,
  });
}
