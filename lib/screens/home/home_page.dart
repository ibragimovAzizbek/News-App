import 'package:flutter/material.dart';
import 'package:newsapp/core/components/body/for_you_body.dart';
import 'package:newsapp/core/components/body/valuta_body.dart';
import 'package:newsapp/core/constants/color_const.dart';
import 'package:newsapp/core/constants/font_const.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  final List<String> _top = ['For you', 'Valuta', 'Top', 'World', 'Politics'];
  List<Column> body = [ForYouBody.forYou(), ValutaBody.valuta()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _top.length,
              itemBuilder: (_, __) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ActionChip(
                  backgroundColor:
                      index == __ ? ColorConst.kBlack : ColorConst.kGrey,
                  label: Text(
                    _top[__],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color:
                          index == __ ? ColorConst.kWhite : ColorConst.kBlack,
                      fontSize: FontConst.kExtraSmall,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      index = __;
                    });
                  },
                ),
              ),
            ),
          ),
          Expanded(flex: 8, child: body[index])
        ],
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      toolbarHeight: MediaQuery.of(context).size.height * 0.1,
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.now_widgets_rounded,
            color: Colors.black,
          ),
          SizedBox(width: 12),
          Text(
            "News 24",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
