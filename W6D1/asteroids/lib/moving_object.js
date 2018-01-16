function MovingObject(optionsObject) {
  this.color = optionsObject['color'];
  this.radius = optionsObject['radius'];
  this.pos = optionsObject['pos'];
  this.vel = optionsObject['vel'];
}

MovingObject.prototype.draw = function draw(ctx){
  // document.addEventListener("DOMContentLoaded", function(){
  //   const canvasEl = document.getElementById('canvas');
  //   canvasEl.width = 1000;
  //   canvasEl.height = 800;
  // });
  ctx.fillStyle = this.color;
  ctx.beginPath();
  ctx.arc(
    this.pos[0],
    this.pos[1],
    this.radius,
    0,
    2 * Math.PI,
    false
  );
  ctx.fill();
};


MovingObject.prototype.move = function move(){};


MovingObject.prototype.isCollidedWith = function isCollidedWith(otherMovingObject){};

module.exports = MovingObject;









//
//
// const mo = new MovingObject(
//   { pos: [30, 30], vel: [10, 10], radius: 5, color: "#00FF00"}
// );
//
// console.log(mo);
