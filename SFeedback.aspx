<%@ Page Title="" Language="VB" MasterPageFile="~/student.master" AutoEventWireup="false" CodeFile="SFeedback.aspx.vb" Inherits="SFeedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" 
        BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" 
        DataKeyNames="feedback_id" DataSourceID="SqlDataSource1" Width="100%">
        <Columns>
            <asp:BoundField DataField="feedback_id" HeaderText="Id" InsertVisible="False" 
                ReadOnly="True" SortExpression="feedback_id" />
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
        SelectCommand="SELECT [feedback_id], [feedback_desc], [feedback_date] FROM [Feedback] WHERE ([student_id] = @student_id)">
        <SelectParameters>
            <asp:SessionParameter Name="student_id" SessionField="sid" Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
    <table bgcolor="#FFF6E7" class="style1">
        <tr>
            <td>
                Feedback</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Height="112px" TextMode="MultiLine" 
                    Width="386px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBox1" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Button1" runat="server" Text="POST" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

