void main() {
  String name = "Bekzat";
  int age = 25;
  double gpa = 3.4;
  bool isStudent = false;

  print("name : $name\nage: $age y.o.\ngpa: $gpa\nis Teacher: ${!isStudent}");

  String text1 = "Hello";
  // String nullText = null; not works
  String? text2 = null;
  print('text1: $text1');
  print('text2: $text2');

  int length1 = text1.length;
  int length2 = text2?.length ?? 0;
  print(length1);
  print(length2);

  String confirmedText = text2 ?? "default";
  print("confirmed $confirmedText length: ${confirmedText.length}");

  int digit = 3;
  print("MULTIPLICATION TABLE for digit $digit");
  for (int i = 1; i <= 10; i++) {
    print("$digit * $i = ${i * digit}");
  }

  for (int i = 10; i > 0; i--) {
    if (i % 2 == 0) {
      print("$i");
    } else {
      print("${i * 2}");
    }
  }

    // TASK 1
    printMultiplicationTables();

    // TASK 2
    printNextDay(5, 9, 2026);   // 06.09.2026
    printNextDay(28, 2, 2024);  // 29.02.2024
    printNextDay(28, 2, 2026);  // 01.03.2026
    printNextDay(29, 2, 2026);  // invalid date
    printNextDay(28, 2, 2100);  // 01.03.2100
    printNextDay(28, 2, 2000);  // 29.02.2000
    printNextDay(31, 12, 2025); // 01.01.2026

    // TASK 3
    int vowels = countVowels("flutter mobile ios development");
    print("Vowels: $vowels");
}

// TASK 1
// OUTPUT MULTIPLICATION TABLE  1-10

void printMultiplicationTables() {
  for (int a = 1; a <= 10; a++) {
    print("-- Table for $a");
    for (int b = 1; b <= 10; b++) {
      print("$a * $b = ${a * b}");
    }
  }
}


// TASK 2
// next day : examples:
// 05.09.2026 -> 06.09.2026
// 28.02.2024 -> 29.02.2024
// 28.02.2026 -> 01.03.2026
// 29.02.2026 -> invalid date
// 28.02.2100 -> 01.03.2100
// 28.02.2100 -> 29.02.2000
// 31.12.2025 -> 01.01.2026
// 2000,2400 leap year
// 2100,2200,2300 isn`t leap year

void printNextDay(int day, int month, int year) {
  String input = "${twoDigits(day)}.${twoDigits(month)}.$year";

  if (month < 1 || month > 12 || day < 1 || day > daysInMonth(month, year)) {
    print("$input -> invalid date");
    return;
  }

  int newDay = day + 1;
  int newMonth = month;
  int newYear = year;

  if (newDay > daysInMonth(month, year)) {
    newDay = 1;
    newMonth = month + 1;
    if (newMonth > 12) {
      newMonth = 1;
      newYear = year + 1;
    }
  }

  print("$input -> ${twoDigits(newDay)}.${twoDigits(newMonth)}.$newYear");
}

int daysInMonth(int month, int year) {
  if (month == 2) {
    if (isLeapYear(year)) {
      return 29;
    }
    return 28;
  }
  if (month == 4 || month == 6 || month == 9 || month == 11) {
    return 30;
  }
  return 31;
}

String twoDigits(int n) {
  if (n < 10) {
    return "0$n";
  }
  return "$n";
}

bool isLeapYear(int year) {
  return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;
}


// TASK3
// Vowel Counter in a String -> "flutter mobile development" -> 8

int countVowels(String text) {
  String vowels = "aeiouAEIOU";
  int count = 0;
  for (int i = 0; i < text.length; i++) {
    for (int j = 0; j < vowels.length; j++) {
      if (text[i] == vowels[j]) {
        count++;
      }
    }
  }
  return count;
}


List<int> numbers = [14, 88, 3, 42, 99, 12, 67]; //-> max: 99, min: 3
List<int> numbers1 = [234, 34, 123, 44, 949, 112, 67]; //-> max: 949, min: 34
int first = numbers[0];
int last = numbers[numbers.length - 1];
// TASK4
// Manual min & max finder

// TASK 5
// Prime Number Checker
// 3 -> prime number
// 6 -> not prime number