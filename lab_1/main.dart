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

// TASK3
// Vowel Counter in a String -> "flutter mobile development" -> 8

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