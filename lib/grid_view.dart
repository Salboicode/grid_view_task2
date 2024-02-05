import 'package:flutter/material.dart';
import 'package:grid_view_task2/api.dart';
import 'package:grid_view_task2/productscreen.dart';


class GridViewScreen extends StatefulWidget {
  const GridViewScreen({super.key});

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  bool isLoading = true;

 @override
  void initState() {
    super.initState();
    if (DataSource.listOfProduct.isEmpty) {
      DataSource.getProductsFromApi().then((value) {
        setState(() {
          isLoading = false;
        });
      });
    } else {
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[600],
        centerTitle: true,
        title: const Text(
          'Products',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      backgroundColor: Colors.blueGrey[300],
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                const SizedBox(height: 15),
                Expanded(
                  child: GridView.builder(
                    itemCount: DataSource.listOfProduct.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductScreen(
                                product: DataSource.listOfProduct[index],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 200,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    child: Hero(
                                      tag: 'abc',
                                      child: Image.network(
                                        DataSource.listOfProduct[index].productImage,
                                        fit: BoxFit.fill,
                                        height: 100,
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        ),
                                      child: Center(
                                        child: Column(
                                          children: [
                                            Text(
                                              DataSource.listOfProduct[index].productName,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              'Price: ${DataSource.listOfProduct[index].productPrice.toString()} \$',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(255, 170, 170, 170),
                                                fontSize: 10,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}