import 'package:apitest/screens/editORaddUser.dart';
import 'package:apitest/screens/usersList.dart';
import 'package:flutter/material.dart';
import 'package:apitest/models/user_model.dart';
import 'package:apitest/apiservice.dart';

class UserWidget extends StatefulWidget {
  const UserWidget({required this.user});

  final UserModel user;

  @override
  State<UserWidget> createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      height: 140,
      child: Card(
        elevation: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(5),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("${widget.user.userName}",
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        Text("id:${widget.user.userId}"),
                        Text("gender:${widget.user.gender}"),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.9, 0.9),
                      child: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          NetworkHelper networkHelper = NetworkHelper();
                          networkHelper.deleteUser(widget.user.userId).then(
                              (value) => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UsersList())));
                        },
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.70, 0.9),
                      child: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserDetails(
                                        mode: 'update',
                                        id: widget.user.userId,
                                      )));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
