<%@ Page Title="" Language="VB" MasterPageFile="~/faculty.master" AutoEventWireup="false" CodeFile="FQuiz.aspx.vb" Inherits="FQuiz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 414px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1" bgcolor="#FFF6E7">
        <tr>
            <td>
                Title</td>
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
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource1" DataTextField="course_name" 
                    DataValueField="course_id">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="DropDownList1" ErrorMessage="*"></asp:RequiredFieldValidator>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT * FROM [course]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                Subject</td>
            <td>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                    DataSourceID="SqlDataSource2" DataTextField="subject_name" 
                    DataValueField="subject_id">
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="RadioButtonList1" ErrorMessage="*"></asp:RequiredFieldValidator>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [subject_id], [subject_name] FROM [subject] WHERE ([course_id] = @course_id)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="course_id" 
                            PropertyName="SelectedValue" Type="Decimal" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                Total Question</td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="TextBox2" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Add Quiz" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        </table>
    <table class="style1" bgcolor="#FFF6E7">
        <tr>
            <td class="style2" valign="top">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="quiz_id" 
                    DataSourceID="SqlDataSource3" BackColor="#DEBA84" BorderColor="#DEBA84" 
                    BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" CausesValidation="False" />
                        <asp:BoundField DataField="quiz_id" HeaderText="Quiz ID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="quiz_id" />
                        <asp:BoundField DataField="quiz_title" HeaderText="Title" 
                            SortExpression="quiz_title" />
                        <asp:BoundField DataField="total_question" HeaderText="Total Question" 
                            SortExpression="total_question" />
                        <asp:BoundField DataField="upload_date" HeaderText="Upload Date" 
                            SortExpression="upload_date" />
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
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [quiz_id], [quiz_title], [total_question], [upload_date] FROM [quiz] WHERE ([faculty_id] = @faculty_id)">
        <SelectParameters>
            <asp:SessionParameter Name="faculty_id" SessionField="fid" Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
            </td>
            <td valign="top">
                <asp:Panel ID="Panel1" runat="server" Visible="False">
                    <table class="style1" bgcolor="#FFF6E7">
                        <tr>
                            <td>
                                Question</td>
                            <td>
                                <asp:TextBox ID="TextBox3" runat="server" Height="179px" TextMode="MultiLine" 
                                    Width="360px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                    ControlToValidate="TextBox3" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Option 1</td>
                            <td>
                                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                    ControlToValidate="TextBox4" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Option 2</td>
                            <td>
                                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                    ControlToValidate="TextBox5" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Option 3</td>
                            <td>
                                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                    ControlToValidate="TextBox6" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Option 4</td>
                            <td>
                                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                    ControlToValidate="TextBox7" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:RadioButtonList ID="RadioButtonList2" runat="server" 
                                    RepeatDirection="Horizontal">
                                    <asp:ListItem>Option 1</asp:ListItem>
                                    <asp:ListItem>Option 2</asp:ListItem>
                                    <asp:ListItem>Option 3</asp:ListItem>
                                    <asp:ListItem>Option 4</asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                    ControlToValidate="RadioButtonList2" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="Button2" runat="server" Text="Add Question" Width="111px" 
                                    CausesValidation="False" />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    </asp:Content>

