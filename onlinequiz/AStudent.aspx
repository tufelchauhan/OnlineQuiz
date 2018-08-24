<%@ Page Title="" Language="VB" MasterPageFile="~/Admin.master" AutoEventWireup="false" CodeFile="AStudent.aspx.vb" Inherits="AStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="student_id" 
        DataSourceID="SqlDataSource1" BackColor="#DEBA84" BorderColor="#DEBA84" 
        BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" 
    Width="100%">
        <Columns>
            <asp:BoundField DataField="student_id" HeaderText="ID" 
                InsertVisible="False" ReadOnly="True" SortExpression="student_id" />
            <asp:BoundField DataField="student_name" HeaderText="Name" 
                SortExpression="student_name" />
            <asp:BoundField DataField="college_name" HeaderText="College Name" 
                SortExpression="college_name" />
            <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
            <asp:BoundField DataField="address" HeaderText="Address" 
                SortExpression="address" />
            <asp:BoundField DataField="mobile" HeaderText="Mobile" 
                SortExpression="mobile" />
            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
            <asp:TemplateField HeaderText="Profile Picture" SortExpression="image_name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("image_name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="100px" 
                        ImageUrl='<%# "~/stud_images/"+Eval("image_name") %>' Width="100px" />
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
<br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT student.student_id, student.student_name, college.college_name, student.city, student.address, student.mobile, student.email, student.image_name FROM student INNER JOIN college ON student.college_id = college.college_id">
    </asp:SqlDataSource>
    </asp:Content>

