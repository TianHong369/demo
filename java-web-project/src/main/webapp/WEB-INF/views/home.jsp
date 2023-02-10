<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
      <h2>Today is ${user}
      </h2>
      <div class="row align-items-center">
        <div class="col">
        </div>
        <div class="col-5">
          <table class="table table-bordered border-info">
            <thead>
              <tr>
                <c:forEach var="item" items="${tittleList}">
                  <th scope="col">
                    <c:out value="${item}" />
                  </th>
                  <!-- <th scope="col">Student ID</th>
                        <th scope="col">Marks</th>
                        
                        <th scope="col">Pass %</th> -->
                </c:forEach>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="item" items="${studentList}" varStatus="status">
                <tr>
                  <c:if test="${status.count == 1 || status.count == 6}">
                    <td scope="row" rowspan="4">
                      <c:out value="${item.department}" />
                    </td>
                  </c:if>
                  <c:if test="${status.count == 5 }">
                    <td scope="row">
                      <c:out value="${item.department}" />
                    </td>
                  </c:if>

                  <td><a href="" data-bs-toggle="modal" class="name" data-bs-target="#exampleModal">
                      <c:out value="${item.studentID}" />
                  </td>
                  <td>
                    <c:out value="${item.marks}" />
                  </td>

                  <c:if test="${status.count == 6 || status.count == 1}">
                    <td scope="row" rowspan="4">
                      <c:out value="${item.pass}" />
                    </td>
                  </c:if>
                  <c:if test="${status.count == 5}">
                    <td scope="row">
                      <c:out value="${item.pass}" />
                    </td>
                  </c:if>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
        <div class="col">
        </div>
      </div>
      <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Student Details</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="body">

            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
          </div>
        </div>
      </div>
     
    </body>
    <script>
      // $(document).ready(function () {
        $(".name").click(function (e) {
          e.preventDefault();

          $("#body").empty();
          $("#body").append(e.target.innerHTML);

        });
      // });


    </script>
    </html>

  