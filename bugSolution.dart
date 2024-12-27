```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;

      //Robust handling of empty responses and missing keys
      if (data.isNotEmpty && data[0] is Map && data[0].containsKey('name')) {
        print('First element: ${data[0]['name']}');
      } else {
        print('Data is empty or missing the required key.');
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
```