<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script language="javascript">
        function PopupPicker(ctl) {
            var PopupWindow = null;
            PopupWindow = window.open('DatePicker.aspx?ctl=' + ctl, '', 'width=250,height=250');
            PopupWindow.focus();
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <table><tr><td><asp:TextBox ID="txtDate" runat="server"></asp:TextBox></td><td><img src="images/images.jpg" style="margin-top:3px;width:30px;height:30px;cursor:hand;" onclick="PopupPicker('txtDate')" /></td></tr></table>
        
        
    
    </form>
</body>
</html>
