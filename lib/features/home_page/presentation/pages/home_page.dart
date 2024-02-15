
import 'package:flutter/material.dart';
import 'package:akil/features/home_page/presentation/bloc/home_page_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../ngo_page/presentation/bloc/ngo_page_bloc.dart';
import '../../../ngo_page/presentation/pages/ngo_page.dart';

class HomePage extends StatefulWidget {
  final NgoPageBloc ngoPageBloc;

  HomePage({required this.ngoPageBloc});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 248, 250),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 40),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage("https://storage.googleapis.com/akil-bucket/static/41c40e66-f9ef-4bf6-80ad-f6bb04dc0f99"),
                  radius: 30.0, // Adjust this value as needed
                ),
                SizedBox(width: 10.0),
                Container(
                  
                  child: Expanded(
                    child: Container(

                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Search Volunteer Opportunities",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            
            Expanded(
              child: _currentIndex == 0
                  ? BlocBuilder<HomePageBloc, HomePageState>(
                      builder: (context, state) {
                        if (state is HomePageLoadInProgress) {
                          return Center(child: CircularProgressIndicator());
                        } else if (state is HomePageLoadSuccess) {
                          return ListView.separated(
                            itemCount: state.data.length,
                            separatorBuilder: (context, index) => SizedBox(height: 8.0), // Add space between the cards
                            itemBuilder: (context, index) {
                              final data = state.data[index];
                              return Card(
                                color: const Color.fromARGB(255, 250, 252, 248), // Change the background color to a very light green
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0), // Add rounded borders to the cards
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        leading: CircleAvatar(
                                          radius: 30.0,
                                          backgroundImage: NetworkImage(data.logoUrl),
                                        ),
                                        title: Text(data.title, style: TextStyle(fontWeight: FontWeight.bold)),
                                        subtitle: Text('${data.orgName}, ${data.location.join(', ')}'),
                                        trailing: Icon(Icons.bookmark_border),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                                            child: Text(
                                              data.opType,
                                              style: TextStyle(
                                                color: data.opType == 'virtual' ? Color.fromARGB(255, 154, 14, 247) : Colors.blue,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: data.opType == 'virtual' ? Color.fromARGB(255, 241, 231, 250) : const Color.fromARGB(255, 217, 235, 250),
                                            ),
                                          ),

                                          const VerticalDivider(
                                            color: Colors.black,
                                            thickness: 2
                                          ),
                                          Expanded(
                                            child: Container(
                                              height: 40.0,
                                              child: ListView(
                                                scrollDirection: Axis.horizontal,
                                                children: data.categories.map((category) {
                                                      final color = Colors.primaries[data.categories.indexOf(category) % Colors.primaries.length];
                                                      return Container(
                                                        width: 85.0, // Set a fixed width
                                                        // Set a fixed height
                                                        margin: EdgeInsets.all(4.0), // Add some margin to create space between the containers
                                                        alignment: Alignment.center, // Center the text inside the container
                                                        decoration: BoxDecoration(
                                                          border: Border.all(color: color, width: 2.0),
                                                          borderRadius: BorderRadius.circular(15.0),
                                                        ),
                                                        child: Text(
                                                          category,
                                                          style: TextStyle(color: color),
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                      );
                                                    }).toList(),



                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        data.description,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: Colors.grey), // Change the color of the description text to grey
                                      ),
                                      SizedBox(height: 2,),
                                      Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                     Container(
                                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                            child: Text(
                                              data.status,
                                              style: TextStyle(
                                                color: data.status == 'open' ? Colors.green : Colors.red,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: data.status == 'open' ? Color.fromARGB(255, 226, 243, 227) : const Color.fromARGB(255, 245, 227, 229),
                                            ),
                                          ),
                                    Text('Updated ${data.updatedAt != "0001-01-01T00:00:00Z" ? DateTime.now().difference(DateTime.parse(data.updatedAt)).inDays : 'N/A'} days ago'),
                                  ],
                                ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          return Center(child: Text('Failed to load data'));
                        }
                      },
                    )
                  : BlocProvider.value(
                      value: widget.ngoPageBloc..add(GetNgoPageDataEvent()),
                      child: NgoPage(),
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.grey),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business, color: Colors.grey),
            label: 'NGOs',
          ),
          // Add other icons here...
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
