import 'package:e_commerce_app/cart/domain/entity/cart_entity.dart';
import 'package:e_commerce_app/home/domain/entities/product_entity.dart';

const Product product = Product(
    id: 1,
    title: 'title',
    description: 'description',
    category: 'category',
    price: 10,
    image: 'image',
    rating: 5);
const CartEntity cartItem = CartEntity(id: 'id', product: product, quantity: 1);

Future addDelay() async {
  await Future.delayed(const Duration(seconds: 3));
}

Stream<List<CartEntity>> cartStream = Stream.fromIterable([
  [cartItem]
]);
