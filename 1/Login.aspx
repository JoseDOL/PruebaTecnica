<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Iniciar sesión</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Iniciar sesión</h2>
            <asp:Label ID="messageError" runat="server" ForeColor="Red" Visible="false"></asp:Label>
            <div>
                <label for="txtUsername">Nombre de usuario:</label>
                <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                <br />
                <label for="txtPassword">Contraseña:</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                <br />
                <asp:Button ID="btnLogin" runat="server" Text="Iniciar sesión" OnClick="btnLogin_Click" />
            </div>
        </div>
    </form>
</body>
</html>
