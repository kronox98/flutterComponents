import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  ScrollController _scrollController = new ScrollController();
  List<int> _listNumbers = [];
  int _index = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    addTen();

    _scrollController.addListener(() {
      // _isLoading = false;
      if ( _scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        // addTen();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView')
      ),
      body: Stack(
       children: [
         _createList(),
         _createLoading()
       ],
      )
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: getPageOne,
      backgroundColor: Colors.indigo,
      color: Colors.white,
      child: ListView.builder(
          itemCount: _listNumbers.length,
          controller: _scrollController,
          itemBuilder: (BuildContext context, int index) {
            final imagen = _listNumbers[ index ];
            return FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image: NetworkImage('https://picsum.photos/500/300/?imagen=$imagen'),
              fit: BoxFit.cover,
              height: 300,
            );
          }
        ),
      );
  }

  Future getPageOne() async {
    final duration = new Duration( seconds: 3);
    new Timer(duration, () {
      _listNumbers.clear();
      _index++;
      addTen();
    });

    return Future.delayed(duration);
  }

  void addTen() {
    for (var i = 1; i < 10; i++) {
      _index++;
      _listNumbers.add(_index);
    }
    setState(() {});
  }

  Future fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = new Duration( seconds: 2 );
    return new Timer(duration, responseHTTP);
  }

  void responseHTTP() {
    _isLoading = false;
    addTen();
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      duration: Duration( milliseconds: 500), 
      curve: Curves.fastOutSlowIn,
      
    );
  }

  Widget _createLoading() {
    if ( _isLoading ) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
          SizedBox( height: 15.0)
        ]
      );
    } else {
      return Container();
    }
  }
}