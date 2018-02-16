<%@ Page Language="C#" AutoEventWireup="true" CodeFile="jQueryCalender.aspx.cs" Inherits="jQueryCalender" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" href="css/smoothness/jquery-ui-1.7.1.custom.css" rel="stylesheet" />
     <script src="_scripts/jquery-1.3.2.min.js" type="text/javascript"></script>
     <script src="_scripts/jquery-ui-1.7.1.custom.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function() {
            $("#txtDate").datepicker(
            {
                beforeShowDay: function (date) {
                    if (date.getDay() == 6) {
                        return [true];
                    } else {
                        return [false];
                    }
                }
            });
        });
	
	</script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
    </div>    
    </form>
</body>
</html>
