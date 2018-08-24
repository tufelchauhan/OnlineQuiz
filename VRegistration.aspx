<%@ Page Title="" Language="VB" MasterPageFile="~/visitor.master" AutoEventWireup="false" CodeFile="VRegistration.aspx.vb" Inherits="VReg" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



<html xmlns="http://www.w3.org/1999/xhtml">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
        }
        .style4
        {
            text-align: center;
            font-size: x-large;
            font-weight: bold;
        }
    </style>
    <table class="style1">
        <tr>
            <td align="center">
                <div class="style4">
                    Registration Form<br />
                </div>
                <br />
                <br />
                <asp:RadioButtonList ID="RadioButtonList2" runat="server" 
                    RepeatDirection="Horizontal" AutoPostBack="True" Font-Bold="True" 
                    Font-Size="Large" Width="20%">
                    <asp:ListItem>Student</asp:ListItem>
                    <asp:ListItem>Faculty</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <table class="style1" bgcolor="#FFF6E7">
                <tr>
                    <td class="style2" align="center" colspan="2">
                        <h1>&nbsp;</h1>
                        <h1>
                            Student Registration</h1>
                        <p>
                            &nbsp;</p>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        Name</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="TextBox1" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        Gender</td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        College</td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" 
                            DataSourceID="SqlDataSource1" DataTextField="college_name" 
                            DataValueField="college_id">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT [college_id], [college_name] FROM [college]">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        State</td>
                    <td>
                        <asp:DropDownList ID="DropDownList4" runat="server">
                            <asp:ListItem>Gujarat</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        City</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                        ControlToValidate="TextBox2" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        Address</td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                   ControlToValidate="TextBox3" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        Mobile</td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server" MaxLength="10"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        Email</td>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ErrorMessage="Invalid" ControlToValidate="TextBox5" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        Password</td>
                    <td>
                        <asp:TextBox ID="TextBox6" runat="server" TextMode="Password"></asp:TextBox>
                        <cc1:PasswordStrength ID="TextBox6_PasswordStrength" runat="server" 
                            Enabled="True" TargetControlID="TextBox6">
                        </cc1:PasswordStrength>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        Confirm Password</td>
                    <td>
                        <asp:TextBox ID="TextBox7" runat="server" TextMode="Password"></asp:TextBox>
                        <cc1:PasswordStrength ID="TextBox7_PasswordStrength" runat="server" 
                            Enabled="True" TargetControlID="TextBox7">
                        </cc1:PasswordStrength>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                            ErrorMessage="Not Match" ControlToCompare="TextBox6" 
                            ControlToValidate="TextBox7"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        Upload Image</td>
                    <td>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ControlToValidate="FileUpload1" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Button ID="Button1" runat="server" Font-Bold="True" Text="Submit" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table class="style1" bgcolor="#FFF6E7">
                <tr>
                    <td class="style2" align="center" colspan="2">
                        <h1>
                            &nbsp;</h1>
                        <h1>
                            Faculty Registration</h1>
                        <p>
                            &nbsp;</p>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        Name</td>
                    <td>
                        <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="TextBox8" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        Gender</td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList3" runat="server">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        College</td>
                    <td>
                        <asp:DropDownList ID="DropDownList3" runat="server" 
                            DataSourceID="SqlDataSource3" DataTextField="college_name" 
                            DataValueField="college_id">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT [college_id], [college_name] FROM [college]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        Mobile</td>
                    <td>
                        <asp:TextBox ID="TextBox9" runat="server" MaxLength="10"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        Email</td>
                    <td>
                        <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ControlToValidate="TextBox10" ErrorMessage="Invalid" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        Password</td>
                    <td>
                        <asp:TextBox ID="TextBox11" runat="server" TextMode="Password"></asp:TextBox>
                        <cc1:PasswordStrength ID="TextBox11_PasswordStrength" runat="server" 
                            Enabled="True" TargetControlID="TextBox11">
                        </cc1:PasswordStrength>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        Confirm Password</td>
                    <td>
                        <asp:TextBox ID="TextBox12" runat="server" TextMode="Password"></asp:TextBox>
                        <cc1:PasswordStrength ID="TextBox12_PasswordStrength" runat="server" 
                            Enabled="True" TargetControlID="TextBox12">
                        </cc1:PasswordStrength>
                        <asp:CompareValidator ID="CompareValidator2" runat="server" 
                            ControlToCompare="TextBox11" ControlToValidate="TextBox12" 
                            ErrorMessage="Not match"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        Upload Image</td>
                    <td>
                        <asp:FileUpload ID="FileUpload2" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                            ControlToValidate="FileUpload2" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Button ID="Button2" runat="server" Font-Bold="True" Text="Submit" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</html>

</asp:Content>

