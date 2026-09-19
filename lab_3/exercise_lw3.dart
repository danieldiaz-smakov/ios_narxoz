void main() {
	Library library = Library();

	library.addBook(Book(
		title: 'Clean Code',
		author: 'Robert C. Martin',
		price: 12000.0,
	));

	library.addBook(Book(
		title: 'Dune',
		author: 'Frank Herbert',
		price: 4500.0,
		isBorrowed: true,
	));

	library.addBook(Book(
		title: 'The Hobbit',
		author: 'J.R.R. Tolkien',
		price: 3200.0,
	));

	library.addBook(Book(
		title: 'Abai Zholy',
		author: 'Mukhtar Auezov',
		price: 5300.0,
		isBorrowed: true,
	));

	List<Book> available = library.getAvailableBooks();

	print('Available books:');
	for (int i = 0; i < available.length; i++) {
		Book book = available[i];
		print('${i + 1}. ${book.title} by ${book.author} - ${book.price} ₸');
	}

	double total = library.getTotalValue();
	print('Total collection value: $total ₸');
}


class Book {
	final String title;
	final String author;
	final double price;
	bool isBorrowed;

	Book({
		required this.title,
		required this.author,
		required this.price,
		this.isBorrowed = false,
	});
}


class Library {
	List<Book> _books = [];

	void addBook(Book book) => _books.add(book);

	List<Book> getAvailableBooks() =>
		_books.where((book) => book.isBorrowed == false).toList();

	double getTotalValue() =>
		_books.fold(0.0, (sum, book) => sum + book.price);
}