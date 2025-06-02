
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:todo_list/constants/color.dart';
import 'package:todo_list/model/Tugas.dart';
import 'package:todo_list/widgets/tugas_item.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final listtugas = Tugas.tugaTugasItem();
  final _controller15 = AdvancedSwitchController();
  List<Tugas> _foundTugas = [];
  final _todoController = TextEditingController();

  @override
  void dispose() {
    _controller15.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _foundTugas = listtugas;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: tdBGColor,

      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                searchBox(),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AdvancedSwitch(
                      activeChild: Icon(
                        MaterialCommunityIcons.weather_sunny,
                        color: Colors.white,
                      ),
                      inactiveChild: Icon(
                        MaterialCommunityIcons.weather_night,
                        color: Colors.white,
                      ),
                      activeColor: Colors.blueGrey,
                      inactiveColor: tdBlue,
                      width: 60,
                      controller: _controller15,
                    ),
                  ],
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 20),
                        child: Text(
                          'Semua Catatan',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      for (Tugas tugas in _foundTugas)
                        TugasItem(
                          tugas: tugas,
                          onTodoChange: _handleListGanti,
                          onDeleteItem: (id) => _handleListHapus(id),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _todoController,
                      decoration: const InputDecoration(
                        hintText: 'Silahkan tambahkan list',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    child: Text(
                      '+',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    onPressed: () {
                      _addListTugas(_todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tdBlue,
                      minimumSize: Size(60, 60),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleListGanti(Tugas tugas) {
    setState(() {
      tugas.isDone = !tugas.isDone;
    });
  }

  void _handleListHapus(String id) {
    setState(() {
      listtugas.removeWhere((item) => item.id == id);
    });
  }

  void _addListTugas(String tugas) {
    setState(() {
      listtugas.add(
        Tugas(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          tekstugas: tugas,
        ),
      );
    });
    _todoController.clear();
  }

  void _run(String keyword) {
    List<Tugas> results = [];
    if (keyword.isEmpty) {
      results = listtugas;
    } else {
      results =
          listtugas
              .where(
                (item) => item.tekstugas!.toLowerCase().contains(
                  keyword.toLowerCase(),
                ),
              )
              .toList();
    }
    setState(() {
      _foundTugas = results;
    });
  }

  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (value) => _run(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          prefixIcon: Icon(Icons.search, color: tdBlack, size: 20),
          prefixIconConstraints: const BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: tdGrey, fontFamily: 'Poppins'),
        ),
      ),
    );
  }
}

AppBar _buildAppBar() {
  return AppBar(
    backgroundColor: tdBGColor,
    elevation: 0,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.menu, color: Colors.black, size: 30),
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('assets/images/avatar.jpg'),
          ),
        ),
      ],
    ),
  );
}
