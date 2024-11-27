<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="displayPDF.aspx.cs" Inherits="PolicyBookletEmail.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Open PDF - Policy Booklet</title>
    <style>
        /* Overall page styling */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fa;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Form container */
        .form-container {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 400px;
            max-width: 100%;
        }

        /* Header */
        h2 {
            text-align: center;
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
        }

        /* Labels */
        label {
            font-size: 14px;
            color: #555;
            font-weight: bold;
            margin-bottom: 8px;
            display: block;
        }

        /* Textbox styling */
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0 20px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            box-sizing: border-box;
        }

        /* Button styling */
        input[type="button"], input[type="submit"], button {
            width: 100%;
            padding: 10px;
            background-color: #007780;
            color: #fff;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        /* Button hover effect */
        input[type="button"]:hover, input[type="submit"]:hover, button:hover {
            background-color: #00adbb;
        }

        /* Error message */
        .error-message {
            color: red;
            font-size: 14px;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <h2>View Your Policy</h2>

            <asp:Label ID="lblPolicyNumber" runat="server" Text="Enter Policy Number: " CssClass="label"></asp:Label>
            <asp:TextBox ID="txtPolicyNumber" runat="server" CssClass="inputField"></asp:TextBox>

            <asp:Label ID="lblPIN" runat="server" Text="Enter PIN: " CssClass="label"></asp:Label>
            <asp:TextBox ID="txtPIN" runat="server" TextMode="Password" CssClass="inputField"></asp:TextBox>

            <asp:Button ID="btnOpenPDF" runat="server" Text="Submit" OnClick="btnOpenPDF_Click" CssClass="submitButton" />

            <asp:Label ID="lblErrorMessage" runat="server" Text="" CssClass="error-message"></asp:Label>
        </div>
    </form>
</body>
</html>
