<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmLogin.aspx.cs" Inherits="Facturacion.Login.FrmLogin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sistema Facturación</title>
    <link href="../Content/MiStilo.css" rel="stylesheet" />
    <link rel="shortcut icon" href="../Imagenes/Favicon.png" type="image/x-icon" />

    <style type="text/css">
        body {
            background-color: #f2f2f2;
            font-family: Arial, sans-serif;
        }

        .login-container {
            width: 520px;
            margin: 80px auto;
            background-image: url('../Imagenes/FondoLogin.png');
            background-size: cover;
            border: 1px solid #ccc;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            padding: 20px;
        }

        .login-header {
            background-color: #3399ff;
            color: white;
            padding: 10px;
            text-align: center;
            font-size: 20px;
            font-weight: bold;
        }

        .login-form {
            margin-top: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 15px;
        }

            .login-form label {
                font-weight: bold;
                color: white;
                align-self: flex-start;
            }

            .login-form input[type="text"],
            .login-form input[type="password"] {
                width: 100%;
                padding: 8px;
                font-size: 16px;
                color: #0066FF;
            }

            .login-form .login-button {
                margin-top: 10px;
                width: 100px;
                height: 40px;
                font-weight: bold;
            }

        .cerradura {
            display: block;
            margin: 0 auto 15px;
            height: 85px;
        }

        .mensaje-panel {
            margin-top: 15px;
            background-color: black;
            color: white;
            text-align: center;
            padding: 10px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <div class="login-header">CONTROL DE ACCESO</div>

            <asp:Image ID="ImgCerradura" runat="server" ImageUrl="~/Imagenes/CerraduraRoja.png" CssClass="cerradura" />

            <div class="login-form">
                <asp:Label ID="Usuario" runat="server" Text="Usuario:" ForeColor="White" />
                <asp:TextBox ID="TextUsuario" runat="server" ToolTip="Introduzca su Usuario" />

                <asp:Label ID="LblClave" runat="server" Text="Clave:" ForeColor="White"/>
                <asp:TextBox ID="TextClave" runat="server" TextMode="Password" ToolTip="Introduzca su Contraseña" />

                <asp:Button ID="BtnAceptar" runat="server" Text="Aceptar" CssClass="login-button" OnClick="BtnAceptar_Click" />
            </div>

            <asp:Panel ID="PnlMensaje" runat="server" CssClass="mensaje-panel">
                <asp:Label ID="LblMensaje" runat="server" Text="Mensaje." />
            </asp:Panel>
        </div>

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:Timer ID="Timer1" runat="server" Interval="5000" Enabled="false" />
    </form>
</body>
</html>
