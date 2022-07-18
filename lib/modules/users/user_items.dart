import 'package:flutter/material.dart';
import 'package:task1/modules/users/bloc/cubit.dart';

class UserItems extends StatelessWidget {

  final Map<dynamic,dynamic>item;

  const UserItems({
    Key? key,
    required this.item,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:(){
        AppCubit.get(context).selectUserToUpdate(user: item);
      } ,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            CircleAvatar(
              child: Text(
                '${item['id']}',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              radius: 30,
              backgroundColor: Colors.grey,

            ),
            SizedBox(
                width: 10.0
            ),
            Expanded(
              child: Text(
                '${item['name']}',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
