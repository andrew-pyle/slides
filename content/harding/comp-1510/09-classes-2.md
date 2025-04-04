---
slug: classes-2
title: More Classes
weight: 8
---

## Definitions

### Inline Member Function

An **inline member function** is a function in a class definition that is within the class declaration.

### Scope Resolution Operator `::`

The **scope resolution operator** distinguishes entities by the location of their definition (library, namespace, class, etc.).

### Method Declaration

A method's **declaration** is the function's signature. It "declares" to the compiler that the method exists, allowing the code to be compiled. But a definition is required to use a method.

It is not an error to include multiple copies of a method's declaration may be included in a C++ project.

```cpp
class Square {
public:
  double area() const; // Declaration
};
```

### Method Definition

A method's **definition** is the implementation of a function. The definition can be attached to a declaration, or not. Only one definition of a method may exist.

Including multiple definitions of a method is an error.

```cpp
#include "Square.h"

double Square::area() const { return base * height; }; // Definition
```

```cpp
class Square {
public:
  double area() const { return base * height; }; // Declaration + Definition
};
```

## Separate Files for Header & Implementation

For a class, we can separate the **header** file from the implementation. Conventionally, each class will have one header file and one implementation file. Separating the header from the implementation is conventional for C++ code.

- `Class.h` — header file contains method **declarations**.
- `Class.cpp` — implementation file contains method **definitions**.

## Exercise: Working with Another Programmer

Let's simulate a team context. You are a member of a programming team. You have received a header file from the project's software architect. The software must adhere to this design.

Given the following header file, write a `main.cpp` which will output the area of a `Triangle` object. You will need to implement the class methods in a `RightTriangle.cpp` file.

`RightTriangle.h`

```cpp
class RightTriangle {
public:
  // Getters
  double get_base() const;
  double get_height() const;

  // Setters
  void set_base(double length);
  void set_height(double length);

  // Calculation Accessor
  double area() const;

private:
  double height;
  double base;
};
```

`main.cpp`

```cpp
int main() {
  // Create a Triangle object
  // Output its area
}
```

`RightTriangle.cpp`

```cpp
// Implement the Triangle class's methods
```

## Example: Separating a Class into a header and Implementation Files

Let's separate the following program into 3 files:

- `main.cpp`
- `Pokemon.h`
- `Pokemon.cpp`

### Entire Program

```cpp
#include <iomanip>
#include <iostream>
#include <sstream>
using namespace std;

class Pokemon {
public:
  string get_name() const { return name; }
  string get_type() const { return type; }
  double get_attack() const { return attack; }
  double get_defense() const { return defense; }

  void set_name(string n) { name = n; }
  void set_type(string t) { type = t; }
  void set_attack(double value) { attack = value; }
  void set_defense(double value) { defense = value; }

  string format() const {
    ostringstream buffer;
    buffer << setw(9) << "Pokemon: " << name << "\n"
           << setw(9) << "Type: " << type << "\n"
           << setw(9) << "Attack: " << attack << "\n"
           << setw(9) << "Defense: " << defense << "\n";

    return buffer.str();
  }

private:
  string name;
  string type;
  double attack;
  double defense;
};

int main() {
  Pokemon bulbasaur;

  bulbasaur.set_name("Bulbasaur");
  bulbasaur.set_type("Grass/Poison");
  bulbasaur.set_attack(15);
  bulbasaur.set_defense(20);

  cout << bulbasaur.format();
}
```

### Separated Into Files

This file will include the `Pokemon.h` header file and use the `Pokemon` class. Here we create a `Pokemon` object, set its properties, and output it to `cout`.

#### main.cpp

```cpp
// What #includes will we need?

using namespace std;

int main() {
  // Declare a Pokemon object
  // Assign its Fields
  // Output it with the format method
}
```

#### Pokemon.h

This file will have the class's data members and only **declarations** of the class methods. Here we simply have some getters, setters, and a format method.

```cpp
// What #includes will we need?

using namespace std;

class Pokemon {
  // TODO
};
```

#### Pokemon.cpp

This file will contain the class's method **definitions**, or implementations. Here we define the getters, setters, and the format method.

```cpp
// What #includes will we need?

using namespace std;

// TODO: Define the Class's Methods
```

## Exercise: Using a Constructor to Set Private Fields

If a programmer wants the users of a class to manipulate the value of a class field, she can simply make that field `public`.

On the other hand, if a programmer does not want the users of a class to manipulate the value of a class field, she would make that field `private`.

However, a programmer may wish for a user to set the value of a class field, but not make arbitrary changes. **In this situation, neither `public` nor `private` is sufficient.**

To allow the desired behavior, a programmer may provide a **constructor** which sets an object's private fields without exposing the field as `public`

Let's set the fields of a `Triangle` class with a constructor.

```cpp
class Triangle {
public:
  Triangle(double b, double h) {
    base = b;
    height = h;
  }
  double get_base() { return base; }
  double get_height() { return height; }

  // ❗️ Notice
  // We do not need setters since the fields
  // are set in the constructor

private:
  double base;
  double height;
};

int main() {
  Triangle t = Triangle(1, 2);

  // The fields are not public...
  cout << t.base; // ❌ Error: base is private
  t.height = 1;   // ❌ Error: height is private

  // ...but they contain the values provided to the constructor
  cout << t.get_base();   // outputs: 1
  cout << t.get_height(); // outputs: 2
}
```
