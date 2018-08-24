<%@ Page Title="" Language="VB" MasterPageFile="~/Admin.master" AutoEventWireup="false" CodeFile="ASubject.aspx.vb" Inherits="ASubject" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1" bgcolor="#FFF6E7">
        <tr>
            <td>
                Subject</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBox1" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Course</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="SqlDataSource2" DataTextField="course_name" 
                    DataValueField="course_id">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="DropDownList1" ErrorMessage="*"></asp:RequiredFieldValidator>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [course_name], [course_id] FROM [course]">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Add" Width="53px" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" CellSpacing="2" DataKeyNames="subject_id" 
        DataSourceID="SqlDataSource1" Width="100%">
        <Columns>
            <asp:CommandField CausesValidation="False" ShowDeleteButton="True" 
                ShowEditButton="True" />
            <asp:BoundField DataField="subject_id" HeaderText="Id" InsertVisible="False" 
                ReadOnly="True" SortExpression="subject_id" />
            <asp:BoundField DataField="subject_name" HeaderText="Subject" 
                SortExpression="subject_name" />
        </Columns>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FFF1D4" />
        <SortedAscendingHeaderStyle BackColor="#B95C30" />
        <SortedDescendingCellStyle BackColor="#F1E5CE" />
        <SortedDescendingHeaderStyle BackColor="#93451F" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [subject] WHERE [subject_id] = @subject_id" 
        InsertCommand="INSERT INTO [subject] ([subject_name]) VALUES (@subject_name)" 
        SelectCommand="SELECT [subject_id], [subject_name] FROM [subject]" 
        UpdateCommand="UPDATE [subject] SET [subject_name] = @subject_name WHERE [subject_id] = @subject_id">
        <DeleteParameters>
            <asp:Parameter Name="subject_id" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="subject_name" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="subject_name" Type="String" />
            <asp:Parameter Name="subject_id" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>


