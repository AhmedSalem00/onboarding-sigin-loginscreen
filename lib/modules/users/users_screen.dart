import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:task1/modules/users/bloc/cubit.dart';
import 'package:task1/modules/users/bloc/states.dart';
import 'package:task1/modules/users/user_items.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          ('Users'),
        ),
      ),
      body: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller:AppCubit.get(context).usernameController,
                  decoration: InputDecoration(
                    suffix:TextButton(
                      child: Text(
                        AppCubit.get(context).selectedUser.isEmpty ?
                          'Add' : 'Update',
                      ),
                      onPressed: (){

                        AppCubit.get(context).insertAppDatabase();
                      },
                    ) ,
                      border: OutlineInputBorder(),
                    label: Text('User Name')
                  ),
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async{
                      AppCubit.get(context).getUsersData(Database);
                    },
                    child: ListView.separated(
                        itemBuilder: (context,index)=> UserItems(
                          item: AppCubit.get(context).users[index],
                        ),
                        separatorBuilder: (context,index)=> Container(
                          height: 1,
                          color: Colors.grey,
                          width: double.infinity,
                        ),
                        itemCount:AppCubit.get(context).users.length,
                    ),
                  ),
                ),
              ],
            ),
          );
        },

      ),

    );
  }
}
