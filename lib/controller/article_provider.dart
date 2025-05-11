import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/article_model.dart';
import 'package:http/http.dart' as http;


class ArticleProvider with ChangeNotifier {
  List<Article> _articles = [];
  List<Article> _filteredArticles = [];
  List<int> _favoriteIds = [];
  bool _isLoading = false;
  String? _error;

  List<Article> get articles => _filteredArticles;
  bool get isLoading => _isLoading;
  String? get error => _error;
  List<Article> get favorites => _articles.where((article) => _favoriteIds.contains(article.id)).toList();

  ArticleProvider() {
    loadFavorites();
    fetchArticles();
  }

  Future<void> fetchArticles() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        _articles = data.map((json) => Article.fromJson(json)).toList();
        _filteredArticles = _articles;
      } else {
        _error = 'Failed to load articles';
      }
    } catch (e) {
      _error = 'Error: $e';
    }

    _isLoading = false;
    notifyListeners();
  }

  void searchArticles(String query) {
    if (query.isEmpty) {
      _filteredArticles = _articles;
    } else {
      _filteredArticles = _articles.where((article) {
        return article.title.toLowerCase().contains(query.toLowerCase()) ||
            article.body.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    _favoriteIds = prefs.getStringList('favorites')?.map((id) => int.parse(id)).toList() ?? [];
    notifyListeners();
  }

  Future<void> toggleFavorite(int articleId) async {
    if (_favoriteIds.contains(articleId)) {
      _favoriteIds.remove(articleId);
    } else {
      _favoriteIds.add(articleId);
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favorites', _favoriteIds.map((id) => id.toString()).toList());
    notifyListeners();
  }

  bool isFavorite(int articleId) => _favoriteIds.contains(articleId);
}
