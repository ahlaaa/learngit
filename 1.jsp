<!-- game -->
ball: Node
board: prefab
status: Boolean
maxBoard: 10
balls: []

onload(){
    initBall();
    initBoard();
    setStart();
}

initBall(){
    var ball = this.ball;
    this.ball.node.setPosition(cc.v2(0, 0));
}

initBoard(){
    for(var i=0; i<this.maxBoard; i++){
        pos = cc.v2(0, 0);
        var board = this.generateBoard(pos);
        this.boards.push(board);
    }
}

generateBoard(pos: cc.v2){
    var board = cc.instantiate(this.board);
    board.node.setPosition(pos);
    board.node.parent = this.node;
    return board;
}
