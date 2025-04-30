---
slug: quizzy
title: Quizzy Grading
---

# Quizzy Code Guidelines

## Descriptive Variable Names

Variable names should describe their purpose.

### Bad

```cpp
// ❌ Why do we need this number?
int num;
cin >> num;
```

### Good

```cpp
// ✅ Oh, it's the user's selection.
int user_input;
cin >> user_input;
```

## Function Names are Comprised of a Noun & Verb

It is easy to understand what a function is for if we use the format: `NounVerb()`. We will know what action is performed, and what entity is involved.

### Bad

```cpp
// ❌ Does this add or update the option?
class Question {
public:
    void QuestionOption(string option) { ... }
};

// ❌ What does it add? Maybe the argument?
class Question {
public:
    void Add(string option) { ... }
};
```

### Good

```cpp
class Question {
public:
    // ✅ Adds the option
    void AddOption(string option) { ... }
};
```

## Functions are used where appropriate

Functions can group a "feature" of your program into a single line.

Readers of your code will find it easier to read `AcceptUserInput()` than 15 lines of code which accept the user's input.

### Bad

```cpp
int main() {
    // ❌ Where does this "feature" end?
    ifstream fin;
    fin.open(filename);

    if (!fin.is_open()) {
        exit(1);
    }

    string line;
    vector<string> quizzes;
    // ...

    // Use quiz list data
}
```

### Good

```cpp
int main() {
    // ✅ I see. This line reads a quiz list.
    vector<string> quizzes = ReadQuizlist("quizlist.txt");

    // Use quiz list data
}
```

## Functions are appropriate length

It should be possible to read the body of a function without scrolling up and down. (No example)

The function should have only **one purpose**, which the function name describes.

### Bad

```cpp
// ❌ More than one job
bool IsCorrectAnswer(string answer_text) {
    bool is_correct_answer = answer_text == "Hello";

    // ❌ Also adds the Option if it is correct
    if (is_correct_answer) {
        AddOption(answer_text, true);
    }

    return is_correct_answer;
}

int main() {
    string answer_text = "...";
    IsCorrectAnswer(answer_text); // ❌ Two jobs done at once
}
```

### Good

```cpp
// ✅ Function has one job.
bool IsCorrectAnswer(string answer_text) {
    return answer_text == "Hello";
}

int main() {
    string answer_text = "...";
    bool is_correct = IsCorrectAnswer(answer_text)

    // ✅ Adding the Option is done separately
    if (is_correct) {
        AddOption(answer_text, true);
    }
}
```

## Whitespace & indentation is consistent

Whether it is 4 spaces, 2 spaces, or 1 tab, use the same level of indentation from the left for each level.

Surround operators with the customary amount of whitespace.

### Bad

```cpp
// ❌ Space is absent around operator<
if (user_input<quizzes.size()) {
    cout << "Invalid" << endl; // ❌ 4 spaces
 return -1;                    // ❌ 1 space
                               // ❌ Empty line
}
```

### Good

```cpp
// ✅ Consistent indentation & conventional use of whitespace
if (user_input < quizzes.size()) {
    cout << "Invalid" << endl;
    return -1;
}
```
