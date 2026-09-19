void main() {
	ShoppingCart cart = ShoppingCart();

	cart.addItem(Audiobook(
		id: 'A1',
		title: 'The Art of Focus',
		price: 5000.0,
		durationHours: 5.5,
		narrator: 'Alex Morgan',
	));
	
    cart.addItem(EBook(
		id: 'E1',
		title: 'Flutter for Beginners',
		price: 3000.0,
		fileSizeMB: 4.5,
		author: 'Aruzhan Sadykova',
	));
	
    cart.addItem(EBook(
		id: 'E2',
		title: 'Dart Cookbook',
		price: 2000.0,
		fileSizeMB: 2.0,
		author: 'John Smith',
	));

	cart.addItem(Audiobook(
		id: 'A2',
		title: 'Startup Stories',
		price: 8000.0,
		durationHours: 9.0,
		narrator: 'Maria Lopez',
	));

	print('Items up to 4000.0 ₸:');
	List<MediaItem> cheap = cart.filterByMaxPrice(4000.0);
    
	for (int i = 0; i < cheap.length; i++) {
		print('- ${cheap[i].title} (${cheap[i].price} ₸)');
	}

	cart.printReceipt();
}


abstract class MediaItem {
	final String id;
	final String title;
	final double price;

	MediaItem({required this.id, required this.title, required this.price});

	String getDetails();
}

mixin Downloadable {
	void download(String title) => print('Downloading: $title...');
}

class Audiobook extends MediaItem with Downloadable {
	final double durationHours;
	final String narrator;

	Audiobook({
		required String id,
		required String title,
		required double price,
		required this.durationHours,
		required this.narrator,
	}) : super(id: id, title: title, price: price);

	String getDetails() =>
		'Audiobook [$id] $title - $price ₸, ${durationHours}h, narrated by $narrator';
}

class EBook extends MediaItem with Downloadable {
	final double fileSizeMB;
	final String author;

	EBook({
		required String id,
		required String title,
		required double price,
		required this.fileSizeMB,
		required this.author,
	}) : super(id: id, title: title, price: price);

	String getDetails() =>
		'EBook [$id] $title - $price ₸, $fileSizeMB MB, by $author';
}

class ShoppingCart {
	List<MediaItem> _items = [];

	void addItem(MediaItem item) => _items.add(item);

	double calculateTotalWithTax({double taxRate = 0.12}) {
		final double subtotal = _items.fold(0.0, (sum, item) => sum + item.price);
		return subtotal + subtotal * taxRate;
	}

	List<MediaItem> filterByMaxPrice(double maxPrice) =>
		_items.where((item) => item.price <= maxPrice).toList();

	void printReceipt() {
		print('===== Receipt =====');

		for (int i = 0; i < _items.length; i++) {
			MediaItem item = _items[i];
			print('${i + 1}. ${item.getDetails()}');

			if (item is Downloadable) {
				(item as Downloadable).download(item.title);
			}
		}

		print('Total with tax: ${calculateTotalWithTax()} ₸');
	}
}