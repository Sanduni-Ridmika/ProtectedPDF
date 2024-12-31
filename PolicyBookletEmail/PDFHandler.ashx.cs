using System;
using System.Web;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Text;
using System.Configuration;
using Oracle.ManagedDataAccess.Client;
using System.Data;

namespace PolicyBookletEmail
{
    public class Handler1 : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            string policyNumber = context.Request.QueryString["policyNumber"];
            if (string.IsNullOrEmpty(policyNumber))
            {
                context.Response.ContentType = "text/plain";
                context.Response.Write("Error: Policy number is missing.");
                return;
            }

            // Retrieve password (DOB) from the database
            string password;
            using (OracleConnection oconn = new OracleConnection(ConfigurationManager.ConnectionStrings["CONN_STRING_ORCL"].ConnectionString))
            {
                try
                {
                    oconn.Open();
                    string query = "SELECT DOB FROM LUND.POLPERSONAL WHERE POLNO = :PolicyNumber AND PRPERTYPE = 1";
                    using (OracleCommand cmd = new OracleCommand(query, oconn))
                    {
                        cmd.Parameters.Add(new OracleParameter("PolicyNumber", policyNumber));

                        using (OracleDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read() && !reader.IsDBNull(0))
                            {
                                password = reader.GetDecimal(0).ToString(); // Convert the numeric DOB to string directly

                            }
                            else
                            {
                                context.Response.ContentType = "text/plain";
                                context.Response.Write("Error: Password (DOB) not found for the given policy number.");
                                return;
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Error retrieving password: " + ex.Message);
                    return;
                }
            }

            string pdfFilePath = $@"\\slicllfs\DOK_Policy\{policyNumber}.pdf";

            if (File.Exists(pdfFilePath))
            {
                context.Response.ContentType = "application/pdf";
                context.Response.AddHeader("Content-Disposition", $"inline; filename={Path.GetFileName(pdfFilePath)}");

                // Read the original PDF into a byte array
                byte[] originalPdfData = File.ReadAllBytes(pdfFilePath);

                // Create a memory stream to store the password-protected PDF
                using (MemoryStream outputPdfStream = new MemoryStream())
                {
                    using (PdfReader pdfReader = new PdfReader(originalPdfData))
                    {
                        PdfStamper pdfStamper = new PdfStamper(pdfReader, outputPdfStream);
                        pdfStamper.SetEncryption(
                            Encoding.ASCII.GetBytes(password),
                            Encoding.ASCII.GetBytes(password),
                            PdfWriter.ALLOW_PRINTING,
                            PdfWriter.ENCRYPTION_AES_128
                        );
                        pdfStamper.Close();
                    }

                    // Write the encrypted PDF to the response
                    byte[] encryptedPdfData = outputPdfStream.ToArray();
                    context.Response.OutputStream.Write(encryptedPdfData, 0, encryptedPdfData.Length);
                }

                context.Response.AppendHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                context.Response.AppendHeader("Pragma", "no-cache");
                context.Response.AppendHeader("Expires", "0");
            }
            else
            {
                context.Response.ContentType = "text/plain";
                //context.Response.Write("Error: PDF file not found.");
                context.Response.Redirect("ErrorPage.aspx");
            }

            context.Response.Flush();
            context.Response.SuppressContent = true;
            HttpContext.Current.ApplicationInstance.CompleteRequest();
        }

        public bool IsReusable
        {
            get { return false; }
        }
    }
}
