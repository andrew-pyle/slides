---
slug: classes
---

# Classes

## Illustration

![Classes Model Real-World Entities: What it is & How it interacts with other entities](/class-illustration.svg)

## Syntax

```cpp
class Name {
  // attributes
  int number_field;
  int sometimes_called_properties;
  int or_fields;
  vector<string> or_attributes;

public:
  // attributes
  int count;

  // functions
  void public_member_function() { cout << "Hello"; }
  int sometimes_called_methods() { return number_field; }
  string longer_body(int count) {
    string out;
    for (int i = 0; i < count; ++i) {
      out += generate_string() + " ";
    }
    return out;
  }

private:
  // Turns back into private again below here
  int another_number;
  string generate_string() { return "Secret"; }
}

```

## Examples

```cpp
class Pokemon {
public:
  // What it is
  int number;
  string name;
  string type;
  string cry;

  // What it does
  void print_cry() { cout << cry << endl; }
  void launch() { cout << "GO! " << name << ". " << cry << endl; }
};

int main() {
    Pokemon bulbasaur;
    bulbasaur.number = 1;
    bulbasaur.name = "Bulbasaur";
    bulbasaur.type = "Grass/Poison";
    bulbasaur.cry = "Bulbaaa";

    bulbasaur.print_cry(); // Bulbaaa
    bulbasaur.launch();    // Go Bulbasaur! Bulbaaa
}
```

## History

C++ was designed to be an enhanced C language, and included classes as one of its core features. [Wikipedia Link](https://en.wikipedia.org/wiki/C++)

## Terminology

### Object

An code entity which encapsulates data and functions together. (What it is & what it does)

### Class

The definition of an object's data & functions. The class is a data type, like `int` or `struct`.

### Public & Private Keywords

- Public data & functions can be accessed outside the class definition.
- Private data & functions can only be accessed within the class definition.

#### Example of `public` & `private` keywords

This Tree class uses a private variable to ensure that the tree's height can only increase by calling the `.grow()` function. This is about the programmer's _intention_, not a technical requirement.

```cpp
class Tree {
  // This attribute is private
  int height_in_meters = 0;

public:
  double grow_rate;

  void grow() { height_in_meters = 2 * (1 + grow_rate); }

  void print() {
    cout << "  ___  " << endl;
    cout << " /   \\ " << endl;
    cout << "|     |" << endl;
    cout << " \\___/ " << endl;
    for (int i = 0; i < height_in_meters; ++i) {
      cout << "   |  " << endl;
    }
    cout << "   |  " << endl;
    cout << "~~~~~~~~" << endl;
  }
};

int main() {
    Tree tree;
    tree.grow_rate = 0.5;

    cout << "Start" << endl;
    tree.print();

    // Tree grows!
    cout << "After Year 1" << endl;
    tree.grow();
    tree.print();

    // Tree grows!
    cout << "After Year 2" << endl;
    tree.grow();
    tree.print();
}
```

### Mutator & Accessor

- A **mutator** is a method which changes the value of a class's data member. A **setter** is a subset of mutator which directly corresponds to a specific data member.
- An **accessor** is a method which returns the value of a class's data member. A **getter** is a subset of accessor which directly corresponds to a specific data member. Often declared `const`.

#### Example of Getter & Setter

This version of Pokemon class has a set of up to four moves. This setter prevents too many from being added, which would not be possible if the `.moves` data member was `public`, since the caller could simply use `.moves.push_back("another")`

```cpp
const int MAX_MOVES = 4;

class Pokemon {

public:
  int number;
  string name;
  string type;
  string cry;

  void print_cry() { cout << cry << endl; }
  void launch() { cout << "GO! " << name << ". " << cry << endl; }

  // New
  // Prevents more than 4 Moves from being added
  void set_move(int position, string move_name) {
    // Ignore invalid positions
    if (position < 0 || position > MAX_MOVES - 1) {
      return;
    }
    moves.at(position) = move_name;
  }

  string get_move(int position) {
    // Ignore invalid positions
    if (position < 0 || position > MAX_MOVES - 1) {
      return "";
    }
    return moves.at(position);
  }

private:
  // New
  vector<string> moves = {};
};
```

### Private Helper Function

A **private helper function** is a class's function which is not accessible outside the class definition (private). It is used within the class by other public or private methods.

### Scope Resolution Operator (`::`)

The **scope resolution operator** distinguishes entities by the location of their definition (library, namespace, class, etc.).

### Inline Member Function

An **inline member function** is a function in a class definition that is within the class declaration.

## Usage

## Example Program: Toward a Pokémon Battle Clone

```cpp

class Pokemon {

public:
  int number;
  string name;
  string type;
  string cry;

  void print_cry() { cout << cry << endl; }
  void launch() { cout << "GO! " << name << ". " << cry << endl; }
};

class PokemonTeam {

public:
  vector<Pokemon> team;

  // Print each Pokemon in the team with a number prefix
  void print() {
    for (int i = 0; i < team.size(); i++) {
      cout << i + 1 << ". " << team.at(i).name << endl;
    }
  }

  Pokemon get_user_pokemon_selection() {
    // Print
    print();

    // Accept input (integer)
    int user_selection;
    cin >> user_selection;

    // Return selection
    Pokemon selected_pokemon = team.at(user_selection - 1);
    return selected_pokemon;
  }
};

int main() {
  PokemonTeam brock;
  brock.team.push_back({1, "bulbasaur", "grass/poison", "bulbaaaaaaaa"}); // 1
  brock.team.push_back({13, "Weedle", "Bug/Poison", "dllllllll"});        // 2
  brock.team.push_back({2, "Ivysaur", "Grass/Poison", "Iiiiivy-saur"});   // 3
  brock.team.push_back({11, "Caterpie", "Bug", "cater-cater"});           // 4
  brock.team.push_back({4, "charmander", "fire", "char-char"});           // 5

  // Show menu & Launch
  Pokemon selected = brock.get_user_pokemon_selection();
  selected.launch();
  // Or
  brock.get_user_pokemon_selection().launch();
}
```
