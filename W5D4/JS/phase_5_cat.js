function Cat(name, owner) {
  this.name = name;
  this.owner = owner;
}

// Cat.prototype.cuteStatement = function () {
//   console.log(`${this.owner} loves ${this.name}`);
//   return `${this.owner} loves ${this.name}`;
// };

Cat.prototype.cuteStatement = function () {
  console.log(`Everyone loves ${this.name}`);
  return `Everyone loves ${this.name}`;
};

shasha = new Cat('shasha', 'Lu');
night = new Cat('yeyi', 'Lu');
shasha.cuteStatement();
night.cuteStatement();

Cat.prototype.meow = function () {
  console.log('Meow!');
};

shasha.meow = function () {
  console.log('Meow~meow~meow~');
}

shasha.meow();
night.meow();
