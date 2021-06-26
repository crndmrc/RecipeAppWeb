import 'package:flutter/material.dart';
class Dragable extends StatefulWidget{
  Dragablepage createState()=> Dragablepage();
}

class Dragablepage extends State<Dragable> {
  String _targetImageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dünyadaki En Sıradışı Yemekler',style:TextStyle(fontFamily: 'Varela',fontSize: 20.0,color:Color(0xFF545068)),
        ),
        backgroundColor: Colors.white,),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Draggable<String>(
                data:
                "https://arkeofili.com/wp-content/uploads/2019/01/yemek2.jpg",
                child: Container(
                  width: 300,
                  height: 200,
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: Image.network(
                    'https://arkeofili.com/wp-content/uploads/2019/01/yemek2.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                // The widget to show under the pointer when a drag is under way
                feedback: Opacity(
                  opacity: 0.4,
                  child: Container(
                    color: Colors.white,
                    width: 300,
                    height: 200,
                    alignment: Alignment.center,
                    child: Image.network(
                      'https://arkeofili.com/wp-content/uploads/2019/01/yemek2.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'Gine domuzu (cuy) yeme geleneği en az 5000 yıl öncesine, İnkaların atalarına dayanıyor. Machu Picchu’daki mağaralarda keşfedilen Gine domuzu dişleri, bu hayvanın etiyle yapılan yemeğin cenaze ritüelleri sırasında yenildiğini gösteriyor. Mumyalanmış insan mezarlarında hatta antik çömleklerin üzerinde de bu havyanlara rastlamak mümkün. Hali hazırda Gine domuzu etiyle hazırlanan birkaç tarif bulunsa da en eski tarifin hangisi olduğunu söylemek oldukça zor. Cizvit gezgin Bernabé Cobo, İnkaların 17. yüzyılda Gine domuzlarını acı biber, bazen de nane ve kadife çiçeğiyle doldurup carapulcra adı verilen bir yahni pişirdiklerini yazıyor.',
                  style: DefaultTextStyle.of(context).style,),),
              DragTarget<String>(
                onAccept: (value) {
                  setState(() {
                    _targetImageUrl = value;
                  });
                },
                builder: (_, candidateData, rejectedData) {
                  return Container(
                    width: 50,
                    height: 30,
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: _targetImageUrl != null
                        ? Image.network(
                      _targetImageUrl,
                      fit: BoxFit.cover,
                    )
                        : Container(),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}