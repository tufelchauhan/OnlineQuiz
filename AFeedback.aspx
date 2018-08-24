<%@ Page Title="" Language="VB" MasterPageFile="~/Admin.master" AutoEventWireup="false" CodeFile="AFeedback.aspx.vb" Inherits="AFeedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" DataKeyNames="feedback_id" 
        DataSourceID="SqlDataSource1" BackColor="#DEBA84" 
    BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
    CellSpacing="2" Width="100%">
        <Columns>
            <asp:BoundField DataField="feedback_id" HeaderText="ID" 
                InsertVisible="False" ReadOnly="True" SortExpression="feedback_id" />
            <asp:BoundField DataField="student_name" HeaderText="Student Name" 
                SortExpression="student_name" />
            <asp:BoundField DataField="feedback_desc" HeaderText="Feedback" 
                SortExpression="feedback_desc" />
            <asp:BoundField DataField="feedback_date" DataFormatString="{0:d}" 
                HeaderText="Date" SortExpression="feedback_date" />
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
        SelectCommand="SELECT Feedback.feedback_id, student.student_name, Feedback.feedback_desc, Feedback.feedback_date FROM Feedback INNER JOIN student ON Feedback.student_id = student.student_id">
    </asp:SqlDataSource>
</asp:Content>

