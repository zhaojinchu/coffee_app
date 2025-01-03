import 'package:flutter/material.dart';
import 'package:coffee_app/db/db.dart';

class EntriesList extends StatefulWidget {
  const EntriesList({super.key});

  @override
  _EntriesListState createState() => _EntriesListState();
}

class _EntriesListState extends State<EntriesList> {
  late Future<List<CoffeeInfoData>> _entriesFuture;

  @override
  void initState() {
    super.initState();
    _entriesFuture = _fetchSortedEntriesByName();
  }

  Future<List<CoffeeInfoData>> _fetchSortedEntriesByName() async {
    return await Db().getSortedEntriesByName();
  }



  Future<List<CoffeeInfoData>> _fetchSortedEntriesByRating() async {
    return await Db().getSortedEntriesByRating();
  }

  // Widget implementation
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CoffeeInfoData>>(
      future: _entriesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No entries found.'));
        }

        final entries = snapshot.data!;
        return ListView.builder(
          itemCount: entries.length,
          itemBuilder: (context, index) {
            final entry = entries[index];
            return ListTile(
              title: Text(entry.name),
              subtitle: Text(
                'Rating: ${entry.rating}\nTasting Notes: ${entry.tastingNotes}',
              ),
            );
          },
        );
      },
    );
  }
}
