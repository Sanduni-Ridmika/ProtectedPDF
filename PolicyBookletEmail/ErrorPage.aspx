<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ErrorPage.aspx.cs" Inherits="PolicyBookletEmail.ErrorPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Policy Booklet Not Found</title>
    <style>
       body {
            font-family: 'Arial', sans-serif;
            background: #eef2f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #fff;
        }

        .error-container {
            background: #fff;
            color: #333;
            padding: 40px 60px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            max-width: 600px;
            width: 90%;
            text-align: center;
            animation: fadeIn 0.8s ease-in-out;
        }

        .error-container img {
            width: 150px;
            height: 150px;
        }

        .error-container h1 {
            color: #ff4a4a;
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .error-container p {
            font-size: 16px;
            line-height: 1.8;
            color: #555;
            margin-bottom: 25px;
        }

        .contact-info {
            background: #f7f7f7;
            border-radius: 8px;
            padding: 15px;
            box-shadow: inset 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .contact-info span {
            display: block;
            font-size: 15px;
            color: #007bff;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .contact-info span:last-child {
            margin-bottom: 0;
        }

        .contact-btn {
            display: inline-block;
            margin-top: 15px;
            background: linear-gradient(45deg, #6a11cb, #2575fc);
            color: #fff;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 14px;
            font-weight: bold;
            transition: background 0.3s, transform 0.2s;
        }

        .contact-btn:hover {
            background: linear-gradient(45deg, #2575fc, #6a11cb);
            transform: scale(1.05);
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: scale(0.9);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }

        @media (max-width: 768px) {
            .error-container {
                padding: 35px 50px; 
                max-width: 500px;
            }

            .error-container img {
                width: 150px;
                height: 150px;
            }

            .error-container h1 {
                font-size: 28px;
            }

            .error-container p {
                font-size: 18px;
            }

            .contact-info span {
                font-size: 16px;
            }

            .contact-btn {
                font-size: 16px;
                padding: 12px 25px;
            }
        }

        @media (max-width: 480px) {
            .error-container {
                padding: 30px 20px; 
                max-width: 95% 
            }

            .error-container img {
                width: 120px;
                height: 120px;
            }

            .error-container h1 {
                font-size: 24px;
            }

            .error-container p {
                font-size: 16px;
            }

            .contact-info span {
                font-size: 14px;
            }

            .contact-btn {
                font-size: 14px;
                padding: 10px 20px;
            }
        }

    </style>
</head>
<body>
    <div class="error-container">
        <img src="Image/error.png" alt="Error Icon" />
        <h1>Policy Booklet Not Found</h1>
        <p>
            Unfortunately, we couldn’t find your policy booklet PDF. 
            Please contact our support team for assistance.
        </p>
        <div class="contact-info">
            <a href="mailto:email@sliclife.com" style="text-decoration: none; color: #007bff; font-weight: bold;">
                Email: email@sliclife.com
            </a>
            <br /><br />
            <a href="tel:0112377377" style="text-decoration: none; color: #007bff; font-weight: bold;">
                HotLine: 0112377377
            </a>
        </div>
        <a href="email@sliclife.com" class="contact-btn">Contact Support</a>
    </div>
</body>
</html>
