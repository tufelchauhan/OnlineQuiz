<%@ Page Title="" Language="VB" MasterPageFile="~/student.master" AutoEventWireup="false" CodeFile="SResult.aspx.vb" Inherits="SResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        &nbsp;</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="result_id" DataSourceID="SqlDataSource1" Width="100%" 
            CellPadding="3" BackColor="#DEBA84" BorderColor="#DEBA84" 
            BorderStyle="None" BorderWidth="1px" CellSpacing="2">
            <Columns>
                <asp:BoundField DataField="result_id" HeaderText="Result ID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="result_id" />
                <asp:BoundField DataField="quiz_title" HeaderText="Title" 
                    SortExpression="quiz_title" />
                <asp:BoundField DataField="total_correct" HeaderText="Total Correct" 
                    SortExpression="total_correct" />
                <asp:BoundField DataField="total_wrong" HeaderText="Total Wrong" 
                    SortExpression="total_wrong" />
                <asp:BoundField DataField="result_date" HeaderText="Result Date" 
                    SortExpression="result_date" DataFormatString="{0:d}" />
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
            SelectCommand="SELECT quiz_result.result_id, quiz.quiz_title, quiz_result.total_correct, quiz_result.total_wrong, quiz_result.result_date FROM quiz_result INNER JOIN quiz ON quiz_result.quiz_id = quiz.quiz_id WHERE (quiz_result.student_id = @ssssss)">
            <SelectParameters>
                <asp:SessionParameter Name="ssssss" SessionField="sid" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>

