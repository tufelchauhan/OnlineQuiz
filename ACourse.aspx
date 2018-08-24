<%@ Page Title="" Language="VB" MasterPageFile="~/Admin.master" AutoEventWireup="false" CodeFile="ACourse.aspx.vb" Inherits="ACourse" %>

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
                Course</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBox1" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Add" Width="62px" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="course_id" 
        DataSourceID="SqlDataSource1" BackColor="#DEBA84" BorderColor="#DEBA84" 
        BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" 
    Width="100%">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                CausesValidation="False" />
            <asp:BoundField DataField="course_id" HeaderText="Course ID" 
                InsertVisible="False" ReadOnly="True" SortExpression="course_id" />
            <asp:BoundField DataField="course_name" HeaderText="Course Name" 
                SortExpression="course_name" />
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
        DeleteCommand="DELETE FROM [course] WHERE [course_id] = @course_id" 
        InsertCommand="INSERT INTO [course] ([course_name]) VALUES (@course_name)" 
        SelectCommand="SELECT * FROM [course]" 
        UpdateCommand="UPDATE [course] SET [course_name] = @course_name WHERE [course_id] = @course_id">
        <DeleteParameters>
            <asp:Parameter Name="course_id" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="course_name" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="course_name" Type="String" />
            <asp:Parameter Name="course_id" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

