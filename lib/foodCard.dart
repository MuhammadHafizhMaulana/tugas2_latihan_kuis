import 'package:flutter/material.dart';
import 'package:tugas2/order.dart';

class FoodCard extends StatelessWidget{
  final String nama;
  final int harga;
  final String gambar;
  final VoidCallback order;

  const FoodCard({
    super.key,
    required this.nama,
    required this.harga,
    required this.gambar,
    required this.order,
  });

  @override Widget build(BuildContext context){
    return Card(
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              gambar,
              height: 80,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5,),
          Text(nama,style: TextStyle(fontWeight: FontWeight.bold),),
          Text("Rp $harga",style: TextStyle(color: Colors.red),),
          const SizedBox(height: 5,),
          ElevatedButton(onPressed: order,
          child: Text("Pesan")),

        ],
      ), 
       );
  }
}