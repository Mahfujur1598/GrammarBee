import 'package:flutter/material.dart';

class TerminologyScreen extends StatefulWidget {
  const TerminologyScreen({super.key});

  @override
  State<TerminologyScreen> createState() => _TerminologyScreenState();
}

class _TerminologyScreenState extends State<TerminologyScreen> {
  final List<Map<String, String>> terms = const [
    {"term": "Noun", "meaning": "Name of a person, place, thing, or idea"},
    {"term": "Verb", "meaning": "Action or state"},
    {"term": "Adjective", "meaning": "Describes a noun"},
    {"term": "Adverb", "meaning": "Describes a verb, adjective or another adverb"},
    {"term": "Pronoun", "meaning": "Takes place of a noun"},
    {"term": "Preposition", "meaning": "Shows relationship between noun and other word"},
    {"term": "Conjunction", "meaning": "Joins words or sentences"},
    {"term": "Interjection", "meaning": "Expresses emotion"},
  ];

  List<Map<String, String>> filteredTerms = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredTerms = terms;
    _searchController.addListener(() {
      filterTerms();
    });
  }

  void filterTerms() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredTerms = terms
          .where((term) =>
      term["term"]!.toLowerCase().contains(query) ||
          term["meaning"]!.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terminology", style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xff6A11CB),
      ),
      body: Column(
        children: [
          // Search Field
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search term...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          // List of Terms
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filteredTerms.length,
              itemBuilder: (context, index) {
                final term = filteredTerms[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    title: Text(term["term"]!),
                    subtitle: Text(term["meaning"]!),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
