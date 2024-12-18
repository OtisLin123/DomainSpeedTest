import 'package:domain_speed_estimate/domain_speed_estimate/domain_speed_estimate_controller.dart';
import 'package:domain_speed_estimate/domain_speed_estimate/domain_speed_info.dart';
import 'package:domain_speed_estimate/domain_speed_estimate/http_downloader.dart';
import 'package:domain_speed_estimate/domain_speed_estimate/mock_downloader.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DomainSpeedEstimateController controller = DomainSpeedEstimateController(
    downloader: HttpDownloader(), //MockDownloader(),
  );

  void test() async {
    int count = 6;

    for (int i = 0; i < count; i++) {
      double? time = await controller.downloadImg(domain: 'domain$i');
      print('-----------------------------------');
      print('test result domain$i: $time');
      controller.set(data: DomainSpeedInfo(domain: 'domani$i', time: time));
      controller.get().forEach((value) => print(
            'get: ${value.toJson().toString()}',
          ));
      print('fastest: ${controller.getFastest()?.toJson().toString()}');
      print('-----------------------------------\n');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('圓圈看畫面是否卡頓'),
            const CircularProgressIndicator(),
            const Padding(
              padding: EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: Text('Domain 速度列表'),
            ),
            ValueListenableBuilder(
              valueListenable: controller.infos,
              builder: (context, value, child) => Expanded(
                child: value.isNotEmpty
                    ? ListView.builder(
                        itemCount: value.length,
                        itemBuilder: (context, index) => Text(
                          value[index].toJson().toString(),
                        ),
                      )
                    : const Text('empty data'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: test,
        child: const Text('test'),
      ),
    );
  }
}
