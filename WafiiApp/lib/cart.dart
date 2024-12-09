import 'package:flutter/material.dart';

void main() {
  runApp(CartPage());
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: GeneratedUI());
  }
}

class GeneratedUI extends StatefulWidget {
  @override
  _GeneratedUIState createState() => _GeneratedUIState();
}

class _GeneratedUIState extends State<GeneratedUI> {
  List<CartItem> cartItems = [
    CartItem(
      imageUrl: 'assets/Group.png', // Path to the asset
      productName: "Khayal 4DW Logo Cap",
      sellerName: "Khayal Caps",
      price: "BHD 9.524",
    ),
    CartItem(
      imageUrl: 'assets/food.png', // Path to the asset
      productName: "MatePad T (32GB) - Deepsea Blue",
      sellerName: "Future Communication Company",
      price: "BHD 45.363",
    ),
    CartItem(
      imageUrl: 'assets/iphone.png', // Path to the asset
      productName: "Bose SoundLink Micro Bluetooth Speaker Blue",
      sellerName: "Ashrafs",
      price: "BHD 49.909",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final padding = width * 0.04;
    final iconSize = width * 0.06;

    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderSection(width: width, iconSize: iconSize),
              NotificationContainer(width: width, padding: padding),
              Padding(
                padding: EdgeInsets.all(padding),
                child: CartDetailsHeader(),
              ),
              SizedBox(
                height: 400,
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SellerCard(
                            sellerName: cartItems[index].sellerName,
                            width: width),
                        ProductCard(
                          item: cartItems[index],
                          width: width,
                          padding: padding,
                          onDecrease: () {
                            setState(() {
                              if (cartItems[index].quantity > 1) {
                                cartItems[index].quantity--;
                              }
                            });
                          },
                          onIncrease: () {
                            setState(() {
                              cartItems[index].quantity++;
                            });
                          },
                          onRemove: () {
                            setState(() {
                              cartItems.removeAt(index);
                            });
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    Key? key,
    required this.width,
    required this.iconSize,
  }) : super(key: key);

  final double width;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFC20431),
      width: width,
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: width * 0.06,
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white, size: iconSize),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Expanded(
            child: Center(
              child: Text(
                "MY CART",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.05,
                ),
              ),
            ),
          ),
          SizedBox(width: iconSize),
        ],
      ),
    );
  }
}

class NotificationContainer extends StatelessWidget {
  const NotificationContainer({
    Key? key,
    required this.width,
    required this.padding,
  }) : super(key: key);

  final double width;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: padding * 0.5),
      child: Center(
        child: Text(
          "Please enable your location service",
          style: TextStyle(
            color: Color(0xFFC20431),
            fontSize: width * 0.035,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class CartDetailsHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Your Cart Details",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Select the Store to Checkout",
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}

class CartItem {
  final String imageUrl;
  final String productName;
  final String sellerName;
  final String price;
  int quantity;

  CartItem({
    required this.imageUrl,
    required this.productName,
    required this.sellerName,
    required this.price,
    this.quantity = 1,
  });
}

class SellerCard extends StatelessWidget {
  final String sellerName;
  final double width;

  SellerCard({required this.sellerName, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: width * 0.02,
        horizontal: width * 0.04,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: width * 0.01,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFFCEEEF),
        borderRadius: BorderRadius.circular(width * 0.02),
      ),
      child: Text(
        "SELLER: $sellerName",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: width * 0.035,
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final CartItem item;
  final double width;
  final double padding;
  final VoidCallback onDecrease;
  final VoidCallback onIncrease;
  final VoidCallback onRemove;

  ProductCard({
    required this.item,
    required this.width,
    required this.padding,
    required this.onDecrease,
    required this.onIncrease,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: padding, vertical: padding * 0.5),
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(width * 0.02),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Combined Seller and Product Info
          Text(
            "SELLER: ${item.sellerName}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: width * 0.035,
              color: Colors.black54,
            ),
          ),
          SizedBox(height: padding * 0.5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              ClipRRect(
                borderRadius: BorderRadius.circular(width * 0.02),
                child: Image.asset(
                  item.imageUrl, // Updated to Image.asset
                  width: width * 0.25,
                  height: width * 0.25,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: padding),
              // Product Name and Price
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.productName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.04,
                      ),
                    ),
                    SizedBox(height: padding * 0.3),
                    Text(
                      item.price,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: width * 0.035,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: padding),
          // Increment/Decrement Buttons and Remove Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Increment and Decrement Buttons
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.remove, size: width * 0.05),
                    onPressed: onDecrease,
                  ),
                  Text(
                    "${item.quantity}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.04,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add, size: width * 0.05),
                    onPressed: onIncrease,
                  ),
                ],
              ),
              // Remove Button
              TextButton(
                onPressed: onRemove,
                child: Text(
                  "Remove",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: width * 0.035,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
