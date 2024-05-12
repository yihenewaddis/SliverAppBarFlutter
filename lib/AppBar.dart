import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class AppBarTest extends StatefulWidget {
  AppBarTest({super.key});
  @override
  State<AppBarTest> createState() => _AppBarTestState();
}

class _AppBarTestState extends State<AppBarTest> {
  bool IsVisible = false;
  final _scrollControler = ScrollController();
  @override
  void initState() {
    _scrollControler.addListener((){
      if(_scrollControler.position.pixels > 320){
        setState(() {
          IsVisible = true;
        });
      }else{
        setState(() {
          IsVisible = false;
        });
      }
    }
    );
    super.initState();
  }
    @override
  void dispose() {
    _scrollControler.dispose();
    super.dispose();
  }

    var url = 'https://images.unsplash.com/photo-1483232539664-d89822fb5d3e?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGhvdG8lMjBiYWNrZ3JvdW5kfGVufDB8fDB8fHww';
    int number = 1;
    void changeUrl(urls){
      setState(() {
      url = urls;
      number = number+1;
      });
    }
  @override
  Widget build(BuildContext context) {
  
    return  MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          controller: _scrollControler,
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: true,
              backgroundColor: Colors.black,
              expandedHeight: 500.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('$number'),
                background: Column(
                  children: [
                  Image.network(url,
                fit: BoxFit.cover,
                height: 300,
                width: double.infinity,
                ),
                Row(
                  children: [
                    GestureDetector(
                    child: TextButton(
                      child: Text('second image'),
                      onPressed: ()=>{
                        changeUrl('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSn6wISSLKMekSlKPj27OftnOZP-NWbRiGBkORXd1TgIA&s')
                      },),
                    ),
                    GestureDetector(
                    child: TextButton(
                      child: Text('second image'),
                      onPressed: ()=>{
                        changeUrl('https://images.unsplash.com/photo-1483232539664-d89822fb5d3e?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGhvdG8lMjBiYWNrZ3JvdW5kfGVufDB8fDB8fHww')
                      },),
                    ),
                  ],
                )
                
                ],)
                
              ),
            ),
            
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Visibility(
                    visible: IsVisible,
                    child:const Text("Visible",style: TextStyle(
                    color: Colors.red
                  ),)),
           
                
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                  Text('this is yihenew'),
                
           

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}