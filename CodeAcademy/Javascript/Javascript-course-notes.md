# Javascript course notes

### Introduction to JavaScript

```javascript
// single line comment
/* 
multi line comment
*/
console.log(/*IGNORED!*/ 5); //multi-line used to comment in the middle of code
console.log(); // prints to console.
```
[**`Math` module spec**](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math)
[**string methods**](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/prototype)

- JavaScript uses `console.log();` to print statements to the console screen. `console` reffers to a predefined object which holds all manner of console information and procedures.
- Syntactically, sometimes javascript requires a `;` at the end of a statement, somtimes not. It's a good habit to always include it though.

##### Java data types

- **Number:** a floar or int (in js it's one type)
- **String:** synt. `""` or `''`
- **Boolean:** synt. `true` or `false` 
- **Null:** The intentional absence of a value. synt. `null`
- **Undefined:** Represents the absence of a value. synt. `undefined`
- **Symbol**
- **Object:** Collections of related data.

##### Variables

```javascript
var myVar;
let myVar;
const myCons;
//or
var myVar = 'can be assigned like this';
myvar = "or assigned like this after it's been initialized"

`not regular string syntax but you can use for ${myVar}.` 
// outputs string with myvar subbed in

typeof arg //returns variable type for arg

++ //increment operator
```


- Declare variables with `var`, `let` or `const`.
- Variable naming convention is `camelCasing`.
- `var` is the pre 2015 keyword for defining all variables.
- the `let` keyword **implies the variable can change**. 
- **constants must be assigned values at initialization, and cannot be changed**

### Conditionals

##### Syntax
```javascript
if (true) {
  console.log('This message will print!'); 
} 
```
```javascript
if (false) {
  console.log('The code in this block will not run.');
} else if (true) {
  console.log('But the code in this block will!');
} else {
  console.log('Who cares about me');
}
```
```javascript
conditionOne ? trueSituation : falseSituation;
```
NOTE: The conventional comparison operator, `==` is `===` in javascript... what...?
operators:
```
=== !
&&  ||
```

##### Truthy and Falsey
Truthy and Falsey are properties of different types of objects, which make them equate to True or False when used as a condition, without any other conditionals. Most objects are Truthy, meaning they exist, effectively. Non-truthy objects in JS are:

- `0`
- Empty strings
- `null` 
- `undefined`
- `NaN`

##### `||` operator with *truthy* and *falsey* objects

The following expression
```javascript
let defaultName = username || 'Stranger';
```
will equate to `username` if one exists, and `'Stranger'` if it doesn't. This is because it will return the left first if it's truthy, otherwise it returns the right. This makes me think that this is how the `||` operator works for all evaluations. If the first statement isn't true, return the second statement. This would work for logic because if the first statement isn't true, the second statement will determine whether the whole thing is true or not. So the or operator literally just returns the second object if the first isn't true or truthy.

##### `switch`
```javascript
switch (ourThing) {
  case 'a':
    console.log('it\'s a!');
    break;
  case 'b':
    console.log('it\'s b!');
    break;
  default:
    console.log('Invalid case');
    break;
}
```
