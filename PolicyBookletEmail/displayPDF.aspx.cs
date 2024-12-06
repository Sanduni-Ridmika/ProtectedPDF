using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.ManagedDataAccess.Client;

namespace PolicyBookletEmail
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set dynamic content for the heading based on user authentication or other conditions
                if (User.Identity.IsAuthenticated)
                {
                    // Personalize the heading if the user is authenticated
                    litHeading.Text = "Welcome Back, " + User.Identity.Name + "!";
                }
                else
                {
                    // General heading for unauthenticated users
                    litHeading.Text = "View Your Policy Information";
                }

                // Example: Handle query string conditions
                string action = Request.QueryString["action"];
                if (!string.IsNullOrEmpty(action) && action == "newPolicy")
                {
                    litHeading.Text = "Create a New Policy";
                }
            }
        }

        protected void btnOpenPDF_Click(object sender, EventArgs e)
        {
            string policyNumber = txtPolicyNumber.Text.Trim();
            string pin = txtPIN.Text.Trim();

            if (!string.IsNullOrEmpty(policyNumber) && !string.IsNullOrEmpty(pin))
            {
                if (ValidatePolicyAndPin(policyNumber, pin))
                {
                    // Pass the policy number as a query parameter to the handler
                    string url = $"PDFHandler.ashx?policyNumber={policyNumber}";
                    string script = $"window.open('{url}', '_blank');";
                    ClientScript.RegisterStartupScript(this.GetType(), "OpenPDF", script, true);
                }
                else
                {
                    lblErrorMessage.Text = "Invalid Policy Number or PIN. Please Try Again.";
                }
            }
            else
            {
                lblErrorMessage.Text = "Please enter both Policy Number and PIN.";
            }

        }

        private bool ValidatePolicyAndPin(string policyNumber, string pin)
        {
            bool isValid = false;
            string connectionString = ConfigurationManager.ConnectionStrings["CONN_STRING_ORCL"].ConnectionString;

            using (Oracle.ManagedDataAccess.Client.OracleConnection conn = new Oracle.ManagedDataAccess.Client.OracleConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = "SELECT COUNT(*) FROM SMS.POLICY_EMAIL WHERE POLNO = :policyNumber AND PIN = :pin";

                    using (Oracle.ManagedDataAccess.Client.OracleCommand cmd = new Oracle.ManagedDataAccess.Client.OracleCommand(query, conn))
                    {
                        cmd.Parameters.Add("policyNumber", Oracle.ManagedDataAccess.Client.OracleDbType.Varchar2).Value = policyNumber;
                        cmd.Parameters.Add("pin", Oracle.ManagedDataAccess.Client.OracleDbType.Varchar2).Value = pin;

                        int count = Convert.ToInt32(cmd.ExecuteScalar());
                        isValid = count > 0;
                    }
                }
                catch (Exception ex)
                {
                    lblErrorMessage.Text = "An error occurred while validating your information. Please try again.";
                }
            }

            return isValid;
        }
    }
}