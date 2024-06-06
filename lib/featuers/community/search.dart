
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // بناء نتائج البحث النهائية
    return Center(
      child: Text('نتائج البحث: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // بناء الاقتراحات أثناء الكتابة
    final List<String> suggestions = ['home', 'bread and butter', ' bread', ' butterhood']; // يمكن استبدالها بقائمة من الاقتراحات الفعلية
    final List<String> filteredSuggestions = query.isEmpty ? suggestions : suggestions.where((suggestion) => suggestion.contains(query)).toList();

    return ListView.builder(
      itemCount: filteredSuggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredSuggestions[index]),
          onTap: () {
            // اتخاذ إجراء عند النقر على الاقتراح
            close(context, filteredSuggestions[index]);
          },
        );
      },
    );
  }
}

// import 'package:get/get.dart';

class SearchController extends GetxController {
  var isSearching = false.obs;
  var searchText = ''.obs;

  void toggleSearch() {
    isSearching.value = !isSearching.value;
  }

  void updateSearchText(String text) {
    searchText.value = text;
  }
}
