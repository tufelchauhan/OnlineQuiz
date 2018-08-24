<%@ Page Title="" Language="VB" MasterPageFile="~/Admin.master" AutoEventWireup="false" CodeFile="AFaculty.aspx.vb" Inherits="AFaculty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="faculty_id" 
    DataSourceID="SqlDataSource1" BackColor="#DEBA84" BorderColor="#DEBA84" 
        BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" 
    Width="100%">
    <Columns>
        <asp:CommandField ShowSelectButton="True" />
        <asp:BoundField DataField="faculty_id" HeaderText="Id" 
            InsertVisible="False" ReadOnly="True" SortExpression="faculty_id" />
        <asp:BoundField DataField="faculty_name" HeaderText="Name" 
            SortExpression="faculty_name" />
        <asp:BoundField DataField="gender" HeaderText="Gender" 
            SortExpression="gender" />
        <asp:BoundField DataField="mobile" HeaderText="Mobile" 
            SortExpression="mobile" />
        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
        <asp:BoundField DataField="college_name" HeaderText="College Name" 
            SortExpression="college_name" />
        <asp:TemplateField HeaderText="Profile Picture" SortExpression="image_name">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("image_name") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" Height="100px" 
                    ImageUrl='<%# "~/faculty_images/"+Eval("image_name") %>' Width="100px" />
            </ItemTemplate>
        </asp:TemplateField>
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
    SelectCommand="SELECT faculty.faculty_id, faculty.faculty_name, faculty.gender, faculty.mobile, faculty.email, college.college_name, faculty.image_name FROM faculty INNER JOIN college ON faculty.college_id = college.college_id">
</asp:SqlDataSource>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="faculty_id" 
        DataSourceID="SqlDataSource2">
        <ItemTemplate>
            <table class="style1">
                <tr>
                    <td>
                        ID</td>
                    <td>
                        <asp:Label ID="faculty_idLabel" runat="server" 
                            Text='<%# Eval("faculty_id") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        NAME</td>
                    <td>
                        <asp:Label ID="faculty_nameLabel" runat="server" 
                            Text='<%# Eval("faculty_name") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        MOBILE</td>
                    <td>
                        <asp:Label ID="mobileLabel" runat="server" Text='<%# Eval("mobile") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        EMAIL</td>
                    <td>
                        <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" CommandName="del" Text="DELETE" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <br />
<br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [faculty_id], [faculty_name], [mobile], [email] FROM [faculty] WHERE ([faculty_id] = @faculty_id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="faculty_id" 
                PropertyName="SelectedValue" Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

