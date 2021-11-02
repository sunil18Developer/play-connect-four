<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page import="connect_four.Player" %>
        <%@ page import="connect_four.Settings" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="ISO-8859-1">
                <!-- Bootstrap CSS CDN Link -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
                    crossorigin="anonymous">
                    
                <!-- Bootstrap JS CDN Link -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
                    crossorigin="anonymous"></script>
                <title>Connect Four Game</title>
                <style>
                   /* This will the background color to board of game */
                    table {
                        background-color: royalblue;
                    }

                    /* This will CSS internal class in which we creating 
                       the circle on to each <td>(table data)*/
                    .circle {
                        height: 4rem;
                        width: 4rem;
                        border-radius: 100%;
                        background-color: white;
                    }
                </style>
            </head>

            <body>
                <%  
                 /*
                    Here Player is java class(entity) in which we going to 
                    stores the players informations.
                    Here Settings also another java class which stores the 
                    noColumn,noRow,noPiece.
                    Both classes are POJO class.
                 */
                    Player player1=new Player();
                    Player player2=new Player();
                    player1.setPlayerName(request.getParameter("firstPlayerName"));
                    player1.setNoOfMove(0);
                    player2.setPlayerName(request.getParameter("secondPlayerName"));
                    player2.setNoOfMove(0);
                    Settings s=new Settings();
                    s.setNoOfColumn(Integer.valueOf(request.getParameter("noOfColumn")));
                    s.setNoOfPiece(Integer.valueOf(request.getParameter("noOfPiece")));
                    s.setNoOfRow(Integer.valueOf(request.getParameter("noOfRow")));
                 %>
                   <!--
                       Here in div tag we are using the bootstrap classes
                       like container (collection of row+col(breakpoints)(12)),
                       bg-success (background-color-green),
                       text-center (all text align at center), 
                       text-white (set text color to white), 
                       m,mt,mb (margin,margin-top,margin-bottom).
                       
                       In this row we are going to print or display
                       the players name... 
                    -->
                    <div class="container shadow mt-5 mb-5">
                        <div class="row m-3 text-center">
                            <div class="col-6 bg-success text-white">
                                <h6 class='lead'>Player 1 name is: <%= player1.getPlayerName()%>
                                </h6>
                            </div>
                            <div class="col-6 bg-success text-white">
                                <h6 class='lead'>Player 2 name is: <%= player2.getPlayerName()%>
                                </h6>
                            </div>
                        </div>
                        <!-- In this row we are going to print or display the
                             total no steps going played as well as
                             how many players played until
                         -->
                        <div class="row">
                            <div class="col-6 text-center small">
                                 <p>Total No. steps : <h5 id="totalNoStep"><%=s.getNoOfRow()*s.getNoOfColumn()%></h5></p>
                            </div>
                            <div class="col-6 text-center small">
                                 <p>Total No. steps played by players : <h5 id="totalNoStepPlayed">0</h5></p>
                            </div> 
                        </div>
                        <!--
                            Here we are to display the <table> or board in which 
                            each <td> table data contains a <div> tag with .circle css
                            class as well as we are going to handle the onclick event
                            on <div> tag.
                         -->
                        <div class="row m-1">
                            <div class="col-12">
                                <table align="center" cellpadding="5px" class="shadow">
                                    <% for(int i=0;i<s.getNoOfRow();i++){ out.print("<tr>");
                                        for(int j=0;j<s.getNoOfColumn();j++){
                                        	out.print("<td><div class='circle' onclick='trackPressOfPlayer(this,"+i+","+j+")'></div></td>");
                                        }
                                        out.print("</tr>");
                                        }
                                    %>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- It's dialog tag which is used show while 
                         any player win's.
                         Inside the dialog tag a container is present 
                         which consist the wining player name and two buttons
                         in which 'Home' Button will redirect to home page(index page)
                         and 'Replay' Button will reset the settings(refresh the page).
                    -->
                    <!-- dialog 1 will be popup while player 1 will win -->
                    <dialog id="playerOne">
                        <div class="container shadow bg-white">
                            <div class="row">
                                <div class="col bg-success text-center text-white">
                                    <h4 class='lead'>Congratulation <%= player1.getPlayerName()%> You Win this Game</h4>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-6 bg-white text-center">
                                    <input class="btn btn-primary" onclick="replayGame()" type="button"
                                        value="Replay Game" />
                                </div>
                                <div class="col-6 bg-white text-center">
                                    <a class="btn btn-primary" href="index.jsp" />Home Page</a>
                                </div>
                            </div>
                        </div>
                    </dialog>
                    
                    
                    <!-- dialog 2 will be popup while player 2 will win -->
                    <dialog id="playerTwo">
                        <div class="container shadow bg-white">
                            <div class="row">
                                <div class="col bg-success text-center text-white">
                                    <h4 class='lead'>Congratulation <%= player2.getPlayerName()%> You Win this Game</h4>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-6 bg-white text-center">
                                    <input class="btn btn-primary" onclick="replayGame()" type="button"
                                        value="Replay Game" />
                                </div>
                                <div class="col-6 bg-white text-center">
                                    <a class="btn btn-primary" href="index.jsp" />Home Page</a>
                                </div>
                            </div>
                        </div>
                    </dialog>
                    
                    <!-- dialog 3 will be popup while tie -->
                    <dialog id="tie">
                        <div class="container shadow bg-white">
                            <div class="row">
                                <div class="col bg-success text-center text-white">
                                    <h4 class='lead'>Well Play It's Tie...</h4>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-6 bg-white text-center">
                                    <input class="btn btn-primary" onclick="replayGame()" type="button"
                                        value="Replay Game" />
                                </div>
                                <div class="col-6 bg-white text-center">
                                    <a class="btn btn-primary" href="index.jsp" />Home Page</a>
                                </div>
                            </div>
                        </div>
                    </dialog>
                    
                    <!-- all functionality of connect four game is
                         developed in javascript.   
                     -->
                    <script>
                        /*
                          Initializing row, col, piece, totalStep, playedStep
                          and array is initialized here.
                          (It's global variables so it's scope will be
                                  throughout the program)
                           JSPExpression is used to assign the values.       
                        */
                        var row = <%=s.getNoOfRow() %>;
                        var col = <%=s.getNoOfColumn() %>
                        var piece = <%=s.getNoOfPiece() %>;
                        var totalStep = <%=s.getNoOfColumn() * s.getNoOfRow() %>;
                        var playedStep = 0;
                        var array = [];

                        /*
                          Javascript doesnot supports the multi-diemension
                          array so we suppose to make the multi-dimension
                          array.
                          By using push() and splice methods we are
                          inserting the elements in proper position.
                          We are considering that 0=empty,1=player1move,
                          2=player2move.
                          Initially our array contains only 0 value to
                          each row and column.
                        */
                        for (var i = 0; i < row; i++) {
                            var tempArray = [];
                            for (var j = 0; j < col; j++) {
                                tempArray.push(0);
                            }
                            array.splice(i, j, tempArray);
                        }


                        
                        /*
                          trackPressOfPlayer() is method which invoked while
                          player press <td><div> tag.
                          In trackPressOfPlayer() method we passing the
                          <div> tag instance, row, column.

                          we here checking that playedStep must not be
                          equal to totalStep caused we missed the rules.

                          Then we checking that whether the player press
                          circle is legal or not.

                          If the press or event is accessble or legal
                          then we increseae the playedStep.

                          To display the result we invoked the updatePlayedStep().

                          Now we need to display that the press area played by player
                          so we invoked the changeColor().

                          if press or event is not legal or going it's against the 
                          game rule then it's alert the (message).    
                        */
                        function trackPressOfPlayer(event, row, column) {
                            if (totalStep != playedStep) {
                                if (checkIsClickable(row, column)) {
                                    playedStep += 1;
                                    updatePlayedStep();
                                    changeColor(event, playedStep, row, column);
                                } else {
                                    alert("You can not insert here...");
                                }

                            }
                        }

                          
                          /*
                          The logic is very simple if the row is end then 
                          it's legal or accessable as well as 
                          if the below of row and column is played by 
                          another players then its accessable.

                          if both above condition is not satisfy then 
                          it's event or press(row,col) is not accessable.
                        */
                        function checkIsClickable(tempRow, tempColumn) {
                            var i = tempRow + 1;
                            if (row - 1 == tempRow) {
                                return true;
                            } else if (array[Number(i)][tempColumn] > 0) {
                                return true;
                            } else {
                                return false;
                            }
                        }


                      /*
                        This is updatePlayedStep() method is 
                        responsible for updating the value of 
                        playedStep.
                      */
                      function updatePlayedStep(){
                          var ps = document.getElementById("totalNoStepPlayed");
                          if(totalStep===playedStep){
                              displayResult(3);
                          	ps.innerHTML = playedStep;
                          }else{
                          	ps.innerHTML = playedStep; 
                          } 
                      }


                      /*
                      Now in changeColor() method we passed the 
                      object of div tag, flag, row and column.

                      The logic is here is that if flag%2!=0 then 
                      its 1st player so update array value in 
                      multidimension array.
                      If its step is played
                      by player 1 then change or set background color
                      to its.
                      It's may happend that user will press same div
                      tag so make its onclick = null.

                      In the checkWin() method we are going to check
                      where the playedStep may contains the patterns or
                      not like row, column, diagnoal.
                    */
                    function changeColor(event, flag, row, column) {
                        if (flag % 2 != 0) {
                            array[row][column] = 1;
                            event.style.backgroundColor = 'red';
                            event.onclick = null;
                            checkWin();
                        }
                        if (flag % 2 == 0) {
                            array[row][column] = 2;
                            event.style.backgroundColor = 'yellow';
                            event.onclick = null;
                            checkWin();
                        }
                    }


                    /*
                      Here we trying to matches piece(4) in
                      rows, columns and diagnoals.
                    */
                    function checkWin() {
                        var firstPlayerWin = 0;
                        var secondPlayerWin = 0;
                        var ca=0,cb=1,cc=2;

                        /*
                          Here we rows searching the sequence of piece of
                          player1 or player2.

                          if in array or sequence the gap is present then 
                          count of fistPlayerWin = 0 as well as
                          secondPlayerWin = 0.

                          if in array or sequence we got 'cb'
                          then we increase the firstPlayerWin+1
                          and set secondPlayerWin = 0;caused 
                          to maintain the sequence of player 1.
                          
                          if in array or sequence we got 'cc'
                          then we increase the secondPlayerWin+1
                          and set firstPlayerWin = 0;caused
                          to maintain the sequence of player 2.

                          if piece == firstPlayerWin then player 1 is win
                          so we invoked the displayResult() method with
                          passing the 1. 1 is indicate that 1 is win.
                          
                          if piece == secondPlayerWin then player 2 is win
                          so we invoked the displayResult() method with
                          passing the 2. 2 is indicate that 1 is win.

                          displayResult() is method in which we display
                          the result of winner player.
                        */
                         for (var i = 0; i < row; i++) {
                            for (var j = 0; j < col; j++) {
                                if (array[i][j] == ca) {
                                    firstPlayerWin = 0;
                                    secondPlayerWin = 0;
                                } else
                                    if (array[i][j] == cb) {
                                        firstPlayerWin += 1;
                                        secondPlayerWin = 0;
                                    } else
                                        if (array[i][j] == cc) {
                                            firstPlayerWin = 0;
                                            secondPlayerWin += 1;
                                        }
                                if (firstPlayerWin == piece) {
                                    displayResult(1);
                                }

                                if (secondPlayerWin == piece) {
                                    displayResult(2);
                                }
                            }
                        }

                        firstPlayerWin = 0;
                        secondPlayerWin = 0;      
                        
                        /*
                          Here we finding the sequence of players
                          in columns wise.

                          logic of identifying the sequence and displayResult
                          is same as row wise.
                        */  
                        for (var i = 0; i < col; i++) {
                            for (var j = 0; j < row; j++) {
                                
                                if (array[j][i] == ca) {
                                	firstPlayerWin = 0;
                                    secondPlayerWin = 0;
                                } else
                                    if (array[j][i] == cb) {
                                        firstPlayerWin += 1;
                                        secondPlayerWin = 0;
                                    } else
                                        if (array[j][i] == cc) {
                                            firstPlayerWin = 0;
                                            secondPlayerWin += 1;
                                        }
                                if (firstPlayerWin == piece) {
                                    displayResult(1);
                                }

                                if (secondPlayerWin == piece) {
                                    displayResult(2);
                                }
                            }
                        }



                        firstPlayerWin = 0;
                        secondPlayerWin = 0;
                        
                        var k = 0,i=0,j=0;

                        //rb
                        /*
                          
						  Here we goes in diagnoal like 
						  (j,i)
						  (50)
                          (51)(40)                                                                        
                          (52)(41)(30)                                                                    
                          (53)(42)(31)(20)                                                                
                          (54)(43)(32)(21)(10)                                                            
                          (55)(44)(33)(22)(11)(00)

                          maximum no. of element in diagnoal
                          row is rows so outer loop will 
                          execute six time for each following diagnoal
                          sequence finding.

                          now j value is start from row-1=5 and 
                          here pattern is goes like j is decrease util i
                          is greater than zero.

                          now i value is start with outer loop so
                          it's execute that many time and i value
                          is decreases until its reach to zero.
                          
                        */
                        for(k=0;k<row;k++){
                            for(i=k,j=row-1;i>=0;i--,j--){
                        	 if (array[j][i] == ca) {
                                firstPlayerWin = 0;
                                secondPlayerWin = 0;
                                } else
                                if (array[j][i] == cb) {
                                firstPlayerWin += 1;
                                secondPlayerWin = 0;
                                } else
                                if (array[j][i] == cc) {
                                firstPlayerWin = 0;
                                secondPlayerWin += 1;
                                }
                                if (firstPlayerWin == piece) {
                                displayResult(1);
                                }
                                if (secondPlayerWin == piece) {
                                displayResult(2);
                                }
                             }
                        	 firstPlayerWin=0;
                        	 secondPlayerWin=0;
                          }

                        /*
						  Here we goes in diagnoal like 
						(i,j)  
						(06)                                                                            
                        (16)(05)                                                                        
                        (26)(15)(04)                                                                    
                        (36)(25)(14)(03)                                                                
                        (46)(35)(24)(13)(02)                                                            
                        (56)(45)(34)(23)(12)(01)
                        
                          Here outer loop execute at no. of rows.
                          so j values goes to 1 to 6 and i values
                          goes to 5 to 0.

                          Now i is start with outer loop and i values
                          is going in between 5 to 0 so it's decreases
                          until its comes 0.

                          here j is start with col-1 to get index no.
                          and its decreases until i>=0.                                              
						*/
                            for(k=0;k<row;k++){
                            for(i=k,j=col-1;i>=0;i--,j--){
                        	  if (array[i][j] == ca) {
                                firstPlayerWin = 0;
                                secondPlayerWin = 0;
                                } else
                                if (array[i][j] == cb) {
                                firstPlayerWin += 1;
                                secondPlayerWin = 0;
                                } else
                                if (array[i][j] == cc) {
                                firstPlayerWin = 0;
                                secondPlayerWin += 1;
                                }
                                if (firstPlayerWin == piece) {
                                displayResult(1);
                                }
                                if (secondPlayerWin == piece) {
                                displayResult(2);
                                }
                             }
                        	 firstPlayerWin=0;
                        	 secondPlayerWin=0;
                          }

                          //lB
                          /*
							Here is diagnoal. 
							  (00)
                              (01)(10)                                                                        
                              (02)(11)(20)                                                                    
                              (03)(12)(21)(30)                                                                
                              (04)(13)(22)(31)(40)                                                            
                              (05)(14)(23)(32)(41)(50)
                              
                              Here i will execute to get no. of elements
                              is each row and here i decreases until its
                              comes to 0.

                              j values here simply increases until
                              i>=0.
							*/ 
                            for(k=0;k<row;k++){
                                for(i=k,j=0;i>=0;i--,j++){
                              	 if (array[j][i] == ca) {
                                    firstPlayerWin = 0;
                                    secondPlayerWin = 0;
                                    } else
                                    if (array[j][i] == cb) {
                                    firstPlayerWin += 1;
                                    secondPlayerWin = 0;
                                    } else
                                    if (array[j][i] == cc) {
                                    firstPlayerWin = 0;
                                    secondPlayerWin += 1;
                                    }
                                    if (firstPlayerWin == piece) {
                                    displayResult(1);
                                    }
                                    if (secondPlayerWin == piece) {
                                    displayResult(2);
                                    }
                                 }
                            	 firstPlayerWin=0;
                            	 secondPlayerWin=0;
                              }

							  /*
							    (06)(15)(24)(33)(42)(51)                                                        
                                (16)(25)(34)(43)(52)                                                            
                                (26)(35)(44)(53)                                                                
                                (36)(45)(54)                                                                    
                                (46)(55)                                                                        
                                (56)
                                
                                here we go for right top to left bottom
                                diagnoally.

                                here j is acts like row.
                                so j values goes to 0 to 5 maximum and
                                its equals to no. of row so its
                                increases until its reach 5.
                                that why inner loop executes 6 times.

                                here i is acts like columns
                                so it's start with col-1 to get index
                                and it's decreases until i reaches to
                                5.                                                                            
							  */
                                for(k=0;k<row;k++){
                                for(i=col-1,j=k;j<=row-1;i--,j++){
                            	  if (array[j][i] == ca) {
                                    firstPlayerWin = 0;
                                    secondPlayerWin = 0;
                                    } else
                                    if (array[j][i] == cb) {
                                    firstPlayerWin += 1;
                                    secondPlayerWin = 0;
                                    } else
                                    if (array[j][i] == cc) {
                                    firstPlayerWin = 0;
                                    secondPlayerWin += 1;
                                    }
                                    if (firstPlayerWin == piece) {
                                    displayResult(1);
                                    }
                                    if (secondPlayerWin == piece) {
                                    displayResult(2);
                                    }
                                 }
                            	 firstPlayerWin=0;
                            	 secondPlayerWin=0;
                              }  
                        
                      }
                    

                    /*
                      displayResult(playerNumber)
                      while get the perfect sequence then 
                      this method is executed.
                      In this function we have 1 parameter in which
                      we can decides which player is win,
                      so we display the modal to popup of either player 1
                      or player 2.
                    */
                    function displayResult(playerNumber) {
                        if (playerNumber == 1) {
                            document.getElementById("playerOne").showModal();
                        }
                        if (playerNumber == 2) {
                            document.getElementById("playerTwo").showModal();
                        }
                        if (playerNumber == 3){
                            document.getElementById("tie").showModal();
                        }
                    }

                    /*
                      As we know that js execute at the client-side
                      so can easily get the initial setting by refresh or
                      reload page.

                      Here all the information is store in request
                      object so we easily re-access it.
                    */
                    function replayGame() {
                        window.location.reload();
                    }
                        
            </script>
            </body>

            </html>