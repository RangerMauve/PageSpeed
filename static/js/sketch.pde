class Blob {
	PVector position = new PVector();
	PVector velocity = new PVector();
	float radius = 16;
	color shade = #FF0000;
	float speed = 2;
	Blob(){
		this.position.set(
			random(this.radius,width-this.radius),
			random(this.radius,height-this.radius)
		);
		this.velocity.set(
			random(-1,1),
			random(-1,1)
		);
		this.velocity.mult(this.speed);
		this.shade = color(random(200,256),0,random(64,256));
	}
}
ArrayList blobs = new ArrayList();
int numBlobs = 32;
void setup(){
	size(512,256);
	background(255);
	for(int i = numBlobs; i > 0; i--)
		blobs.add(new Blob());
}

void draw(){
	noStroke();
	fill(255,255,255,12);
	rect(0,0,width,height);
	stroke(255,0,32);
	strokeWeight(32);
	if(pmouseX > 0 && pmouseY > 0)
		line(pmouseX,pmouseY,mouseX,mouseY);
	noStroke();
	for(Blob b : blobs){
		fill(b.shade);
		ellipse(b.position.x,b.position.y,b.radius,b.radius);
		b.position.add(b.velocity);
		if(b.position.x < b.radius){
			b.velocity.x *= -1;
			b.position.x = b.radius;
		}
		if(b.position.x > width-b.radius){
			b.velocity.x *= -1;
			b.position.x = width-b.radius;
		}
		if(b.position.y < b.radius){
			b.velocity.y *= -1;
			b.position.y = b.radius;
		}
		if(b.position.y > height-b.radius){
			b.velocity.y *= -1;
			b.position.y = height-b.radius;
		}
	}
}