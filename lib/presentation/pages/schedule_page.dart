import 'package:flutter/material.dart';
import 'base_page.dart';

class ConcertSchedulePage extends StatefulWidget {
  final dynamic controller; // Sesuaikan tipe data controller jika ada

  ConcertSchedulePage(this.controller);

  @override
  _ConcertSchedulePageState createState() => _ConcertSchedulePageState();
}

class _ConcertSchedulePageState extends State<ConcertSchedulePage> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> allSchedules = [];
  List<Map<String, String>> filteredSchedules = [];

  @override
  void initState() {
    super.initState();
    // Daftar jadwal konser
    allSchedules = [
      {
        "idol": "NCT Dream",
        "date": "2025-02-15",
        "venue": "GOCHEOK SKY DOME",
        "city": "Seoul",
      },
      {
        "idol": "NCT Wish",
        "date": "2025-03-10",
        "venue": "Tottenham Hotspur Stadium",
        "city": "London",
      },
      {
        "idol": "ENHYPEN",
        "date": "2025-05-05",
        "venue": "Tokyo Dome",
        "city": "Tokyo",
      },
      {
        "idol": "Newjeans",
        "date": "2025-02-15",
        "venue": "Gelora Bung Karno",
        "city": "Jakarta",
      },
      {
        "idol": "aespa",
        "date": "2025-02-15",
        "venue": "Jamsil Olimpic",
        "city": "Seoul",
      },
    ];
    filteredSchedules = allSchedules; 
  }

  void _filterSchedules(String query) {
    setState(() {
      filteredSchedules = allSchedules
          .where((schedule) =>
              schedule['idol']!.toLowerCase().contains(query.toLowerCase()) ||
              schedule['city']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      bodyContent: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink.shade50, Colors.pink.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Cari Idol atau Kota...',
                  hintStyle: TextStyle(color: Colors.pink.shade400),
                  prefixIcon: Icon(Icons.search, color: Colors.pinkAccent),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.pinkAccent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.pink.shade200),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                ),
                onChanged: _filterSchedules,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredSchedules.length,
                itemBuilder: (context, index) {
                  final schedule = filteredSchedules[index];
                  return Card(
                    color: Colors.pink.shade100, 
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      tileColor: Colors.pink.shade50, 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      title: Text(
                        schedule['idol']!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.pink.shade900,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Date: ${schedule['date']}",
                            style: TextStyle(color: Colors.pink.shade700),
                          ),
                          Text(
                            "Venue: ${schedule['venue']}",
                            style: TextStyle(color: Colors.pink.shade700),
                          ),
                          Text(
                            "City: ${schedule['city']}",
                            style: TextStyle(color: Colors.pink.shade700),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      selectedIndex: 1,
      controller: widget.controller,
    );
  }
}
