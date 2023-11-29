

import 'package:avialdoassessment/Views/product_detail_view.dart';
import 'package:avialdoassessment/data.dart';
import 'package:flutter/material.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {

  
  @override
  Widget build(BuildContext context) {
  ProductsData productsData = ProductsData();
    
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        // leading:  Icon(Icons.adaptive.arrow_back, color: Colors.white,) ,
        centerTitle: true,
        title: Text('Products' , style: TextStyle ( color : Colors.white , fontWeight: FontWeight.w500),),
        actions: const [   
          Icon(Icons.shopping_cart , color: Colors.white,), 
          SizedBox(width: 12,),
          Icon(Icons.menu , color: Colors.white,),
          SizedBox(width: 14,),
          ],
        
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: productsData.productsDataList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 4,
                mainAxisExtent: 450,
                crossAxisCount: 2), 
              itemBuilder: (context , index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetailView(
                        productImage: productsData.productsDataList.elementAt(index)['image'],
                        productTitle: productsData.productsDataList.elementAt(index)['title'], 
                        productDescription: productsData.productsDataList.elementAt(index)['description'], 
                        productCategory: productsData.productsDataList.elementAt(index)['category'], 
                        productCount:productsData.productsDataList.elementAt(index)['rating']['count'].toString(), 
                        productPrice:  productsData.productsDataList.elementAt(index)['price'].toString(), 
                        productRating: productsData.productsDataList.elementAt(index)['rating']['rate'].toString())));
                    },
                    child: productTile(productsData, index),
                  ),
                );
              }),
          )

        ],
      ),
    );
  }

  Container productTile(ProductsData productsData, int index) {
    return Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                    color: Color.fromARGB(255, 186, 215, 248),),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        Container(
                          height: 250,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(12) , topRight: Radius.circular(12)),
                            child: Image.network((productsData.productsDataList.elementAt(index)['image']), fit: BoxFit.fill,)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(productsData.productsDataList.elementAt(index)['title'] ,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                           maxLines: 3,
                          style: TextStyle(color: Colors.black , fontWeight: FontWeight.w500 , fontSize: 16),),
                          SizedBox(height: 10,),
                          
                          Text(productsData.productsDataList.elementAt(index)['category'] ,style: TextStyle(color: Colors.black , fontWeight: FontWeight.w400 , fontSize: 14),),
                          Text( 'Available :  ${productsData.productsDataList.elementAt(index)['rating']['count']}'  ,style: TextStyle(color: Colors.black , fontWeight: FontWeight.w400 , fontSize: 14),),
                          SizedBox(height: 10,),
                          Text( " \$ ${ productsData.productsDataList.elementAt(index)['price']}"  ,style: TextStyle(color: Colors.black , fontWeight: FontWeight.w600 , fontSize: 18),),
                                              
                            ],
                          ),
                        ),
                      
                      ],
                    ),
                  );
  }
}