import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum BuildingType { theater, restaurant }

class Building {
  BuildingType buildingType;
  String name;
  String address;

  Building(this.buildingType, this.name, this.address);
}

typedef OnItemClickListener = void Function(int position);

class ItemView extends StatelessWidget {
  final int position;
  final Building building;
  final OnItemClickListener listener;
  ItemView(this.position,this.building,this.listener);

  @override
  Widget build(BuildContext context) {
    final icon = Icon(
        building.buildingType == BuildingType.restaurant
            ? Icons.restaurant
            : Icons.theaters,
        color: Colors.blue[500]);
    return InkWell(
      onTap: ()=>listener(position),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(16.0),
            child: icon,
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  building.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                Text(building.address)
              ],
            ),
          )
        ],
      )
    );
  }
}

class BuildingListView extends StatelessWidget {
  final List<Building> buildingList;
  final OnItemClickListener listener;

  BuildingListView(this.buildingList,this.listener);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: buildingList.length,
        itemBuilder: (context, index) {
          return ItemView(index,buildingList[index],listener);
        });
  }
}
