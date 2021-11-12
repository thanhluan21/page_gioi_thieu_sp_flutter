import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Gioi Thiệu Sản Phẩm",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Gioi Thiệu Sản Phẩm"),
        ),
        body: SanPham(),
      ),
    );
  }
}
class SanPham extends StatefulWidget{
  @override
  SanPhamState createState() =>new SanPhamState();
}
class SanPhamState extends State<SanPham>{
final List<String> images=[
   'images/hinh1.jpg',
   'images/hinh2.jpg',
   'images/hinh3.jpg',
   'images/hinh4.jpg',
 ];
 int imagePos=0;

  @override
  Widget build(BuildContext context) {
    final with_image = MediaQuery
        .of(context)
        .size
        .width;
    // TODO: implement build
    return Column(
      children: <Widget>[
        Center(
            child:CarouselSlider.builder(
              itemCount: images.length,
              options:CarouselOptions(
                height: with_image*0.9,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  // Cập nhật số thứ tư ảnh
                  setState(() {
                    imagePos = index;
                  });
                },
              ),
              itemBuilder:(BuildContext context,int index,with_image){
                return Container(
                  height: with_image*0.9, width: with_image*0.9,
                  //margin: EdgeInsets.all(5),
                  child: Image.asset(images[index])
                  ,

                );
              },

            )

        ),
        Row(
          children: [
            Expanded(child: SizedBox()),
            Container(
                color: Colors.grey[300],
                child: Text('${imagePos+1}/${images.length}')
            ),
          ],
        ),
        Container(
          child: Text("Điện Thoại IP"),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
    children: [
              Icon(Icons.star,color:Colors.yellow[500],),
               Icon(Icons.star,color:Colors.yellow[500],),
                 Icon(Icons.star,color:Colors.yellow[500],),
                  Icon(Icons.star,color:Colors.black,),
                 Icon(Icons.star,color:Colors.black,),
    ],
    )

      ],

    );

  }

}