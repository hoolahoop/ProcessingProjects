function Food(){
	this.x = 0;
	this.y = 0;

	this.pickLocation = function(){
		var cols = floor(width/scl);
		var rows = floor(height/scl);
		this.x = floor(random(cols)) * scl;
		this.y = floor(random(rows)) * scl;
	}
}