import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task1/modules/users/bloc/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() :super(AppInitialState());


  static AppCubit get(context) => BlocProvider.of(context);

 late Database database;


  void initAppDatabase() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'users.db');
    debugPrint('AppDatabaseInitialized');
    openAppDatabase(path: path);


    emit(AppDatabaseInitialized());
  }



  void openAppDatabase({
    required String path,
  }) async {
    openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(
              'CREATE TABLE users (id INTEGER PRIMARY KEY, name TEXT )');

          debugPrint('Table Created');
        },
          onOpen: (Database db){
          debugPrint('AppDatabaseOpened');
          database =db;

          getUsersData(database);

    }
        );

  }

TextEditingController usernameController =TextEditingController();

  void insertAppDatabase()  {

    if (selectedUser.isNotEmpty){
      updateAppDatabase();
      return;
    }

    database.transaction((txn) async {
        txn.rawInsert(
          'INSERT INTO users(name) VALUES("${usernameController.text}")');

    }).then((value) {
      debugPrint('User Data Inserted');
      usernameController.clear();

            getUsersData(database);
      emit(AppDatabaseUserCreated());
    });
  }

  List<Map> users=[];

  void getUsersData(Database ) async{
    emit(AppDatabaseLoading());

     database.rawQuery('SELECT * FROM users').then((value) {
      debugPrint('Users Data Fetched');
      debugPrint(users.toString());

      users=value;
      emit(AppDatabaseUsers());
    });


  }

Map selectedUser ={};


void selectUserToUpdate({
  required Map user,
})
{
  selectedUser= user;
  usernameController.text =selectedUser['name'];
  emit( AppSelectUsers());
}


  void updateAppDatabase()

  async {
     database.rawUpdate(
        'UPDATE users SET name = ?,  WHERE id = ${selectedUser['id']}',[
         (usernameController.text ),
     ]).then((value) {

          selectedUser={};
          usernameController.clear();
          debugPrint('App Data Updated');
          getUsersData(database);


          });

  }

}