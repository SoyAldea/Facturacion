<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmLogin.aspx.cs" Inherits="Facturacion.Login.FrmLogin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Sistema Facturacion</title>

    <!-- Enlaces a estilos y favicon -->
    <link href="../Content/MiStilo.css" rel="stylesheet" />
    <link rel="shortcut icon" type="image/x-icon" href="../Imagenes/Favicon.png" />

    <!-- Estilos CSS adicionales -->
    <style type="text/css">
        .PnlMensaje {
            margin-top: 80px;
        }
        .TextUsuario {}
        .TextClave {
            margin-left: 211px;
        }
        .BtnAceptar {}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- Logo y presentación -->
            <div id="Logo">
                <h2>SISTEMA</h2>
                <h3>DE FACTURACIONES ELECTRÓNICA</h3>
            </div>

            <!-- Panel general -->
            <asp:Panel ID="PnlAcceso" runat="server" BorderColor="Black" BorderStyle="Solid" CssClass="PnlAcceso" Width="520px" Height="268px" BackImageUrl="../Imagenes/FondoLogin.png">
                
                <!-- Panel de control de acceso -->
                <asp:Panel ID="PnlControl" runat="server" Height="37px" Width="520px" BackColor="#3399ff" style="margin-left: 0px">
                    <asp:Label ID="LblControl" runat="server" Text="control de acceso" Font-Bold="true" ForeColor="White" Font-Size="Larger" CssClass="LblControl"></asp:Label>
                </asp:Panel>

                <!-- Datos de usuario -->
                <asp:Image ID="ImgCerradura" runat="server" ImageUrl="~/Imagenes/CerraduraRoja.png" Height="85px" Width="95px" CssClass="ImgCerradura" />
                <asp:Label ID="LblClave" runat="server" Text="Clave:" Font-Bold="True" Font-Size="Large" ForeColor="White" style="position:absolute; top:130px; right:315px"></asp:Label>
                <asp:Label ID="Usuario" runat="server" Text="Usuario:" Font-Bold="True" Font-Size="Large" ForeColor="White" style="position:absolute; top:100px; right:315px"></asp:Label>
               <asp:TextBox ID="TextUsuario" runat="server" Font-Bold="True" ToolTip="Introduzca su Usuario" Font-Size="Large" ForeColor="#0066FF" Width="202px"></asp:TextBox>

              <asp:TextBox ID="TextClave" runat="server" Font-Size="Large" Font-Bold="True"
                 ToolTip="Introduzca su Contraseña" ForeColor="#0066FF"
                 AutoCompleteType="Disabled" CssClass="TextClave" TextMode="Password"
                 Width="202px" Height="22px"></asp:TextBox>

             <asp:Button ID="BtnAceptar" runat="server" Text="Aceptar" ToolTip="Presione para aceptar la validación"
               Font-Bold="true" BorderStyle="Outset" Height="40px" Width="100px"
               CssClass="BtnAceptar" OnClick="BtnAceptar_Click" />

                <!-- Panel de mensajería -->
                <asp:Panel ID="PnlMensaje" runat="server" Height="34px" Width="520px" CssClass="PnlMensaje" BackColor="Black">
                    <asp:Label ID="LblMensaje" runat="server" Text="Mensaje." Font-Bold="True" ForeColor="white" CssClass="LblMensaje"></asp:Label>
                </asp:Panel>
            </asp:Panel>

            <!-- Timer y ScriptManager -->
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:Timer ID="Timer1" runat="server" Interval="5000" Enabled="false"></asp:Timer>
        </div>
        
    </form>
</body>
</html>