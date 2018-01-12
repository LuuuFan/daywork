function Student(f_name, l_name) {
  this.f_name = f_name;
  this.l_name = l_name;
  this.courses = [];
}

Student.prototype.name = function () {
  return `${this.f_name} ${this.l_name}`;
};

Student.prototype.enroll = function (course) {
  if (!this.courses.includes(course)) {
    this.courses.push(course);
    if (!course.students.includes(this)) {
      course.addStudent(this);
    }
  } else {
    console.log(`You already enrolled ${course.name}`)
  }
};

Student.prototype.courseLoad = function () {
  let hash = {};
  // console.log(hash.typeOf)
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// WRONG WRONG WRONG WRONG WRONG WRONG WRONG WRONG WRONG WRONG WRONG
  // this.courses.forEach( x => hash[x.dept] = x.credit);
// WRONG WRONG WRONG WRONG WRONG WRONG WRONG WRONG WRONG WRONG WRONG
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  //console.log(x.credit));
  // console.log(hash);
  this.courses.forEach( x => {
    hash[x.dept] = hash[x.dept] || 0;
    hash[x.dept] += x.credit;
  });

  return hash;
};

function Course(name, dept, credit) {
  this.name = name;
  this.dept = dept;
  this.credit = credit;
  this.students = [];
}

Course.prototype.addStudent = function (student) {
  if (!this.students.includes(student)) {
    this.students.push(student);
    if (!student.courses.includes(this)) {
      student.enroll(this);
    }
  } else {
    console.log(`${student.name} is already enrolled`)
  }
};

Student.prototype.hasConflict = function () {
};

// const lu = new Student('Lu', 'Fan');
// const ruby = new Course('Ruby', 'OOP', 10);
// lu.enroll(ruby);
// lu.courseLoad();
// console.log(lu.courseLoad().OOP);

let student1 = new Student("Nigel", "Leffler");
let course1 = new Course("101", "CS", 3, ["mon", "wed", "fri"], 1);
let course2 = new Course("201", "CS", 3, ["wed"], 1);
let course3 = new Course("301", "ENG", 3, ["tue"], 1);
let course4 = new Course("401", "BIO", 3, ["mon", "wed", "fri"], 2);
console.log(student1.name());
student1.enroll(course1);
student1.enroll(course3);
student1.enroll(course2);
console.log(student1.courseLoad());
// console.log('should be true = ' + course1.conflictsWith(course2));
// console.log('should be false = ' + course1.conflictsWith(course3));
// console.log('should be false = ' + course1.conflictsWith(course4));
