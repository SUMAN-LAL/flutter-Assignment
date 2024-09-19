import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_provider.dart';
import 'user_detail_screen.dart';

class UserListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Users')),
      body: userProvider.isLoading ? Center(child: CircularProgressIndicator())
          : userProvider.errorMessage != null  ? Center(child: Text(userProvider.errorMessage!))
              : RefreshIndicator(onRefresh: () => userProvider.refreshUsers(),
                  child: ListView.builder(itemCount: userProvider.users.length,
                    itemBuilder: (context, index) {
                      final user = userProvider.users[index];
                      return ListTile(
                        title: Text(user.name),
                        subtitle: Text(user.email),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserDetailScreen(user: user),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
    );
  }
}
