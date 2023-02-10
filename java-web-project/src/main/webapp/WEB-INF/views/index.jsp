<!-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> -->
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
    integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
    crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
    integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
    crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>


<body>
    <br><br>
    <div class="row align-items-center">
        <div class="col">
        </div>
        <div class="col-5">
            <div class="card" style="width: 100%;">
                <div class="card-body">
                    <h5 class="card-title">Login Page</h5>
                    <div class="container">
                        <form action="/" method="POST">
                        </form>
                        <div class="row">
                            <div class="col-4 ">
                                <label class="mx-auto">
                                    User ID
                                </label>
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" id="userID" name="userID"
                                    aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                <label style="color:red" id="userError"></label>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-4">
                                Password
                            </div>
                            <div class="col-8">
                                <input type="text" class="form-control" id="password" name="password"
                                    aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                                <label style="color:red" id="passwordError"></label>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-4">
                            </div>
                            <div class="col-8">
                                <input class="btn btn-primary" id="login" type="submit" value="Login">
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div class="col">
        </div>

    </div>

</body>
<script>


    $(document).ready(function () {
        $('#userID').attr('required', 'required');
        $('#password').attr('required', 'required');
        $("#login").click(function (e) {
            e.preventDefault();
            let username = '${username}' == $("#userID")[0].value;
            let password = '${password}' == $("#password")[0].value;

            console.log("username :" + username);
            console.log("password :" + password);
            if (username && password) {
                $("#userError").empty();
                $("#passwordError").empty();
                $("form").submit();
               
            } else {
                $("#userError").empty();
                $("#passwordError").empty();

                $("#userError").append(username ? '' : 'Invalid Username');
                $("#passwordError").append(password ? '' : 'Invalid Password');
            }


        });
    });



</script>


</html>