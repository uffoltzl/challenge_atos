import 'package:flutter/material.dart';
import 'package:flutter_app/models/workspace.dart';

class WorkspacePage extends StatelessWidget {
  final Workspace workspace;
  const WorkspacePage({Key key, this.workspace}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(workspace.name),
      ),
      body: Column(
        children: [
          Container(
            height: 160.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: workspace.images
                  .map((image) => Container(
                        width: 300.0,
                        child: Image.network(
                          image,
                          fit: BoxFit.fill,
                        ),
                      ))
                  .toList(),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      workspace.name,
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(workspace.adresse),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
