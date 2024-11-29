<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="displayPDF.aspx.cs" Inherits="PolicyBookletEmail.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Open PDF - Policy Booklet</title>
    <style>
        /* Overall page styling */
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #007780, #00adbb);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            height: 100vh;
            overflow: hidden;
        }

        /* Form entry animation */
        .form-container {
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Logo */
        .logo {
            width: 200px;
            height: auto;
            margin-bottom: 20px;
            animation: bounce 2s infinite;
        }

        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% {
                transform: translateY(0);
            }
            40% {
                transform: translateY(-10px);
            }
            60% {
                transform: translateY(-5px);
            }
        }

        /* Form container */
        .form-container {
            background: linear-gradient(135deg, #ffffff, #e0f7fa);
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            padding: 40px 30px;
            width: 600px;
            height: 580px;
            max-width: 90%;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .form-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.25);
        }

        /* Header */
        h2 {
            color: #007780;
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 20px;
        }

        /* Labels */
        label {
            font-size: 14px;
            color: #555;
            font-weight: 500;
            display: block;
            margin-bottom: 8px;
        }

        /* Inputs */
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        input[type="text"]:focus, input[type="password"]:focus {
            border-color: #007780;
            outline: none;
            box-shadow: 0 0 5px rgba(0, 119, 128, 0.5);
        }

        /* Button */
        input[type="submit"], button {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #007780, #00adbb);
            color: #fff;
            font-size: 16px;
            font-weight: 500;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        input[type="submit"]:hover {
            background: linear-gradient(135deg, #00adbb, #007780);
            transform: scale(1.05);
        }

        /* Error message */
        .error-message {
            color: red;
            font-size: 14px;
            margin-top: 10px;
            animation: fadeIn 0.5s ease;
        }

        .form-fields-container {
            display: block;
            width: 100%;
            margin-bottom: 20px;
        }

        /* Input containers for alignment */
        .input-group {
            width: 100%;
            margin-bottom: 20px;
        }

        .submitButton {
            width: 100%; /* Button will now take full width */
        }
        /* Responsive Design */
        @media (max-width: 768px) {
            .form-container {
                width: 90%; /* Allow container to be a bit smaller on mobile */
                padding: 20px;
            }
        }
    </style>
    
</head>
<body>
     <form id="form1" runat="server">
        <div class="form-container">
            <img src="Image/logo.png" alt="Company Logo" class="logo" />
            <h2><asp:Literal ID="litHeading" runat="server"></asp:Literal></h2>

            <div class="form-fields-container">
                
                <div class="input-group">
                    <asp:Label ID="lblPolicyNumber" runat="server" Text="Policy Number:" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtPolicyNumber" runat="server" CssClass="inputField"></asp:TextBox>
                </div>

                <div class="input-group">
                    <asp:Label ID="lblPIN" runat="server" Text="PIN:" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtPIN" runat="server" TextMode="Password" CssClass="inputField"></asp:TextBox>
                </div>
            </div>

            <asp:Button ID="btnOpenPDF" runat="server" Text="Submit" OnClick="btnOpenPDF_Click" CssClass="submitButton" />

            <asp:Label ID="lblErrorMessage" runat="server" Text="" CssClass="error-message"></asp:Label>
        </div>
    </form>
</body>
</html>
