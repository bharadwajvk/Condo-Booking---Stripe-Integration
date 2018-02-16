<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Input" %>

<%@ Register Src="~/usercontrols/CalenderUserControl.ascx" TagName="calenderdate" TagPrefix="uc" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Condo Booking</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="cycle2.js"></script>
    <link href="css/style.css" rel="stylesheet" />
    <link type="text/css" href="css/smoothness/jquery-ui-1.7.1.custom.css" rel="stylesheet" />
    <script src="_scripts/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="_scripts/jquery-ui-1.7.1.custom.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("#txtFromDate").datepicker(
            {
                beforeShowDay: function (date) {
                    if (date.getDay() == 6) {
                        return [true];
                    } else {
                        return [false];
                    }
                }
            });
            $("#txtToDate").datepicker(
           {
               beforeShowDay: function (date) {
                   if (date.getDay() == 6) {
                       return [true];
                   } else {
                       return [false];
                   }
               }
           });
            $("#bookingform").hide();
            $("#rangeMsg").hide();
            $("#weekMsg").hide();
            $("#reqMsg").hide();
            $("#booknow").live('click', function (e) {
                var startDate = new Date($('#txtFromDate').val());
                var endDate = new Date($('#txtToDate').val());

                if ($('#txtFromDate').val() == "" || $('#txtToDate').val() == "") {
                    $("#reqMsg").show();
                }

                else {
                    $("#reqMsg").hide();
                }
                if (($('#txtFromDate').val() != "" && $('#txtToDate').val() != "") && (startDate < endDate)) {
                    $("#bookingform").show();
                    $("#rangeMsg").hide();
                    $("#weekMsg").hide();
                    $("#reqMsg").hide();
                }
                else {
                    $("#bookingform").hide();
                   // $("#rangeMsg").show();
                }
                if (daysdifference(endDate,startDate) > 28) {
                    $("#weekMsg").show();
                    $("#bookingform").hide();
                }
                if (($('#txtFromDate').val() != "" && $('#txtToDate').val() != "") && (startDate > endDate)) {
                    $("#rangeMsg").show();
                }
                else {
                    $("#rangeMsg").hide();
                }
              

                $("#noofweeks").val(daysdifference(endDate, startDate) / 7);
                
            });
            function daysdifference(date1, date2) {
                // The number of milliseconds in one day
                var ONEDAY = 1000 * 60 * 60 * 24;
                // Convert both dates to milliseconds
                var date1_ms = date1.getTime();
                var date2_ms = date2.getTime();
                // Calculate the difference in milliseconds
                var difference_ms = Math.abs(date1_ms - date2_ms);

                // Convert back to days and return
                return Math.round(difference_ms / ONEDAY);
            }
        });

	</script>
 
    <script type="text/javascript" src="https://js.stripe.com/v2/">  </script>
    <script type="text/javascript">

        $('document').ready(function () {
            Stripe.setPublishableKey('pk_test_jE0gZAsnMlUMDagsHMgcIsKO');

            $('#btnPay').live('click', function (e) {
                e.preventDefault();
                e.stopPropagation();

                Stripe.card.createToken({
                    number: $('#txtCardNumber').val(),
                    cvc: $('#txtCardSecurityCode').val(),
                    exp_month: $('#txtCardExpiryMonth').val(),
                    exp_year: $('#txtCardExpiryYear').val(),
                    name: $('#txtFirstName').val() + ' ' + $('#txtLastName').val(),
                    address_line1: $('#txtAddress1').val(),
                    address_line2: $('#txtAddress2').val(),
                    address_city: $('#txtCity').val(),
                    address_state:$('#txtState').val(),
                    address_zip: $('#txtZipcode').val(),
                    address_country: $('#txtCountry').val()
                }, stripeResponseHandler);
            });


            function stripeResponseHandler(status, response) {
                var $form = $('#form1');
                if (response.error) {
                    // Show the errors on the form
                    alert(response.error.message);
                } else {
                    // response contains id and card, which contains additional card details 
                    var token = response.id;
                    // Insert the token into the form so it gets submitted to the server
                    $('#hfStripeToken').val(token);
                    // and submit
                    $form.get(0).submit();
                }
            }
        });
    </script>
    <style type="text/css">
        div {
            margin-top:15px;
        }
        .center {
            text-align: center;
        }
    </style>
</head>
<body style="height: 900px;">
    <form id="form1" runat="server">
        <div class="homeslides" style="margin-top:50px;margin-left: 50px;margin-right: 50px;">
            <div class="cycle-slideshow"
                data-cycle-fx="fade"
                data-cycle-timeout="6000">
                <div class="cycle-pager" id="homepager"></div>
                <img src="//dhbj78k1zu0f6.cloudfront.net/images/homeslides/slide1-kitchen.jpg" />
                <img src="//dhbj78k1zu0f6.cloudfront.net/images/newCut3-1.jpg" />

                <img src="//dhbj78k1zu0f6.cloudfront.net/images/homeslides/slide_home_ext.jpg" alt="Novi, MI Real Estate, Large Brick Home Photo - Hunter Pasteur Homes" title="Novi, MI Real Estate, Large Brick Home Photo" />
                <img src="images/homeslides/slide2.jpg" alt="Homes For Sale In Lake Orion, MI, Home Office Picture - Hunter Pasteur Homes" title="Homes For Sale In Lake Orion, MI, Home Office Picture" />
                <img src="images/homeslides/slide3.jpg" alt="Lake Orion Real Estate, Bathroom Photo - Hunter Pasteur Homes" title="Lake Orion Real Estate, Bathroom Photo" />
                <img src="images/homeslides/slide5.jpg" alt="Homes For Sale In Lake Orion, MI, Home Room With Flowers Picture - Hunter Pasteur Homes" title="Homes For Sale In Lake Orion, MI, Home Room With Flowers Picture" />
                <img src="images/homeslides/slide6.jpg" alt="Lake Orion Real Estate, Kitchen And Dining Photo - Hunter Pasteur Homes" title="Lake Orion Real Estate, Kitchen And Dining Photo" />
                <img src="//dhbj78k1zu0f6.cloudfront.net/images/ArborChase-2d.jpg" alt="Arbor Chase, MI, Real Estate, Kitchen And Dining Photo - Hunter Pasteur Homes" title="Arbor Chase, MI, Real Estate, Kitchen And Dining Photo" />
                <img src="images/homeslides/slide7.jpg" alt="Lake Orion Real Estate, Kitchen And Dining Photo - Hunter Pasteur Homes" title="Lake Orion Real Estate, Kitchen And Dining Photo" />
            </div>
        </div>
        <input type="hidden" name="hfStripeToken" id="hfStripeToken" />
        <input type="hidden" name="noofweeks" id="noofweeks" runat="server"/>

        <div style="text-align:center">
            <h1 style="margin-top:50px;">Condo Name</h1>
        <div style="margin-top: 50px;">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtFromDate" ForeColor="red" runat="server" ErrorMessage="Please select a value"></asp:RequiredFieldValidator> 
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtToDate" ForeColor="red" runat="server" ErrorMessage="Please select a value"></asp:RequiredFieldValidator> 
<br />
            From:    
            <asp:TextBox ID="txtFromDate" runat="server"></asp:TextBox>
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        To:    
            <asp:TextBox ID="txtToDate" runat="server"></asp:TextBox>
            <input type="button" id="booknow" title="Book Now" value="Book Now"/>
        </div>
         <div id="rangeMsg" style="color:red">From Date must be less than To Date. Please select valid date range.</div>
         <div id="weekMsg" style="color:red">You can only book minimum of 1 week to maximum of 4 weeks</div>
         <div id="reqMsg" style="color:red">Please select a value</div>

        <div id="bookingform" runat="server" >


         <div style="margin-top:50px;">
            <asp:Label runat="server" Width="180">First Name</asp:Label>
            <input type="text" id="txtFirstName" name="txtFirstName" runat="server"/>
        </div>
         <div>
            <asp:Label runat="server" Width="180">Last Name</asp:Label>
            <input type="text" id="txtLastName" name="txtLastName" runat="server"/>
        </div>
         <div>
            <asp:Label runat="server" Width="180">Email Address</asp:Label>
            <input type="text" id="txtEmail" name="txtEmail" runat="server"/>
        </div>
         <div>
            <asp:Label runat="server" Width="180">Address 1</asp:Label>
            <input type="text" id="txtAddress1" name="txtAddress1" runat="server"/>
        </div>
         <div>
            <asp:Label runat="server" Width="180">Address 2</asp:Label>
            <input type="text" id="txtAddress2" name="txtAddress2" runat="server"/>
        </div>
         <div>
            <asp:Label runat="server" Width="180">State</asp:Label>
            <input type="text" id="txtState" name="txtState" runat="server"/>
        </div>
        <div>
            <asp:Label runat="server" Width="180">City</asp:Label>
            <input type="text" id="txtCity" name="txtCity" runat="server"/>
        </div>
           <div>
            <asp:Label runat="server" Width="180">Country</asp:Label>
            <input type="text" id="txtCountry" name="txtCountry" runat="server" />
        </div>
               <div>
            <asp:Label runat="server" Width="180">Zip Code</asp:Label>
            <input type="text" id="txtZipcode" name="txtZipcode" runat="server"/>
        </div>
               <div>
            <asp:Label runat="server" Width="180">Card Number</asp:Label>
            <input type="text" id="txtCardNumber" name="txtCardNumber" runat="server" />
        </div>
        <div>
            <asp:Label runat="server" Width="180">Expiry Date</asp:Label>
            <input type="text" id="txtCardExpiryMonth" name="txtCardExpiryMonth" style="width:80px" runat="server"/>
            /
	        <input type="text" id="txtCardExpiryYear" name="txtCardExpiryYear" style="width:80px" runat="server"/>
        </div>
        <div>
            <asp:Label runat="server" Width="180">Security Code</asp:Label>
            <input type="text" id="txtCardSecurityCode" name="txtCardSecurityCode" runat="server"/>
        </div>
        <div>
            <input type="submit" id="btnPay" name="btnPay" value="Pay Now" style="margin-top:30px;margin-bottom:30px;"/>
        </div>
            </div>
        </div>

        <asp:Panel runat="server" id="receipt" Visible="false" CssClass="center">
            <h2 style="color:green">Booking successful</h2>

           <%-- First Name: <asp:Literal ID="ltFirstName" runat="server"></asp:Literal>
            Last Name: <asp:Literal ID="ltLastName" runat="server"></asp:Literal>
            Email: <asp:Literal ID="ltEmail" runat="server"></asp:Literal>
            Phone Number: <asp:Literal ID="ltPhone" runat="server"></asp:Literal>
            Address1: <asp:Literal ID="ltAddress1" runat="server"></asp:Literal>
            City: <asp:Literal ID="ltCity" runat="server"></asp:Literal>
            State: <asp:Literal ID="ltState" runat="server"></asp:Literal>
            Country: <asp:Literal ID="ltCountry" runat="server"></asp:Literal>
            Zipcode: <asp:Literal ID="c" runat="server"></asp:Literal>--%>

        </asp:Panel>
    </form>
</body>
</html>
