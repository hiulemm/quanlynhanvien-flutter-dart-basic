import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Quan ly nhan vien'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class NhanVien{
  late String maNhanVien, tenNhanVien, sdtNhanVien;

  NhanVien(this.maNhanVien, this.tenNhanVien, this.sdtNhanVien);

}
class BoxNhanVien extends StatelessWidget{
  final NhanVien nhanVien;

  BoxNhanVien( {  super.key, required this.nhanVien});

  @override
  Widget build(BuildContext context){
    return Padding(padding: EdgeInsets.all(8.0),
    child: Container(
      padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Column(
        children: [
          Row(
            children: [Text("Ma : "), Text((nhanVien.maNhanVien))],
          ),
          Row(
            children: [Text("Ten : "), Text((nhanVien.tenNhanVien))],
          ),
          Row(
            children: [Text("Sdt : "), Text((nhanVien.sdtNhanVien))],
          )
        ],
      ),
    ),);
  }
}
class _MyHomePageState extends State<MyHomePage> {
  TextEditingController maConroller = new TextEditingController();
  TextEditingController tenConroller = new TextEditingController();
  TextEditingController sdtConroller = new TextEditingController();
  List<NhanVien> listNhanVien = <NhanVien>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: maConroller,
              decoration: const InputDecoration(
                labelText: "Ma: ",
                labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: tenConroller,
              decoration: const InputDecoration(
                  labelText: "Ten: ",
                  labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: sdtConroller,
              decoration: const InputDecoration(
                  labelText: "SDT: ",
                  labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)
              ),
            ),
          ),
          Center(
            child: MaterialButton(
              color: Colors.redAccent,
              onPressed: (){
                setState(() {
                  NhanVien nv = new NhanVien(maConroller.text , tenConroller.text, sdtConroller.text);
                  listNhanVien.add(nv);

                });
              },
              child: Text(
                "Luu" , style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          Expanded(child: SizedBox(
            child: listNhanVien.length>0
                ?ListView.builder(itemCount: listNhanVien.length,
              itemBuilder: (context, index){
              return BoxNhanVien(
                nhanVien: listNhanVien[index],
              );
            }): Center(
              child: const Text("Khong co lua chon"),
            )
          ))
        ],),
      ),

    );
  }
}
