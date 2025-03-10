import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  final String namaMakanan;
  final int harga;
  final String gambar;


const OrderPage({super.key, required this.namaMakanan, required this.harga, required this.gambar});

@override
_OrderPageState createState() => _OrderPageState();

}

class _OrderPageState extends State<OrderPage>{
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    int totalHarga = widget.harga * quantity;

    return Scaffold(
      appBar: AppBar(title: Text("Order Page"),),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                widget.gambar, // Menggunakan gambar dari parameter
                height: 400,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Pesanan Anda : ${widget.namaMakanan}",
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20,),
            Text("Harga per item : ${widget.harga}",style: const TextStyle(fontSize: 18),),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: (){
                  if (quantity > 1 ){
                    setState(() {
                      quantity--;
                    });
                  }
                },
                icon: const Icon(Icons.remove, color:Colors.red),
                ),
                Text("$quantity", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                IconButton(onPressed: (){
                  setState(() {
                    quantity++;
                  });
                }, icon: Icon(Icons.add, color: Colors.green,),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Text("Total Harga : Rp $totalHarga",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange),
            ),
            const SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Pesanan $quantity ${widget.namaMakanan} telah dikonfirmasi!"),
                duration: const Duration(seconds: 2),),
                );
                Navigator.pop(context);
            },
            child: const Text("Konfirmasi Pesanan"))
          ],
        ),
        
        ),
    );
  }
}