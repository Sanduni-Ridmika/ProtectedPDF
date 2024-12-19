<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="displayPDF.aspx.cs" Inherits="PolicyBookletEmail.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Open PDF - Policy Booklet</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: Arial, sans-serif;
            background-color: #eef2f9;
            display: flex;
            justify-content: center; 
            align-items: center; 
            overflow-x: hidden; 
            box-sizing: border-box; 
        }

        .container {
            width: 100%;
            max-width: 600px; 
            padding: 40px 20px;
            background: #fff;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin: 0 auto; 
            box-sizing: border-box;
            overflow: hidden;
        }

        .logo-container {
            text-align: center;
            margin-bottom: 20px;
        }
        .logo-container img {
            max-width: 150px; 
            width: 100%;
            max-width: 150px; 
            animation: bounce 2s infinite;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        .input-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 15px;
        }
        .input-group label {
            font-weight: bold;
            margin-bottom: 5px;
        }
        .input-group input {
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .btn-submit-container {
            text-align: center; 
            margin-top: 20px;
        }

        .btn-submit {
            background: linear-gradient(45deg, #6a11cb, #2575fc);
            color: #fff;
            padding: 10px;
            border: none;
            width: auto; 
            min-width: 150px; 
            cursor: pointer;
            border-radius: 5px;
            font-size: 16px;
            transition: background 0.3s, transform 0.2s;
        }
        .btn-submit:hover {
            background: linear-gradient(45deg, #2575fc, #6a11cb);
            transform: scale(1.05);
        }

        .error-message {
            color: red;
            margin-top: 10px;
            text-align: center;
        }

        .footer {
            text-align: center;
            margin-top: 20px;
            color: #555;
            font-size: 14px;
            background-color: #f0f0f0;  
            padding: 10px 0;  
        }

        .modal {
            display: none; 
            position: fixed; 
            z-index: 1000; 
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.5);
            display: flex;
            justify-content: center;
        }

        .modal-content {
            background-color: #eef2f9;
            padding: 20px; 
            border: 1px solid #888;
            width: 90%;
            max-width: 500px;
            max-height: 300px; 
            text-align: center;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            position: relative; 
            top: 30px; 
            overflow-y: auto;
        }

        .modal-content h3 {
            margin-top: 0;
            color: #333;
            font-size: 18px;
        }

        .modal-content p {
            font-size: 14px; 
            line-height: 1.4; 
        }

        .modal-content button {
            margin-top: 15px; 
            background-color: #6a11cb;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        .modal-content button:hover {
            background-color: #2575fc;
        }

        .modal-line {
            border: 0;
            border-top: 1px solid #ddd; 
            margin: 10px 0; 
            width: 80%; 
            margin-left: auto;
            margin-right: auto;
        }

        @media (max-width: 768px) {
            .container {
                width: 85%;  
                padding: 30px; 
            }
            .input-group label {
                font-size: 14px; 
            }
            .input-group input {
                font-size: 14px; 
                padding: 12px;
            }
            .btn-submit {
                font-size: 14px; 
                padding: 12px; 
            }
            .modal-content {
                max-height: 250px; 
                padding: 15px; 
            }

            .modal-content p {
                font-size: 13px; 
            }

            .modal-content h3 {
                font-size: 16px; 
            }

            .modal-content button {
                padding: 8px 16px; 
            }
        }

        @media (max-width: 480px) {
            
            .container {
                width: 95%; 
                padding: 20px; 
            }
            .btn-submit {
                font-size: 13px;
                padding: 15px; 
            }
            h2 {
                font-size: 18px; 
            }
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

    </style>

    <script>
        window.onload = function () {
            document.getElementById("myModal").style.display = "flex";
        };

        function closeModal() {
            document.getElementById("myModal").style.display = "none";
        }
    </script>
    
</head>
<body>
     <form id="form1" runat="server">

        <div id="myModal" class="modal">
            <div class="modal-content">
                <h3>Access</h3>
                <hr class="modal-line">
                <p>Please enter the PIN Number in the SMS to access.</p>
                <p>කෙටි පනිවිඩයේ PIN අංකය ඇතුළත් කරන්න.</p>
                <p>செயற்கப்பட்ட SMS இல் உள்ள PIN இலக்கத்தை உள்ளிடவும்.</p>
                <hr class="modal-line">
                <button type="button" onclick="closeModal()">OK</button>
            </div>
        </div>
        
        <div class="container">
           
            <div class="logo-container">
                <img src="Image/logo.png" alt="Company Logo" />
            </div>

            <h2>
                <asp:Literal ID="litHeading" runat="server"></asp:Literal>
            </h2>

            <div class="input-group">
                <label for="txtPolicyNumber">Policy Number</label>
                <asp:TextBox ID="txtPolicyNumber" runat="server"></asp:TextBox>
            </div>

            <div class="input-group">
                <label for="txtPIN">PIN</label>
                <asp:TextBox ID="txtPIN" runat="server" TextMode="Password"></asp:TextBox>
            </div>

            <div class="btn-submit-container">
                <asp:Button ID="btnOpenPDF" runat="server" CssClass="btn-submit" Text="Access Policy PDF" OnClick="btnAccess_Click" />
            </div>

            <asp:Label ID="lblErrorMessage" runat="server" CssClass="error-message"></asp:Label>
        </div>

        <div class="footer">
            &copy; 2024 Sri Lanka Insurance Life Limited. All Rights Reserved.
        </div>
    </form>
</body>
</html>
