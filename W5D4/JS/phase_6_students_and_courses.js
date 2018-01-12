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
  this.courses.forEach( x => hash[x.dept] = x.credit);
// WRONG WRONG WRONG WRONG WRONG WRONG WRONG WRONG WRONG WRONG WRONG
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  //console.log(x.credit));
  // console.log(hash);
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

const lu = new Student('Lu', 'Fan');
const ruby = new Course('Ruby', 'OOP', 10);
lu.enroll(ruby);
lu.courseLoad();
// console.log(lu.courseLoad().OOP);
