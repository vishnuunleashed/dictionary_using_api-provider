import 'package:flutter/material.dart';
import 'package:project/dictionary_notifier.dart';
import 'package:provider/provider.dart';

class DictionViewPage extends StatefulWidget {
  const DictionViewPage({Key key}) : super(key: key);

  @override
  _DictionViewPageState createState() => _DictionViewPageState();
}

class _DictionViewPageState extends State<DictionViewPage> {
  TextEditingController _controller = TextEditingController();
  var temp = "sample";

  @override
  void initState() {
    context.read<DictionaryNotifier>().fetchData(temp);
    DictionaryNotifier();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              temp = _controller.text;
              context.read<DictionaryNotifier>().fetchData(temp);
              DictionaryNotifier();
            },
            icon: Icon(Icons.search),
          )
        ],
        title: TextField(
          controller: _controller,
        ),
      ),
      body: Consumer<DictionaryNotifier>(builder: (context, model, _temp) {
        if (model.dictionaryMain != null) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(child: Text("Word:  " + model.dictionaryMain.word)),
              SizedBox(height: 10),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: model.dictionaryMain.meanings.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text("Part Of Speech: " + model
                              .dictionaryMain.meanings[index].partOfSpeech),
                        ),
                        Container(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: model.dictionaryMain.meanings.length,
                            itemBuilder: (context, indexMeaning) {
                              return Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    child: Text("Defintion :" + model
                                        .dictionaryMain
                                        .meanings[index]
                                        .definitions[indexMeaning]
                                        .definition),
                                  ),
                                  Container(
                                    child: Text("Example :" + model
                                        .dictionaryMain
                                        .meanings[index]
                                        .definitions[indexMeaning]
                                        .example,
                                        ),
                                  ),
                                  Container(
                                    child: Text("Synonyms :" + model
                                        .dictionaryMain
                                        .meanings[index].definitions[indexMeaning].synonyms.toString()
                                        ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  }),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: model.dictionaryMain.phonetics.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            child: Text(
                                model.dictionaryMain.phonetics[index].text)),
                      ],
                    );
                  })
            ],
          );
        } else {
          return Container(child: Text("Search"));
        }
      }),
    );
  }
}
