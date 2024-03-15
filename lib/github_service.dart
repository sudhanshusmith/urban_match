// github_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class GithubService {
  static const String baseUrl = 'https://api.github.com';
  static const userHeader = {"authorization": "token <your_token>"};

  static Future<List<dynamic>> getRepositories() async {
    final response = await http.get(
        Uri.parse('$baseUrl/users/freeCodeCamp/repos'),
        headers: userHeader);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load repositories: ${response.statusCode}');
    }
  }

  static Future<dynamic> getLastCommit(String full_name) async {
    final response = await http.get(
        Uri.parse('$baseUrl/repos/$full_name/commits'),
        headers: userHeader);
    if (response.statusCode == 200) {
      final List<dynamic> commits = json.decode(response.body);
      if (commits.isNotEmpty) {
        return commits[0]['commit'];
      } else {
        return 'No commits found';
      }
    } else {
      throw Exception(
          'Failed to load last commit for $full_name: ${response.statusCode}');
    }
  }
}
