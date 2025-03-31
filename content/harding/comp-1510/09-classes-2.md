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

### Exercise: Working with Another Programmer

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
