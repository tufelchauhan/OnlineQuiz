<%@ Page Title="" Language="VB" MasterPageFile="~/student.master" AutoEventWireup="false" CodeFile="SProfile.aspx.vb" Inherits="SProfile" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
        }
        .style2
        {
            width: 120px;
        }
        .style3
        {
            width: 100%;
        }
        .style4
        {
            width: 218px;
        }
        .style6
        {
            width: 172px;
        }
        .style8
        {
            width: 19%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
        Width="99%" ForeColor="Black" >
        <cc1:TabPanel runat="server" HeaderText="View Profile" ID="TabPanel1">
        <ContentTemplate><asp:DataList ID="DataList1" runat="server" DataKeyField="student_id" 
        DataSourceID="SqlDataSource1" BackColor="#DEBA84" BorderColor="#DEBA84" 
                BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" 
                GridLines="Both" Width="100%"><FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" /><HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" /><ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" /><ItemTemplate><table class="nav-justified"><tr><td class="style1" colspan="2">&#160;</td></tr><tr><td 
                    class="style1" colspan="2"><asp:Image ID="Image1" runat="server" 
                    Height="200px" ImageUrl='<%# "~/stud_images/"+Eval("image_name") %>' 
                    Width="200px" /></td></tr><tr><td class="style2">&#160;</td><td>&#160;</td></tr><tr><td 
                    class="style2">NAME</td><td><asp:Label ID="student_nameLabel" runat="server" 
                        Text='<%# Eval("student_name") %>' /></td></tr><tr><td class="style2">&#160;</td><td>&#160;</td></tr><tr><td 
                    class="style2">GENDER</td><td><asp:Label ID="genderLabel" runat="server" 
                        Text='<%# Eval("gender") %>' /></td></tr><tr><td class="style2">&#160;</td><td>&#160;</td></tr><tr><td 
                    class="style2">COLLEGE</td><td><asp:Label ID="college_nameLabel" runat="server" 
                        Text='<%# Eval("college_name") %>' /></td></tr><tr><td class="style2">&#160;</td><td>&#160;</td></tr><tr><td 
                    class="style2">CITY</td><td><asp:Label ID="cityLabel" runat="server" 
                        Text='<%# Eval("city") %>' /></td></tr><tr><td class="style2">&#160;</td><td>&#160;</td></tr><tr><td 
                    class="style2">ADDRESS</td><td><asp:Label ID="addressLabel" runat="server" 
                        Text='<%# Eval("address") %>' /></td></tr><tr><td class="style2">&#160;</td><td>&#160;</td></tr><tr><td 
                    class="style2">MOBILE</td><td><asp:Label ID="mobileLabel" runat="server" 
                        Text='<%# Eval("mobile") %>' /></td></tr><tr><td class="style2">&#160;</td><td>&#160;</td></tr><tr><td 
                    class="style2">EMAIL</td><td><asp:Label ID="emailLabel" runat="server" 
                        Text='<%# Eval("email") %>' /></td></tr></table><br /><br /></ItemTemplate><SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" /></asp:DataList><asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT student.student_id, student.student_name, student.gender, college.college_name, student.city, student.address, student.mobile, student.email, student.image_name FROM student INNER JOIN college ON student.college_id = college.college_id WHERE (student.student_id = @s)"><SelectParameters><asp:SessionParameter Name="s" SessionField="sid" /></SelectParameters></asp:SqlDataSource></ContentTemplate>
        </cc1:TabPanel>
        <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="Edit Profile">
            <ContentTemplate><table bgcolor="#FFF6E7" class="style1"><tr><td class="style8">&nbsp;</td><td>&nbsp;</td></tr><tr><td class="style8">Name</td><td><asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td></tr><tr><td class="style8">&nbsp;</td><td>&nbsp;</td></tr><tr><td class="style8">City</td><td><asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td></tr><tr><td class="style8">&nbsp;</td><td>&nbsp;</td></tr><tr><td class="style8">Address</td><td><asp:TextBox ID="TextBox6" runat="server"></asp:TextBox></td></tr><tr><td class="style8">&nbsp;</td><td>&nbsp;</td></tr><tr><td class="style8">Mobile</td><td><asp:TextBox ID="TextBox7" runat="server"></asp:TextBox></td></tr><tr><td class="style8">&nbsp;</td><td>&nbsp;</td></tr><tr><td class="style8">Email</td><td><asp:TextBox ID="TextBox8" runat="server"></asp:TextBox></td></tr><tr><td class="style8">&nbsp;</td><td>&nbsp;</td></tr><tr><td class="style8"><asp:Button ID="Button1" runat="server" Text="Update" 
                                CausesValidation="False" /></td><td>&nbsp;</td></tr></table></ContentTemplate>
        </cc1:TabPanel>
        <cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="Change Image">
            <ContentTemplate><table bgcolor="#FFF6E7" class="style1"><tr><td class="style4">&nbsp;</td><td>&nbsp;</td></tr><tr><td class="style4">Choose Image</td><td><asp:FileUpload ID="FileUpload1" runat="server" /></td></tr><tr><td class="style4">&nbsp;</td><td>&nbsp;</td></tr><tr><td class="style4"><asp:Button ID="Button3" runat="server" Text="Change" 
                                CausesValidation="False" /></td><td>&nbsp;</td></tr></table></ContentTemplate>
        </cc1:TabPanel>
        <cc1:TabPanel ID="TabPanel4" runat="server" HeaderText="Change Password">
        <ContentTemplate><table class="style3" bgcolor="#FFF6E7"><tr><td class="style4">&nbsp;</td><td>&nbsp;</td></tr><tr><td class="style4">Old Password</td><td><asp:TextBox 
                ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBox1" ErrorMessage="*"></asp:RequiredFieldValidator></td></tr><tr><td class="style4">&nbsp;</td><td>&nbsp;</td></tr><tr><td 
                class="style4">New Password</td><td><asp:TextBox ID="TextBox2" runat="server" 
                    TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBox2" ErrorMessage="*"></asp:RequiredFieldValidator></td></tr><tr><td class="style4">&nbsp;</td><td>&nbsp;</td></tr><tr><td 
                class="style4">Confirm New Password</td><td><asp:TextBox ID="TextBox3" 
                    runat="server" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="TextBox3" ErrorMessage="*"></asp:RequiredFieldValidator></td></tr><tr><td class="style4">&nbsp;</td><td>&nbsp;</td></tr><tr><td 
                class="style4"><asp:Button ID="Button2" runat="server" Text="Change" /></td><td>&nbsp;</td></tr></table></ContentTemplate></cc1:TabPanel>
    </cc1:TabContainer>
    
</asp:Content>

