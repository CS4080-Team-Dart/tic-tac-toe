import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int gameCount = 0;
  String playerSymbol = "X";
  Text bannerText = Text("Connect 3",
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),);
  bool gameOver = false;
  List<List<String>> boardState = [
    ["-","-","-"],
    ["-","-","-"],
    ["-","-","-"]
  ];
  int turnsOccurred = 0;
  List<List> moves = [];
  String gameOverText = "";
  Color gameOverTextColor = Colors.red[200];
  Icon floatingActionIcon = Icon(Icons.play_arrow);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.teal[200],
            height: MediaQuery.of(context).size.height/7,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 30, 5, 0),
              child: Card(
                elevation: 5,
                color: Colors.teal[100],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    bannerText,
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.teal[200],
              height: MediaQuery.of(context).size.height/1.5,
              child: GridView.count(
                primary: false,
                padding: EdgeInsets.all(10),
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                crossAxisCount: 3,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      if(boardState[0][0] == "-" && !gameOver && gameCount > 0)
                        setGamePiece(0,0);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      child: boardState[0][0] == "-" ? Center() : Center(child: Text(boardState[0][0],
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                        ),
                      ),
                      color: Colors.teal[500],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if(boardState[0][1] == "-" && !gameOver && gameCount > 0)
                        setGamePiece(1,0);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      child: boardState[0][1] == "-" ? Center() : Center(child: Text(boardState[0][1],
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      ),
                      ),
                      color: Colors.teal[500],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if(boardState[0][2] == "-" && !gameOver && gameCount > 0)
                        setGamePiece(2,0);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      child: boardState[0][2] == "-" ? Center() : Center(child: Text(boardState[0][2],
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      ),
                      ),
                      color: Colors.teal[500],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if(boardState[1][0] == "-" && !gameOver && gameCount > 0)
                        setGamePiece(0,1);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      child: boardState[1][0] == "-" ? Center() : Center(child: Text(boardState[1][0],
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                        ),
                      ),
                      color: Colors.teal[500],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if(boardState[1][1] == "-" && !gameOver && gameCount > 0)
                        setGamePiece(1,1);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      child: boardState[1][1] == "-" ? Center() : Center(child: Text(boardState[1][1],
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      ),
                      ),
                      color: Colors.teal[500],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if(boardState[1][2] == "-" && !gameOver && gameCount > 0)
                        setGamePiece(2,1);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      child: boardState[1][2] == "-" ? Center() : Center(child: Text(boardState[1][2],
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      ),
                      ),
                      color: Colors.teal[500],
                    ),
                  ),GestureDetector(
                    onTap: () {
                      if(boardState[2][0] == "-" && !gameOver && gameCount > 0)
                        setGamePiece(0,2);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      child: boardState[2][0] == "-" ? Center() : Center(child: Text(boardState[2][0],
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      ),
                      ),
                      color: Colors.teal[500],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if(boardState[2][1] == "-" && !gameOver && gameCount > 0)
                        setGamePiece(1,2);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      child: boardState[2][1] == "-" ? Center() : Center(child: Text(boardState[2][1],
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      ),
                      ),
                      color: Colors.teal[500],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if(boardState[2][2] == "-" && !gameOver && gameCount > 0)
                        setGamePiece(2,2);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      child: boardState[2][2] == "-" ? Center() : Center(child: Text(boardState[2][2],
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      ),
                      ),
                      color: Colors.teal[500],
                    ),
                  ),
                ],
              ),
            ),
          ),
          !gameOver ? Row() : Container(
            color: Colors.teal[200],
            height: MediaQuery.of(context).size.height/3,
            child: Center(
              child: Text(gameOverText, style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: gameOverTextColor,)),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: Colors.teal[500],
        tooltip: 'Increment',
        child: floatingActionIcon,
        onPressed: _startGame,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _startGame() {
    boardState.clear();
    moves.clear();
    setState(() {
      gameOverTextColor = Colors.red[200];
      gameCount++;
      floatingActionIcon = Icon(Icons.cached);
      turnsOccurred = 0;
      gameOver = false;
      playerSymbol = "X";
      bannerText = Text(
          "Player 1's Turn",
          style: TextStyle(
            color: Colors.red[300],
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
      );
      boardState =  [
        ["-","-","-"],
        ["-","-","-"],
        ["-","-","-"]
      ];
      turnsOccurred = 0;
    });
  }

  void setGamePiece(int x, int y) {

    Color color = Colors.red[300];
    String text = "Player 1";

    if(turnsOccurred%2 == 0) {
      playerSymbol = "X";
      text = "Player 2";
      color = Colors.blue[300];
    }
    else
      playerSymbol = "O";

    boardState[y][x] = playerSymbol;
    setState(() {
      turnsOccurred++;
      moves.add([x,y,playerSymbol]);
    });
    bannerText = Text(
      text+"'s Turn",
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );

    checkForGameEnd();
    print(boardState);
  }

  void checkForGameEnd() {
    int lineOrientationFlag = -1; //0:row, 1:col, 2:diag
    int lineIndex = -1;
    String row = "";
    String col = "";
    for(int i = 0; i < 3;i++) {
        row = boardState[i][0]+boardState[i][1]+boardState[i][2];
        col = boardState[0][i]+boardState[1][i]+boardState[2][i];
      if(row.contains("XXX") || row.contains("OOO")){
        lineOrientationFlag = 0;
        lineIndex = i;
      }
      else if(col.contains("XXX") || col.contains("OOO")){
        lineOrientationFlag = 1;
        lineIndex = i;
      }
    }
    if(lineOrientationFlag < 0) {
      if((boardState[0][0]+boardState[1][1]+boardState[2][2]).contains("XXX") || (boardState[0][0]+boardState[1][1]+boardState[2][2]).contains("OOO")){
        lineOrientationFlag = 2;
        lineIndex = 0;
      }
      else if((boardState[2][0]+boardState[1][1]+boardState[0][2]).contains("XXX") ||
          (boardState[2][0]+boardState[1][1]+boardState[0][2]).contains("OOO")){
        lineOrientationFlag = 2;
        lineIndex = 0;
      }
    }

    if(lineOrientationFlag > -1) {
      String winner = "";
      Color textColor = Colors.red[300];
      if(lineOrientationFlag == 0) {
        if(boardState[lineIndex][0] == "X")
          winner = "Player 1";
        else {
          winner = "Player 2";
          textColor = Colors.blue[400];
        }
      }
      else if(lineOrientationFlag == 1) {
        if(boardState[0][lineIndex] == "X")
          winner = "Player 1";
        else{
          winner = "Player 2";
          textColor = Colors.blue[400];
        }
      }
      else if(lineOrientationFlag == 2) {
        if(boardState[1][1] == "X")
          winner = "Player 1";
        else{
          winner = "Player 2";
          textColor = Colors.blue[400];
        }
      }
      setState(() {
        gameOver = true;
        gameOverText = winner+" wins!";
        gameOverTextColor = textColor;
        bannerText = Text(
          "Game Over",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        );
      });
    }
  }
}
