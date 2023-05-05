import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:watcher_web/screens/auth/user_information.dart';
import 'package:watcher_web/screens/sidebar_screen.dart';

class UserListsScreen extends StatefulWidget {
  const UserListsScreen({Key? key}) : super(key: key);

  @override
  UserListsState createState() => UserListsState();
}

class UserListsState extends State<UserListsScreen> {
  late UserDataSource userDataSource;
  List<UserEntity> userData = [];

  final getDataFromFireStore =
      FirebaseFirestore.instance.collection('user').snapshots();

  Widget _buildDataGrid() {
    return StreamBuilder(
      stream: getDataFromFireStore,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          if (userData.isNotEmpty) {
            getDataGridRowFromDataBase(DocumentChange<Object?> data) {
              return DataGridRow(cells: [
                DataGridCell<String>(
                    columnName: 'name', value: data.doc['name']),
                DataGridCell<String>(
                    columnName: 'email', value: data.doc['email']),
                DataGridCell<String>(
                    columnName: 'phoneNumber', value: data.doc['phoneNumber']),
                //DataGridCell<String>(
                //columnName: 'phoneNumber', value: data.doc['phoneNumber']),
              ]);
            }

            for (var data in snapshot.data!.docChanges) {
              if (data.type == DocumentChangeType.modified) {
                if (data.oldIndex == data.newIndex) {
                  userDataSource.dataGridRows[data.oldIndex] =
                      getDataGridRowFromDataBase(data);
                }
                userDataSource.updateDataGridSource();
              } else if (data.type == DocumentChangeType.added) {
                userDataSource.dataGridRows
                    .add(getDataGridRowFromDataBase(data));
                userDataSource.updateDataGridSource();
              } else if (data.type == DocumentChangeType.removed) {
                userDataSource.dataGridRows.removeAt(data.oldIndex);
                userDataSource.updateDataGridSource();
              }
            }
          } else {
            for (var data in snapshot.data!.docs) {
              userData.add(UserEntity(
                  id: data['id'],
                  name: data['name'],
                  email: data['email'],
                  phoneNumber: data['phoneNumber'],
                  imageUrl: data['imageUrl']));
            }
            userDataSource = UserDataSource(userData);
          }

          return SfDataGrid(
            source: userDataSource,
            columns: getColumns,
            columnWidthMode: ColumnWidthMode.fill,
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('User List'), backgroundColor: Colors.black),
      drawer: const SidebarScreen(),
      body: _buildDataGrid(),
    );
  }
}

class UserDataSource extends DataGridSource {
  UserDataSource(this.userData) {
    _buildDataRow();
  }

  List<DataGridRow> dataGridRows = [];
  List<UserEntity> userData;

  void _buildDataRow() {
    dataGridRows = userData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(columnName: 'email', value: e.email),
              DataGridCell<String>(
                  columnName: 'phoneNumber', value: e.phoneNumber),
            ]))
        .toList();
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter buildRow(
    DataGridRow row,
  ) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }

  void updateDataGridSource() {
    notifyListeners();
  }
}

List<GridColumn> get getColumns {
  return <GridColumn>[
    GridColumn(
        columnName: 'name',
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text('Name'))),
    GridColumn(
        columnName: 'email',
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text(
              'Email',
              overflow: TextOverflow.ellipsis,
            ))),
    GridColumn(
        columnName: 'phoneNumber',
        label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text('Phone Number'))),
  ];
}
