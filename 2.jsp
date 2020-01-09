<!-- player -->
actionStatus: 'down' <!-- ['down', 'upper', 'other'] -->
speed: 10
upperMaxLen: 70
upperLen: 0

update(){
    if(this.actionStatus === 'down'){
        if(!this._checkBoard()){
            this.node.y -= this.speed;
        }
    }else if(this.actionStatus === 'upper'){
        if(this.upperLen >= this.upperMaxLen){
            this.actionStatus = 'down';
            this.upperLen = 0;
            return
        }
        this.node.y += this.speed
        this.upperLen += this.speed
    }else{
        this.actionStatus = 'down'
    }
}

_checkBoard(){
    var flag = false;
    balls.map((res)=>{
        if(Math.abs(res.node.y - this.node.y) <= 5 && res.node.x - res.node.width / 2 <= this.node.x && this.node.x <= res.node.x + res.node.width / 2 ){
            this.actionStatus = 'upper';
            flag = true;
            return;
        }
    });
    return flag;
}
