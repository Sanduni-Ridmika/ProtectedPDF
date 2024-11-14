using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using Oracle.ManagedDataAccess.Client;
using System.Configuration;

namespace PolicyBookletEmail.App_Code
{
    public class getPassword
    {
        OracleConnection oconn = new OracleConnection(ConfigurationManager.ConnectionStrings["CONN_STRING_ORCL"].ConnectionString);

        public string getPasswordfromDOB(string policyNumber)
        {
            string password = null;

            try
            {
                if (oconn.State != ConnectionState.Open)
                {
                    oconn.Open();
                }

                string getDOB = "SELECT DOB FROM LUND.POLPERSONAL WHERE POLNO = :PolicyNumber";

                using (OracleCommand cmd = new OracleCommand(getDOB, oconn))
                {
                    cmd.Parameters.Add(new OracleParameter("PolicyNumber", policyNumber));

                    OracleDataReader dobReader = cmd.ExecuteReader();

                    if (dobReader.HasRows)
                    {
                        while (dobReader.Read())
                        {
                            if (!dobReader.IsDBNull(0))
                            {
                                DateTime dob = dobReader.GetDateTime(0);
                                password = dob.ToString("yyyyMMdd");
                            }

                        }
                        dobReader.Close();
                    }
                }

            }
            catch (Exception e)
            {
                password = "Error";
                //log logger = new log();
                //logger.write_log("Failed at getPassword - getDOB: " + e.ToString());

            }
            finally
            {
                if (oconn.State == ConnectionState.Open)
                {
                    oconn.Close();
                }
            }

            return password;
        }
    }
}