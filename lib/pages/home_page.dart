import 'package:flutter/material.dart';
import 'package:wheather_api/model/weather_model.dart';
import 'package:wheather_api/pages/weather_detail.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late final TextEditingController _controller;

  bool _isCityNameEmpty = true;

  @override
  void initState(){
    super.initState();

    _controller = TextEditingController();

    _controller.addListener(
            () { setState(
                    () => _isCityNameEmpty = _controller.text.isEmpty);
    },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search City'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Please enter city name',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20,),
            Padding(padding: const EdgeInsets.all(14),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    label: Text('City Name'),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    border: OutlineInputBorder(),
                  ),
                ),
            ),

            ElevatedButton(
                child: const Text('Search'),
              //if true, returns null. if not, can click
              onPressed: _isCityNameEmpty ? null : () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WeatherDetail(
                          cityName: _controller.text),
                    )
                  );
              },
            ),
          ],
        ),
      ),
    );
  }
}
