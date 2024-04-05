import 'package:demo_api/model/user.dart';
import 'package:demo_api/screen/info.dart';
import 'package:demo_api/screen/image_icon.dart';
import 'package:demo_api/services/user_api.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];
  List<User> display = [];

  double searchBar = 40;
  IconData searchIcon = Icons.search;

  final _controller = TextEditingController();

  void updateList(String val) {
    setState(() {
      display = users
          .where((element) =>
              element.name.first.toLowerCase().contains(val.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    var borderRadius = const BorderRadius.all(Radius.circular(80));

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        setState(() {
          searchBar = 40;
          searchIcon = Icons.search;
        });
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 34, 14),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: searchBar,
                height: 40,
                child: TextField(
                  controller: _controller,
                  onChanged: (value) => updateList(value),
                  onTap: () {
                    setState(() {
                      searchBar = 350;
                      searchIcon = Icons.delete;
                    });
                    if (searchIcon == Icons.delete) {
                      _controller.clear();
                      updateList('');
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'e.g. Simon',
                    contentPadding: const EdgeInsets.only(bottom: 10, left: 10),
                    filled: true,
                    fillColor: Colors.grey[100],
                    suffixIcon: Icon(searchIcon),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(50),
            ),
          ),
          centerTitle: true,
          scrolledUnderElevation: 0,
          title: const Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Text(
              'Rest API Call',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: Colors.brown[100],
        ),
        body: display.isEmpty
            ? const Center(
                child: Text(
                  'No match found',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: display.length,
                itemBuilder: (context, index) {
                  final user = display[index];
                  final color = user.gender == 'male'
                      ? Colors.blue[100]
                      : Colors.pink[100];

                  return Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: ListTile(
                      shape: RoundedRectangleBorder(borderRadius: borderRadius),
                      title: Text(user.name.first),
                      subtitle: Text(user.phone),
                      tileColor: color,
                      contentPadding: const EdgeInsets.fromLTRB(20, 4, 8, 4),
                      leading: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image(
                                image:
                                    Image.network(user.picture.medium).image),
                          ),
                          Positioned.fill(
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onLongPress: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (_) => ImageDialog(
                                        imageUrl: user.picture.large),
                                  );
                                },
                                customBorder: const CircleBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          showModalBottomSheet<dynamic>(
                            isScrollControlled: true,
                            context: context,
                            builder: (BuildContext context) {
                              return Wrap(
                                children: [
                                  InfoPage(user: user),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  void fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
      display = response;
    });
  }
}
