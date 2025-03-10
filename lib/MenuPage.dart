import 'package:flutter/material.dart';
import 'package:tugas2/foodCard.dart';
import 'package:tugas2/order.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu Makanan"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          // Banner Gambar
          Image.asset(
            'assets/image/baner.jpeg',
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          const Text(
            "Mau makan apa hari ini?",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Daftar Menu",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 10),
          
          // Menghindari Overflow dengan Expanded
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: foodList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8, // Mengurangi ukuran agar tidak kepanjangan
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final makanan = foodList[index];

                return FoodCard(
                  nama: makanan['nama'],
                  harga: makanan['harga'],
                  gambar: makanan['gambar'],
                  order: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderPage(
                          namaMakanan: makanan['nama'],
                          harga: makanan['harga'],
                          gambar: makanan['gambar'],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ==================== List Makanan (Menggunakan Asset) ====================
final List<Map<String, dynamic>> foodList = [
  {
    "nama": "Nasi Goreng",
    "harga": 15000,
    "gambar": "assets/image/nasgor.jpeg"
  },
  {
    "nama": "Ayam Geprek",
    "harga": 12000,
    "gambar": "assets/image/geprek.jpeg"
  },
];
