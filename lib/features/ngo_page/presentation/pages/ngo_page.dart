import 'package:flutter/material.dart';
import 'package:akil/features/ngo_page/presentation/bloc/ngo_page_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NgoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 248, 250),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
        
            Expanded(
              child: BlocBuilder<NgoPageBloc, NgoPageState>(
                builder: (context, state) {
                  if (state is NgoPageLoadInProgress) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is NgoPageLoadSuccess) {
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
                                  title: Text(data.orgName, style: TextStyle(fontWeight: FontWeight.bold)),
                                  subtitle: Expanded(
                                      child: Container(
                                        height: 50.0,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: data.orgArea.length,
                                          itemBuilder: (context, index) {
                                            return Row(
                                              children: [
                                                Text(
                                                  data.orgArea[index],
                                                  style: TextStyle(
                                                    color: Colors.primaries[index % Colors.primaries.length], // This will give each text a different color
                                                  ),
                                                ),
                                                SizedBox(width: 6,)
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  trailing: Icon(Icons.bookmark_border),
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
                                    Text(
                                      '${data.oppCount} Available Opportunities',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold, // Make the text bold
                                        color: Colors.blue, // Change the text color to blue
                                      ),
                                    ),
                                    Text('Since ${data.year}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, // Make the text bold
                                        color: Colors.grey, // Change the text color to blue
                                      ),),
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
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}
