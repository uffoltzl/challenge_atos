import 'package:flutter_app/data/workspaces.dart';
import 'package:flutter_app/models/workspace.dart';
import 'package:flutter/material.dart';

class SearchModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Workspace> _suggestions = Workspaces;
  List<Workspace> get suggestions => _suggestions;

  String _query = '';
  String get query => _query;
  void setQuery(String query) {
    _query = query;
  }

  void onQueryChanged(String query) async {
    if (query == _query) return;

    _query = query;
    _isLoading = true;
    notifyListeners();

    if (query.isEmpty) {
      _suggestions = Workspaces;
    } else {
      List<String> queries = query.split(" ");
      _suggestions = Workspaces.where((workspace) =>
          queries
              .where((query) =>
                  workspace.name.contains(query) ||
                  workspace.adresse.contains(query))
              .length >
          0).toList();
    }

    _isLoading = false;
    notifyListeners();
  }

  void clear() {
    _suggestions = Workspaces;
    notifyListeners();
  }
}
