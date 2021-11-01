<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta Id="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Here i'm using the bootstrap 5.1 version -->
    <!-- Bootstrap CSS CDN link -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!-- Bootstrap JS CDN link -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <title>Connect Four Game</title>
    <style>
        input[type="text"],input[type="number"],input[type="submit"]{
            margin: 1rem;
        }
    </style>
    <script>
        /*
        This is javascript function in which we are validating that 
        whether the player must be enter the player1 and player2 names
        and its invoked while we submit the form.
        */
        function validate(){
            if(document.getElementById("firstPlayerId").value == ""){
                alert("Enter the first player name");
                return false;
            }
            if(document.getElementById("secondPlayerId").value == ""){
                alert("Enter the second player name");
                return false;
            }
        }
    </script>
</head>

<body>
    <div class="container shadow mt-5 mb-5">
        <div class="row">
            <div class="text-center m-1">
                <h1 class="">Wel-come to <span class="text-success">Connect-Four-Game</span></h1>
            </div>
            <div class="text-center">
                <form action="game.jsp" method="POST" onsubmit="return validate()">

                    <table align="center">
                        <tr>
                            <td>
                                Enter the 1st player name:
                            </td>
                            <td>
                                <input type="text" name="firstPlayerName" id="firstPlayerId" placeholder="Enter the 1st player name" >
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Enter the 2nd player name:
                            </td>
                            <td>
                                <input type="text" name="secondPlayerName" id="secondPlayerId" placeholder="Enter the 2nd player name" >
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Enter the no. of rows:
                            </td>
                            <td>
                                <input type="number" value="6" name="noOfRow" id="noOfRow" readonly/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Enter the no. of columns:
                            </td>
                            <td>
                                <input type="number" value="7" name="noOfColumn" id="noOfColumn" readonly/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Enter the no. of piece's:
                            </td>
                            <td>
                                <input type="number" value="4" name="noOfPiece" id="noOfPiece" readonly/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input class="btn btn-success" type="submit" value="Start Game" />
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
</body>

</html>