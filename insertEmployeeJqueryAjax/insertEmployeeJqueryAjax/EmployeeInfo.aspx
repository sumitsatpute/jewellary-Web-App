<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeInfo.aspx.cs" Inherits="insertEmployeeJqueryAjax.EmployeeInfo" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Employee Info</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="employee.js"></script>


    <script>



        $(document).on('click', '.editButton', function (e) {
            var text = $(this).attr('value');
            alert(text);
            getEmployeeById();
        });


        $(document).ready(function () {

            getAllEmployees();
        });



        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
                return false;

            return true;
        }

 
        function getEmployeeById()
        {
            var iId = 2;
            $.post("EmployeeService.asmx/GetSingleEmployees", { id: iId }, function (emp) {
                alert(emp.Name);
                $("#txtName").val(emp.Name);
                $("#ddlGender").val(emp.Gender);
                $("#txtPhone").val(emp.Phone);
                $("#txtEmail").val(emp.Email);
                $("#txtAge").val(emp.Age);
                $("#txtSalary").val(emp.Salary);
            });
        
        }


        function getAllEmployees() {
            $.ajax({
                url: 'EmployeeService.asmx/GetAllEmployees',
                dataType: "json",
                method: 'GET',
                success: function (data) {
                    var employeeTable = $('#employee tbody');
                    employeeTable.empty();

                    $(data).each(function (index, emp) {
                        employeeTable.append('<tr> <td> <button type="button"  class="btn btn-danger editButton" value=' + emp.ID + ' ><i class="fa fa-edit fa-2x" ></i></button> </td> <td>'  
                            + emp.ID + '</td><td>'
                            + emp.Name + '</td><td>'
                            + emp.Gender + '</td><td>'
                            + emp.Phone + '</td><td>'
                            + emp.Email + '</td><td>'
                            + emp.Age + '</td><td>'
                            + emp.Salary + '</td></tr>');
                    });
                },
                error: function (err) {
                    console.log(err);
                }
            });
        }


        $("input[id*=btnAddEmployee]").click(function () {
            alert('hiii');
            var employee = {};
            employee.Name = $('#txtName').val();
            employee.Gender = $('#ddlGender').val();
            employee.Phone = $('#txtPhone').val();
            employee.Email = $('#txtEmail').val();
            employee.Age = $('#txtAge').val();
            employee.Salary = $('#txtSalary').val();


            $.ajax({
                url: 'EmployeeService.asmx/AddEmployee',
                method: 'post',
                data: '{emp: ' + JSON.stringify(employee) + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    getAllEmployees();
                },
                error: function (err) {
                    console.log(err);
                }
            });
        });

  
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container py-3">
            <h4 class="text-center text-uppercase">Employee Registration </h4>
            <div class="card">
                <div class="card-header bg-danger text-white">
                    <h5 class="card-title text-uppercase">Employee Information</h5>
                </div>
                <div class="card-body">

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Name</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fa fa-user"></i></span>
                                    </div>
                                    <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Gender</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fa fa-user"></i></span>
                                    </div>
                                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="custom-select">
                                        <asp:ListItem Value="-1">Choose Gender</asp:ListItem>
                                        <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                        <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Phone Number</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fa fa-phone"></i></span>
                                    </div>
                                    <asp:TextBox ID="txtPhone" CssClass="form-control" onkeypress="return isNumberKey(event);" MaxLength="10" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Email</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fa fa-envelope"></i></span>
                                    </div>
                                    <asp:TextBox ID="txtEmail" CssClass="form-control" TextMode="Email" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Age</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fa fa-user"></i></span>
                                    </div>
                                    <asp:TextBox ID="txtAge" CssClass="form-control" onkeypress="return isNumberKey(event);" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Salary</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">₹</span>
                                    </div>
                                    <asp:TextBox ID="txtSalary" CssClass="form-control" onkeypress="return isNumberKey(event);" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <asp:Button ID="btnAddEmployee" CssClass="btn btn-danger rounded-0"  runat="server" Text="Submit" /> <%--OnClientClick="InsertData();"--%>
                </div>
            </div>
            <table id="employee" class="table table-bordered" style="margin-top: 10px;">
                <thead class="bg-danger text-center text-white">
                    <tr>
                        <th>Action</th>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Gender</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Age</th>
                        <th>Salary</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </form>
</body>
</html>
