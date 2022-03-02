import 'package:flutter/material.dart';
import 'package:newsapp/models/valuta_model.dart';
import 'package:newsapp/services/valuta_service.dart';

class ValutaBody {
  static Column valuta() => Column(
        children: [
          Expanded(
            flex: 8,
            child: FutureBuilder(
              future: ValutaService.getData(),
              builder: (context, AsyncSnapshot<List<ValutaModel>> snap) {
                if (!snap.hasData) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (snap.hasError) {
                  return const Center(
                    child: Text("Internet bilan muammo bor"),
                  );
                } else {
                  var data = snap.data;
                  return ListView.builder(
                    itemCount: data!.length,
                    itemBuilder: (_, __) => Card(
                      child: ListTile(
                        leading: Text("${data[__].title.toString()}: 1 >>"),
                        trailing: Text("${data[__].cbPrice.toString()} so'mda"),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      );
}
