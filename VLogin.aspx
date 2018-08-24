<%@ Page Title="" Language="VB" MasterPageFile="~/visitor.master" AutoEventWireup="false" CodeFile="VLogin.aspx.vb" Inherits="VLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
       <table bgcolor="#FFF6E7" class="style1">
           <tr>
               <td align="center">
                   &nbsp;</td>
           </tr>
           <tr>
               <td align="center">
       <asp:Login ID="Login1" runat="server" Font-Names="Maiandra GD" 
        ForeColor="#CC3300" PasswordLabelText="Password :" 
        UserNameLabelText="User Name :    " Font-Bold="False" BackColor="#FFF6E7">
           <LoginButtonStyle Font-Bold="True" Font-Names="Maiandra GD" 
               ForeColor="#CC3300" />
           <TitleTextStyle Font-Bold="True" />
    </asp:Login>
               </td>
           </tr>
           <tr>
               <td align="center">
                   &nbsp;</td>
           </tr>
           <tr>
               <td align="center">
    <asp:LinkButton ID="LinkButton1" runat="server" 
        PostBackUrl="~/VRegistration.aspx" ForeColor="#CC3300">Register Now</asp:LinkButton>
               </td>
           </tr>
           <tr>
               <td align="center">
                   &nbsp;</td>
           </tr>
    </table>
    <br />
    </asp:Content>

