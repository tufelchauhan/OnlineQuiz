<%@ Page Title="" Language="VB" MasterPageFile="~/Admin.master" AutoEventWireup="false" CodeFile="AProfile.aspx.vb" Inherits="AProfile" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
        }
        .style3
        {
            width: 149px;
        }
        .style4
        {
            width: 191px;
        }
        .style5
        {
            width: 164px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="2" 
        Width="100%">
        <cc1:TabPanel runat="server" HeaderText="View Profile" ID="TabPanel1">
            <ContentTemplate><asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" 
                    BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3" CellSpacing="2" GridLines="Both" Width="100%"><FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" /><HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" /><ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" /><ItemTemplate><table class="style1"><tr><td class="style2" colspan="2">&#160;</td></tr><tr><td class="style2" colspan="2"><asp:Image ID="Image1" runat="server" Height="200px" 
                                        ImageUrl='<%# "~/faculty_images/"+Eval("image_name") %>' Width="200px" /></td></tr><tr><td class="style2">&#160;</td><td>&#160;</td></tr><tr><td class="style2">Name</td><td><asp:Label ID="faculty_nameLabel" runat="server" 
                                        Text='<%# Eval("faculty_name") %>' /></td></tr><tr><td class="style2">&#160;</td><td>&#160;</td></tr><tr><td class="style2">Mobile</td><td><asp:Label ID="mobileLabel" runat="server" Text='<%# Eval("mobile") %>' /></td></tr><tr><td class="style2">&#160;</td><td>&#160;</td></tr><tr><td class="style2">Email</td><td><asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' /></td></tr></table><br /></ItemTemplate><SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" /></asp:DataList><asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT faculty_name, mobile, email, image_name FROM faculty WHERE (faculty_id = @a)"><SelectParameters><asp:SessionParameter Name="a" SessionField="aid" /></SelectParameters></asp:SqlDataSource></ContentTemplate>
        </cc1:TabPanel>
        <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="Edit Profile">
            <HeaderTemplate>Edit Profile</HeaderTemplate>
            <ContentTemplate><table class="style1" bgcolor="#FFF6E7"><tr><td class="style3">&nbsp;</td><td>&nbsp;</td></tr><tr><td class="style3">Name</td><td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td></tr><tr><td class="style3">&nbsp;</td><td>&nbsp;</td></tr><tr><td class="style3">Mobile</td><td><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td></tr><tr><td class="style3">&nbsp;</td><td>&nbsp;</td></tr><tr><td class="style3">Email</td><td><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td></tr><tr><td class="style3">&nbsp;</td><td>&nbsp;</td></tr><tr><td class="style3"><asp:Button ID="Button1" runat="server" Text="Update" 
                                CausesValidation="False" /></td><td>&nbsp;</td></tr></table></ContentTemplate>
        </cc1:TabPanel>
        <cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="Change Profile Picture">
            <ContentTemplate><table class="style1" bgcolor="#FFF6E7"><tr><td class="style4">&nbsp;</td><td>&nbsp;</td></tr><tr><td class="style4">Choose Image</td><td><asp:FileUpload ID="FileUpload1" runat="server" /></td></tr><tr><td class="style4">&nbsp;</td><td>&nbsp;</td></tr><tr><td class="style4"><asp:Button ID="Button2" runat="server" Text="Change" 
                                CausesValidation="False" /></td><td>&nbsp;</td></tr></table></ContentTemplate>
        </cc1:TabPanel>
        <cc1:TabPanel ID="TabPanel4" runat="server" HeaderText="Change Password">
            <ContentTemplate><table class="style1" bgcolor="#FFF6E7"><tr><td class="style5">&nbsp;</td><td>&nbsp;</td></tr><tr><td class="style5">Old Password</td><td><asp:TextBox 
                    ID="TextBox4" runat="server" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="TextBox4" ErrorMessage="*"></asp:RequiredFieldValidator></td></tr><tr><td class="style5">&nbsp;</td><td>&nbsp;</td></tr><tr><td class="style5">New Password</td><td><asp:TextBox 
                    ID="TextBox5" runat="server" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="TextBox5" ErrorMessage="*"></asp:RequiredFieldValidator></td></tr><tr><td class="style5">&nbsp;</td><td>&nbsp;</td></tr><tr><td class="style5">Confirm Password</td><td><asp:TextBox 
                    ID="TextBox6" runat="server" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="TextBox6" ErrorMessage="*"></asp:RequiredFieldValidator></td></tr><tr><td class="style5">&nbsp;</td><td>&nbsp;</td></tr><tr><td class="style5"><asp:Button ID="Button3" runat="server" Text="Change" /></td><td>&nbsp;</td></tr></table></ContentTemplate>
        </cc1:TabPanel>
    </cc1:TabContainer>
</asp:Content>

