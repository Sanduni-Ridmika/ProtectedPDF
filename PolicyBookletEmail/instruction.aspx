<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="instruction.aspx.cs" Inherits="PolicyBookletEmail.instruction" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Policy Book Instructions</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            width: 100%;
            font-family: Arial, sans-serif;
            background-color: #eef2f9;
            display: flex;
            justify-content: center; 
            align-items: center;
            overflow: hidden;
        }

        .container {
            width: 70%;
            max-width: 1600px;
            min-height: 600px; 
            padding: 40px 30px;
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        .logo img {
            width: 180px;
        }

        .logo-text {
            font-size: 12px;
            color: #888;
            margin-bottom: 30px;
            text-align: center; 
            white-space: nowrap; 
            overflow: hidden; 
            text-overflow: ellipsis; 
        }

        .languages {
            display: flex;
            justify-content: center;
            margin-bottom: 30px;
        }

        .languages a {
            color: #007bff;
            text-decoration: none;
            margin: 0 15px;
            font-size: 16px;
            cursor: pointer;
        }

        h1, p {
            color: #333;
            margin: 10px 0;
        }

        .instructions {
            font-size: 16px;
            text-align: left;
            margin: 40px 0;
            height: auto;
            padding-bottom: 20px;
        }

        .example {
            color: #ff0000;
            font-weight: bold;
        }

        .blue-text {
            color: #0056b3;
            font-size: 18px;
            text-align: center;
            margin: 0 auto;
            max-width: 500px;
            margin-top: 30px;
        }

        .download-btn {
            display: inline-block;
            padding: 10px 20px;
            background: linear-gradient(45deg, #6a11cb, #2575fc);
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            font-size: 18px;
            font-weight: bold;
            margin-top: 40px;
            transition: background 0.3s, transform 0.2s;
            white-space: nowrap;
            width: auto; 
            min-width: 150px; 
            text-align: center; 
        }

        .download-btn:hover {
            background: linear-gradient(45deg, #2575fc, #6a11cb);
            transform: scale(1.05);
        }

        .spacer {
            height: 30px;
        }

        p.light-blue-text {
            color: #29ADB2;
            font-size: 18px;
            margin-top: -20px;
            margin-bottom: 5px;
        }

        ol {
            margin-top: 20px;
            margin-bottom: 20px;
        }

        @media (max-width: 768px) {
            .container {
                width: 90%;
                padding: 30px 20px;
            }

            .logo img {
                width: 150px;
            }

            .logo-text {
                font-size: 10px;
                margin-bottom: 20px;
            }

            .blue-text {
                font-size: 16px;
                max-width: 100%;
                margin-top: 20px;
            }

            .download-btn {
                font-size: 16px;
                padding: 12px 25px;
            }
        }

        @media (max-width: 480px) {
            .container {
                width: 95%;
                padding: 20px 15px;
            }

            .logo img {
                width: 120px;
            }

            .logo-text {
                font-size: 10px;
                margin-bottom: 15px;
            }

            .blue-text {
                font-size: 14px;
                margin-top: 15px;
            }

            .download-btn {
                font-size: 14px;
                padding: 10px 20px;
            }

            .spacer {
                height: 20px;
            }

            .download-btn {
                font-size: 14px;
                padding: 10px 20px;
                width: auto;
                max-width: 100%;
            }
        }
    </style>

</head>
<body>
    <div class="container">
        
        <div class="logo">
            <img src="Image/logo.png" alt="Sri Lanka Insurance" />
            <p class="logo-text">Like a father - Like a mother</p>
        </div>

        <div class="languages">
            <a href="?lang=en">English</a>
            <a href="?lang=si">සිංහල</a>
            <a href="?lang=ta">தமிழ்</a>
        </div>

        <div class="instructions">
            <% 
                string language = Request.QueryString["lang"] ?? "en";
                if (language == "en") 
                {
            %>
                <ol>
                    <li>Download the Document.</li>
                    <li>Open the document by following the instructions mentioned below.</li>
                </ol>
                <p class="blue-text">
                    <strong>Please Enter your Date of Birth</strong> as in the following example to open the document.
                    If your Date of Birth is <span class="example">January 21<sup>st</sup> of 1989</span>, please enter <span class="example">19890121</span>.
                </p>
            <% 
                } 
                else if (language == "si") 
                {
            %>
                <ol>
                    <li>ලේඛනය බාගත කරන්න.</li>
                    <li>පහත දැක්වෙන උපදෙස් අනුගමනය කර ලේඛනය විවෘත කරන්න.</li>
                </ol>
                <p class="blue-text" style="text-align: center;">
                    <strong>ඔබේ උපන් දිනය පහත උදාහරණයේ ආකාරයෙන් ඇතුලත් කර ලේඛනය විවෘත කරගන්න.</strong>
                    ඔබේ උපන් දිනය <span class="example">1989 ජනවාරි 21</span> නම්, කරුණාකර <span class="example">19890121</span> ලෙස ඇතුළත් කරන්න.
                </p>
            <% 
                } 
                else if (language == "ta") 
                {
            %>
                <ol>
                    <li>ஆவணத்தை பதிவிறக்கம் செய்யவும்.</li>
                    <li>கீழே கொடுக்கப்பட்டுள்ள வழிமுறைகளைப் பின்பற்றி ஆவணத்தைத் திறக்கவும்.</li>
                </ol>
                <p class="blue-text" style="text-align: center;">
                    <strong>உங்கள் பிறந்த தேதியை உள்ளிடவும்</strong> கீழே உள்ள உதாரணத்தைப் போன்று:
                    உங்கள் பிறந்த தேதி <span class="example">1989 ஜனவரி 21</span> என்றால், தயவுசெய்து <span class="example">19890121</span> என உள்ளிடவும்.
                </p>
            <% 
                }
            %>
        </div>

        <div class="spacer"></div>

        <p class="light-blue-text">
            <strong>Click the Button below to obtain the Policy Booklet.</strong>
        </p>

        <a href="#" class="download-btn" onclick="openPDF(); return false;">Download</a>

        <div class="spacer"></div>
    </div>

    <script type="text/javascript">
        function openPDF() {
        
            var policyNumber = '<%= Session["PolicyNumber"] %>';
        
            if (policyNumber) {
            
                console.log("Policy Number: " + policyNumber);
            
                var pdfUrl = "PDFHandler.ashx?policyNumber=" + policyNumber;
                window.open(pdfUrl, '_blank');
            }
            else {
                console.log("Policy number is missing.");
            }
        }
    </script>

</body>
</html>
