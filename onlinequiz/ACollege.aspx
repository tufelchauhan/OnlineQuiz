<%@ Page Title="" Language="VB" MasterPageFile="~/Admin.master" AutoEventWireup="false" CodeFile="ACollege.aspx.vb" Inherits="ACollege" %>

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
                College Name</td>
            <td>
                <asp:TextBox ID="TextBox9" runat="server" Width="50%"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBox9" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                City</td>
            <td>
                <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="TextBox10" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Pincode</td>
            <td>
                <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="TextBox11" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Address</td>
            <td>
                <asp:TextBox ID="TextBox12" runat="server" Height="147px" TextMode="MultiLine" 
                    Width="411px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="TextBox12" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Button1" runat="server" Text="ADD" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="college_id" 
        DataSourceID="SqlDataSource1" BackColor="#DEBA84" BorderColor="#DEBA84" 
        BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" 
    Width="100%">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                CausesValidation="False" />
            <asp:BoundField DataField="college_id" HeaderText="College ID" ReadOnly="True" 
                SortExpression="college_id" InsertVisible="False" />
            <asp:BoundField DataField="college_name" HeaderText="College Name" 
                SortExpression="college_name" />
            <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
            <asp:BoundField DataField="pincode" HeaderText="Pincode" 
                SortExpression="pincode" />
            <asp:BoundField DataField="address" HeaderText="Address" 
                SortExpression="address" />
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
        
        SelectCommand="SELECT [college_id], [college_name], [city], [pincode], [address] FROM [college]" 
        DeleteCommand="DELETE FROM [college] WHERE [college_id] = @college_id" 
        InsertCommand="INSERT INTO [college] ([college_name], [city], [pincode], [address]) VALUES (@college_name, @city, @pincode, @address)" 
        UpdateCommand="UPDATE [college] SET [college_name] = @college_name, [city] = @city, [pincode] = @pincode, [address] = @address WHERE [college_id] = @college_id">
        <DeleteParameters>
            <asp:Parameter Name="college_id" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="college_name" Type="String" />
            <asp:Parameter Name="city" Type="String" />
            <asp:Parameter Name="pincode" Type="Decimal" />
            <asp:Parameter Name="address" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="college_name" Type="String" />
            <asp:Parameter Name="city" Type="String" />
            <asp:Parameter Name="pincode" Type="Decimal" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="college_id" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

