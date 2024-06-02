import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _items = [];
  bool _isLoading = false;
  final _scrollController = ScrollController();
  final _itemsPerPage = 50;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _loadMoreItems();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 100 &&
        !_isLoading) {
      _loadMoreItems();
    }
  }

  Future<void> _loadMoreItems() async {
    setState(() {
      _isLoading = true;
    });
    final newItems = await getVenues(_currentPage * _itemsPerPage, _itemsPerPage);
    setState(() {
      _items.addAll(newItems);
      _currentPage++;
      _isLoading = false;
    });
  }

  Future<List<String>> getVenues(int start, int count) async {
    List<String> items = [];
    await Future.delayed(const Duration(seconds: 2)); // simulating an async operation
    for (int i = start; i < start + count && i < 1000; i++) {
      items.add(faker.lorem.words(2).join(' '));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Venues'),
      ),
      body: ListView.separated(
        controller: _scrollController,
        itemCount: _items.length + (_isLoading ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == _items.length) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListTile(
              title: Text(_items[index]),
            );
          }
        },
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }
}