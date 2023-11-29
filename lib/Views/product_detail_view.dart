// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ProductDetailView extends StatefulWidget {
  final String productImage;
  final String productTitle;
  final String productDescription;
  final String productCategory;
  final String productCount;
  final String productPrice ;
  final String productRating;

  const ProductDetailView({
    Key? key,
    required this.productImage,
    required this.productTitle,
    required this.productDescription,
    required this.productCount,
    required this.productPrice,
    required this.productRating, required this.productCategory,
  }) : super(key: key);

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
       backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading:  InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.adaptive.arrow_back, color: Colors.white,)) ,
        centerTitle: true,
        title: Text('Product Details' , style: TextStyle ( color : Colors.white , fontWeight: FontWeight.w500),),
        actions: const [   
          Icon(Icons.shopping_cart , color: Colors.white,), 
          SizedBox(width: 12,),
          Icon(Icons.menu , color: Colors.white,),
          SizedBox(width: 14,),
          ],
        
      ),
      
      body: SingleChildScrollView(
        child: Column(
          children: [
      
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: height * .4 ,
                width: double.infinity,
                // color: Colors.amber,
                child: Image.network(widget.productImage , fit: BoxFit.contain,),
                
              ),
            ),
            SizedBox(height: 12,),
      
            Container(
              // height: height * .35,
                constraints: BoxConstraints(
                    maxHeight: double.infinity
                  ),
              width: width * .9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color.fromARGB(255, 186, 215, 248),
              
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.productTitle , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
                      SizedBox(height: 3,),
                      Text(widget.productCategory , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold),),
                      SizedBox(height: 6,),
                      Text(widget.productDescription , style: TextStyle(fontSize: 12 , fontWeight: FontWeight.w400),),
                      
                      SizedBox(height: 8,),
                      Row(
                        children: [
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star),
                          ],
                      ),
                      SizedBox(height: 8,),
                      Padding(
                        padding: const EdgeInsets.only(left : 2.0 , right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('\$ ${widget.productPrice.toString()}'  , style: TextStyle(fontSize: 24 , fontWeight: FontWeight.bold , ),),
                            Icon(Icons.favorite_border , size: 30,),
                          //  SizedBox(width: width * .001,)
                          ],
                        ),
                      ),
                      SizedBox(height: 8,),
                      Icon(Icons.shopping_cart ,size: 30,)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 12,)
          ],
        ),
      ),
    );
  }
}
