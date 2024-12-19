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
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowModal", "document.getElementById('myModal').style.display = 'flex';", true);

                if (User.Identity.IsAuthenticated)
                {
                    litHeading.Text = "Welcome Back, " + User.Identity.Name + "!";
                }
                else
                {
                    litHeading.Text = "View Your Policy Information";
                }

                string action = Request.QueryString["action"];
                if (!string.IsNullOrEmpty(action) && action == "newPolicy")
                {
                    litHeading.Text = "Create a New Policy";
                }
            }
        }

        protected void btnAccess_Click(object sender, EventArgs e)
        {
            string policyNumber = txtPolicyNumber.Text.Trim();
            string pin = txtPIN.Text.Trim();

            if (!string.IsNullOrEmpty(policyNumber) && !string.IsNullOrEmpty(pin))
            {
                if (ValidatePolicyAndPin(policyNumber, pin))
                {
                    if (string.IsNullOrEmpty(policyNumber))
                    {
                        Response.Redirect("ErrorPage.aspx");
                    }
                    else
                    {
                        Session["PolicyNumber"] = policyNumber;
                        Response.Redirect("/instruction.aspx");
                    }
                }
                else
                {
                    if (IsPinExpired(policyNumber, pin))
                    {
                        lblErrorMessage.Text = "The PIN number has expired. Please contact support.";
                    }
                    else
                    {
                        lblErrorMessage.Text = "Invalid Policy Number or PIN. Please try again.";
                    }
                }
            }
            else
            {
                lblErrorMessage.Text = "Please enter both Policy Number and PIN.";

            }
            ScriptManager.RegisterStartupScript(this, GetType(), "HideModal", "document.getElementById('myModal').style.display = 'none';", true);
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
                    string query = "SELECT COUNT(*) FROM SMS.POLICY_EMAIL WHERE POLNO = :policyNumber AND PIN = :pin AND IS_EXPIRED = 'N'";

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

        private bool IsPinExpired(string policyNumber, string pin)
        {
            bool isExpired = false;
            string connectionString = ConfigurationManager.ConnectionStrings["CONN_STRING_ORCL"].ConnectionString;

            using (Oracle.ManagedDataAccess.Client.OracleConnection conn = new Oracle.ManagedDataAccess.Client.OracleConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = @"SELECT COUNT(*) 
                             FROM SMS.POLICY_EMAIL 
                             WHERE POLNO = :policyNumber 
                               AND PIN = :pin 
                               AND IS_EXPIRED = 'Y'";

                    using (Oracle.ManagedDataAccess.Client.OracleCommand cmd = new Oracle.ManagedDataAccess.Client.OracleCommand(query, conn))
                    {
                        cmd.Parameters.Add("policyNumber", Oracle.ManagedDataAccess.Client.OracleDbType.Varchar2).Value = policyNumber;
                        cmd.Parameters.Add("pin", Oracle.ManagedDataAccess.Client.OracleDbType.Varchar2).Value = pin;

                        int count = Convert.ToInt32(cmd.ExecuteScalar());
                        isExpired = count > 0;
                    }
                }
                catch (Exception ex)
                {
                    lblErrorMessage.Text = "An error occurred while checking PIN expiration. Please try again.";
                }
            }
            return isExpired;
        }
    }
}