import 'package:flutter/material.dart';
import 'base_page.dart';

class IdolListPage extends StatefulWidget {
  final dynamic controller; // Sesuaikan tipe data controller jika ada

  IdolListPage(this.controller);

  @override
  _IdolListPageState createState() => _IdolListPageState();
}

class _IdolListPageState extends State<IdolListPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> allIdols = [];
  List<Map<String, String>> filteredIdols = [];

  @override
  void initState() {
    super.initState();
    // Daftar idol
    allIdols = [
      {"name": "Park Jisung", "group": "NCT Dream"},
      {"name": "Zhong Chenle", "group": "NCT Dream"},
      {"name": "Na Jaemin", "group": "NCT Dream"},
      {"name": "Lee Haechan", "group": "NCT Dream"},
      {"name": "Lee Jeno", "group": "NCT Dream"},
      {"name": "Huang Renjun", "group": "NCT Dream"},
      {"name": "Mark Lee", "group": "NCT Dream"},
      {"name": "Ning Yizhuo", "group": "aespa"},
      {"name": "Kim Minjeong", "group": "aespa"},
      {"name": "Aeri Uchinaga", "group": "aespa"},
      {"name": "Yu Jimin", "group": "aespa"},
      {"name": "Sakuya Fujinaga", "group": "NCT Wish"},
      {"name": "Hirose Ryo", "group": "NCT Wish"},
      {"name": "Kim Daeyoung", "group": "NCT Wish"},
      {"name": "Tokuno Yushi", "group": "NCT Wish"},
      {"name": "Maeda Riku", "group": "NCT Wish"},
      {"name": "Oh Sion", "group": "NCT Wish"},
      {"name": "Nishimura Riki", "group": "ENHYPEN"},
      {"name": "Yang Jungwon", "group": "ENHYPEN"},
      {"name": "Kim Sunoo", "group": "ENHYPEN"},
      {"name": "Park Sunghoon", "group": "ENHYPEN"},
      {"name": "Sim Jaeyun", "group": "ENHYPEN"},
      {"name": "Park Jongseong", "group": "ENHYPEN"},
      {"name": "Lee Heeseung", "group": "ENHYPEN"},
      {"name": "Shotaro Osaki", "group": "Riize"},
      {"name": "Eunseok", "group": "Riize"},
      {"name": "Jung Sungchan", "group": "Riize"},
      {"name": "Park Wonbin", "group": "Riize"},
      {"name": "Kim Sohee", "group": "Riize"},
      {"name": "Lee Chanyoung", "group": "Riize"},
      {"name": "Lee Hyein", "group": "NewJeans"},
      {"name": "Kang Haerin", "group": "NewJeans"},
      {"name": "Danielle June Marsh", "group": "NewJeans"},
      {"name": "Hanni Pham", "group": "NewJeans"},
      {"name": "Kim Minji", "group": "NewJeans"},
    ];
    filteredIdols = allIdols; // Awalnya, semua idol ditampilkan
  }

  void _filterIdols(String query) {
    setState(() {
      // Filter idol berdasarkan nama atau grup
      filteredIdols = allIdols
          .where((idol) =>
              idol['name']!.toLowerCase().contains(query.toLowerCase()) ||
              idol['group']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      bodyContent: Container(
        color: Colors.pink.shade50, // Background warna soft pink
        child: Column(
          children: [
            // Search bar untuk filter idol
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Cari idol atau grup...',
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
                onChanged: _filterIdols,
              ),
            ),
            // Daftar idol
            Expanded(
              child: ListView.builder(
                itemCount: filteredIdols.length,
                itemBuilder: (context, index) {
                  final idol = filteredIdols[index];
                  return Card(
                    color: Colors.pink.shade100, // Warna Card pink soft
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      tileColor: Colors.pink.shade50, // Warna background list tile
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      title: Text(
                        idol['name']!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.pink.shade900,
                        ),
                      ),
                      subtitle: Text(
                        "Group: ${idol['group']}",
                        style: TextStyle(color: Colors.pink.shade700),
                      ),
                      onTap: () {
                        // Tambahkan navigasi ke detail idol jika diperlukan
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      selectedIndex: 1, // Indeks bottom navigation bar untuk halaman ini
      controller: widget.controller,
    );
  }
}
