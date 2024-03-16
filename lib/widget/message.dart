import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  State<Message> createState() => _MessageDurumu();
}

class _MessageDurumu extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 50),
              child: ClipOval(
                child: Container(
                  width: 64, // Çap için 64, yarıçap için 2 ile çarpın
                  height: 64, // Çap için 64, yarıçap için 2 ile çarpın
                  color: Color.fromARGB(
                      255, 221, 216, 237), // İstenilen rengi ayarlayın
                  child: Image.asset(
                      "assets/register_pp.png"), // Gerçek URL veya yol ile değiştirin
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 40.0, left: 20), // Sol kenar boşluğu eklendi
              child: Column(
                crossAxisAlignment: CrossAxisAlignment
                    .start, // Metinlerin sol kenara yaslanması sağlandı
                children: [
                  Text(
                    "Ömer Faruk Ekim", // _nameSurname özelliği varsayıldı
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8), // Üst boşluğu ayarlandı
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors
                          .blue, // İstenilen konuşma balonu rengini ayarlayın
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Buraya metninizi yazın",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
