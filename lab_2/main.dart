void main() {
	String name = 'Daniel';
	double balance = 50000.0;

	checkBalance(name: name, balance: balance);

	// Пополнение: с суммой и без суммы
	balance = deposit(currentBalance: balance, amount: 15000.0);
	balance = deposit(currentBalance: balance);

	// Снятие: верный PIN
	balance = withdraw(
		name: name,
		currentBalance: balance,
		amount: 5000.0,
		pinCode: 1234,
	);

	// Неверный PIN
	balance = withdraw(
		name: name,
		currentBalance: balance,
		amount: 5000.0,
		pinCode: 1111,
	);

	// PIN не передан (null)
	balance = withdraw(
		name: name,
		currentBalance: balance,
		amount: 5000.0,
	);

	// Недостаточно средств
	balance = withdraw(
		name: name,
		currentBalance: balance,
		amount: 999999.0,
		pinCode: 1234,
	);

	// Сумма не передана
	balance = withdraw(
		name: name,
		currentBalance: balance,
		pinCode: 1234,
	);

	checkBalance(name: name, balance: balance);
}



void checkBalance({required String name, required double balance}) =>
	print('$name, your available balance: $balance ₸');


double deposit({required double currentBalance, double? amount}) {
	final double safeAmount = amount ?? 0.0;

	if (safeAmount < 0) {
		print('Error: deposit amount cannot be negative. Transaction declined.');
		return currentBalance;
	}

	final double newBalance = currentBalance + safeAmount;

	print('--- Deposit receipt ---');
	print('Deposited: $safeAmount ₸');
	print('New balance: $newBalance ₸');

	return newBalance;
}


double withdraw({
	required String name,
	required double currentBalance,
	double? amount,
	int? pinCode,
}) {
	const int correctPin = 1234;

	final int enteredPin = pinCode ?? 0;

	if (enteredPin != correctPin) {
		print('Error: incorrect PIN. Transaction declined.');
		return currentBalance;
	}

	final double safeAmount = amount ?? 0.0;

	if (safeAmount < 0) {
		print('Error: withdrawal amount cannot be negative. Transaction declined.');
		return currentBalance;
	}

	if (safeAmount > currentBalance) {
		print('Error: insufficient funds. Transaction declined.');
		return currentBalance;
	}

	final double newBalance = currentBalance - safeAmount;

	print('--- Withdrawal receipt ---');
	print('Client: $name');
	print('Withdrawn: $safeAmount ₸');
	print('Remaining balance: $newBalance ₸');

	return newBalance;
}