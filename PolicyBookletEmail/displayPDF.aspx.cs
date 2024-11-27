using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PolicyBookletEmail
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnOpenPDF_Click(object sender, EventArgs e)
        {
            string policyNumber = txtPolicyNumber.Text.Trim();
            string pin = txtPIN.Text.Trim();

            if (!string.IsNullOrEmpty(policyNumber) && !string.IsNullOrEmpty(pin))
            {
                // Pass the policy number as a query parameter to the handler
                string url = $"PDFHandler.ashx?policyNumber={policyNumber}";
                string script = $"window.open('{url}', '_blank');";
                ClientScript.RegisterStartupScript(this.GetType(), "OpenPDF", script, true);
            }
            else
            {
                lblErrorMessage.Text = "Please enter both Policy Number and PIN.";
            }

        }
    }
}