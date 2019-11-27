<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="HomeShoppe.webservice.WebForm1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AJAX Demo</title>
    <script src="../Scripts/jquery-3.3.1.js"></script>
    <script>
        $(document).ready(function () {
            showData();
        });

        function showData()
        {
            $.ajax({
                type: 'GET',
                url: 'AjaxDemo.aspx/GetData',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json'
            }).done(function (data) {
                console.log(data.d);
                alert(1);
            }).fail(function (response) {
                console.log(response);
                alert(2);
            });
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>

        </div>
    </form>
</body>
</html>