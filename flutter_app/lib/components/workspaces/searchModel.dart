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

  String stringToComparableString(String str) {
    return str.trim().toLowerCase().replaceAll(" ", "").replaceAll(",", "");
  }

  void onQueryChanged(String query) async {
    if (query == _query) return;

    _query = query;
    _isLoading = true;
    notifyListeners();

    if (query.isEmpty) {
      _suggestions = Workspaces;
    } else {
      String comparableQuery = stringToComparableString(query);
      _suggestions = Workspaces.where((workspace) =>
          stringToComparableString(workspace.name).contains(comparableQuery) ||
          stringToComparableString(workspace.adresse)
              .contains(comparableQuery)).toList();
    }

    _isLoading = false;
    notifyListeners();
  }

  void clear() {
    _suggestions = Workspaces;
    notifyListeners();
  }
}
