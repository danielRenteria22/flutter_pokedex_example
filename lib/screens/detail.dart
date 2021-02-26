import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_pokedex_example/api/pokemon_api.dart';
import 'package:flutter_pokedex_example/models/pokemon_detail.dart';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String,Object> data = ModalRoute.of(context).settings.arguments;
    final name = data['name'];
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: DetailWidget(name: name),
      ),
    );
  }
}

class DetailWidget extends StatefulWidget {
  final String name;

  DetailWidget({this.name});

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  Future<PokemonDetail> detailFuture;

  @override
  void initState() {
    super.initState();
    detailFuture = PokemonApi.getDetail(widget.name);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: detailFuture,
        builder: (context,snapshot){
          if(snapshot.hasData){
            return detailSection(snapshot.data);
          } else if(snapshot.hasError){
            return Text(snapshot.error);
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }

  Widget detailSection(PokemonDetail detail) {
    return Column(
      children: [
        Image.network(detail.sprites.front_default),
        Text(detail.name),
        Row(children: typeList(detail),)
      ],
    );
  }

  List<Widget> typeList(PokemonDetail detail) {
    final list = <Widget>[];
    detail.types.forEach((type) {
      final text = Text('${type.type.name} -');
      list.add(text);
    });

    return list;
  }
}
