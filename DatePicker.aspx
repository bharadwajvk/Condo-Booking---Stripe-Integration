<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DatePicker.aspx.cs" Inherits="DatePicker" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script language="javascript">
        function SetDate(dateValue, ctl) {
            thisForm = window.opener.document.forms[0].elements[ctl].value = dateValue;
            self.close();
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <asp:Calendar ID="Calendar1" runat="server" ondayrender="Calendar1_DayRender"></asp:Calendar>
    </div>
    </form>
</body>
</html>
