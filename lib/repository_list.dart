// repository_list.dart
import 'package:flutter/material.dart';
import 'github_service.dart';

class RepositoryList extends StatefulWidget {
  @override
  _RepositoryListState createState() => _RepositoryListState();
}

class _RepositoryListState extends State<RepositoryList> {
  List<dynamic> _repositories = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadRepositories();
  }

  Future<void> _loadRepositories() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final repositories = await GithubService.getRepositories();
      setState(() {
        _repositories = repositories.sublist(
            0, repositories.length > 22 ? 20 : repositories.length - 1);
        _isLoading = false;
      });
    } catch (e) {
      // Handle error
      print(e.toString());
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _repositories.length,
              itemBuilder: (context, index) {
                final repository = _repositories[index];
                return ListTile(
                  title: Text(repository['name'] ?? 'Repository Name Missing',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color.fromARGB(
                            255, 87, 111, 248), // Set text color to black
                      )),
                  subtitle: FutureBuilder(
                    future:
                        GithubService.getLastCommit(repository['full_name']),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Last commit details:'),
                            RichText(
                              text: TextSpan(
                                text: 'Message: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Colors.black, // Set text color to black
                                ),
                                children: [
                                  TextSpan(
                                    text: snapshot.data['message'].toString() ??
                                        'No commits found',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors
                                            .black), // Set text color to black
                                  ),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Author: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: snapshot.data['author']['name'] ??
                                        'No commits found',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Email: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: snapshot.data['author']['email'] ??
                                        'No commits found',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Date: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: snapshot.data['author']['date'] ??
                                        'No commits found',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                );
              },
            ),
    );
  }
}
