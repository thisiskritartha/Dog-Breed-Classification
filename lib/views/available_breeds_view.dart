import 'package:dog_breed_classification/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:dog_breed_classification/extension/available_breeds.dart';
import 'package:dog_breed_classification/extension/app_color.dart';

class AvailableBreedsView extends StatefulWidget {
  const AvailableBreedsView({Key? key}) : super(key: key);

  @override
  State<AvailableBreedsView> createState() => _AvailableBreedsViewState();
}

class _AvailableBreedsViewState extends State<AvailableBreedsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: color,
          title: Text(
            'Search Breeds',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 0.4.wp,
            ),
          ),
          leading: const Icon(Icons.arrow_back_ios_new),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              },
              icon: const Icon(
                Icons.search,
                size: 28.0,
              ),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: breeds.length,
          itemBuilder: (context, index) {
            var res = breeds[index];
            return ListTile(
              title: Text(res),
              leading: Text('${index + 1}'),
            );
          },
        ));
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> result = [];
    for (var breed in breeds) {
      if (breed.toLowerCase().contains(query.toLowerCase())) {
        result.add(breed);
      }
    }
    return ListView.builder(
      itemCount: result.length,
      itemBuilder: (context, index) {
        var res = result[index];
        return ListTile(
          title: Text(res),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> result = [];
    for (var breed in breeds) {
      if (breed.toLowerCase().contains(query.toLowerCase())) {
        result.add(breed);
      }
    }
    return ListView.builder(
        itemCount: result.length,
        itemBuilder: (context, index) {
          var res = result[index];
          return ListTile(
            title: Text(res),
          );
        });
  }
}
