using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Stripe;
using System.Collections.Specialized;

public partial class Input : System.Web.UI.Page
{
    //protected Literal ltFirstName, ltLastName, ltEmail, ltPhone, ltAddress1, ltCity, ltState, ltCountry, ltCountry;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            // Handle Stripe payments
            NameValueCollection nvc = Request.Form;
            string hfStripeToken = nvc["hfStripeToken"];
            if (!string.IsNullOrEmpty(hfStripeToken))
            {
                btnPay_Click(hfStripeToken);
            }
        }
    }
    private void btnPay_Click(string stripeToken)
    {
        string stripeCharge = "";
        var myCharge = new StripeChargeCreateOptions
        {
            // convert the amount of £15.95 to pennies i.e. 1595
            Amount = Convert.ToInt32(noofweeks.Value)*480*100,
            Currency = "usd", // or whatever currency your dealing in
            Description = "121", // for example an order ID
            SourceTokenOrExistingSourceId = stripeToken,
            
           
        };

        var chargeService = new StripeChargeService("sk_test_PJ6gMyIQDj3kl743NfGFzO1X");

        try
        {
             chargeService.Create(myCharge);
            receipt.Visible = true;
            
        }
        catch (StripeException ex)
        {
            StripeError stripeError = ex.StripeError;
            // Handle error
            return;
        }


        // Successfully Authorised, do your post-succesful payment processing here...
    }
    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)

    {

        string ctrl = Request.QueryString["ctl"];

        HyperLink hpl = new HyperLink();

        hpl.Text = ((LiteralControl)e.Cell.Controls[0]).Text;

        hpl.NavigateUrl = "javascript:SetDate('" + e.Day.Date.ToShortDateString() + "','" + ctrl + "');";

        e.Cell.Controls.Clear();

        e.Cell.Controls.Add(hpl);

    }
}