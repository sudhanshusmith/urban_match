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
        _repositories = repositories;
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
      appBar: AppBar(
        title: Text('GitHub Repositories'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _repositories.length,
              itemBuilder: (context, index) {
                final repository = _repositories[index];
                return ListTile(
                  title: Text(repository['name'] ?? 'Repository Name Missing'),
                  subtitle: FutureBuilder(
                    future:
                        GithubService.getLastCommit(repository['full_name']),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return Text(snapshot.data.toString());
                      }
                    },
                  ),
                );
              },
            ),
    );
  }
}
