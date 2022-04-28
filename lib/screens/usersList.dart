import 'package:flutter/material.dart';
import 'package:apitest/models/user_model.dart';
import 'package:apitest/widgets/userWidget.dart';
import 'package:apitest/apiService.dart';

import 'editORaddUser.dart';

class UsersList extends StatefulWidget {
  UsersList({
    Key? key,
  });

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  late List users;
  bool isLoading = false;

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });
    NetworkHelper networkHelper = NetworkHelper();
    users = await networkHelper.getUsers();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
              color: Color(0xFF403F3C),
            ),
          )
        : Scaffold(
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              UserDetails(mode: 'add', id: 1)));
                }),
            appBar: AppBar(
              backgroundColor: Colors.purple,
              automaticallyImplyLeading: false,
              title: const Text(
                'Users',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 2,
            ),
            backgroundColor: Colors.grey,
            body: SafeArea(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                        child: ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return UserWidget(user: users[index]);
                      },
                    )),
                  ],
                ),
              ),
            ),
          );
  }
}
