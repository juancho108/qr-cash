import 'package:flutter/material.dart';
import 'package:cashback/src/bloc/scans_bloc.dart';
import 'package:cashback/src/models/scan_model.dart';
import 'package:cashback/src/utils/utils.dart' as utils;


class DireccionesPage extends StatelessWidget {

  final scansBloc = new ScansBloc();

  @override
  Widget build(BuildContext context) {

    scansBloc.obtenerScans(); //obtengo los scans al hacer tap

    return StreamBuilder<List<ScanModel>>(
      stream: scansBloc.scansStreamHttp,
      builder: (BuildContext context, AsyncSnapshot<List<ScanModel>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        final scans = snapshot.data;

        if (scans.length == 0) {
          return Center(
            child: Text('No hay información'),
          );
        } else {
          return ListView.builder(
            itemCount: scans.length,
            itemBuilder: (context, i) => 
            Dismissible(
              key: UniqueKey(),
              background: Container(color: Colors.red),
              onDismissed: (diretion)=> scansBloc.borrarScan(scans[i].id) ,
              child: ListTile(
                  leading: Icon(
                    Icons.cloud_queue,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(scans[i].valor),
                  subtitle: Text('tipo: ${scans[i].tipo}'),
                  trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey),
                  onTap: () => utils.abrirScan(context, scans[i]),
                ),
            ),
          );
        }
      },
    );
  }
}
