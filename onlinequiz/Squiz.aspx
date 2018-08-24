<%@ Page Title="" Language="VB" MasterPageFile="~/student.master" AutoEventWireup="false" CodeFile="Squiz.aspx.vb" Inherits="Squiz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 236px;
        }
        .style4
        {
            width: 170px;
        }
        .style5
        {
            width: 169px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1" bgcolor="#FFF6E7">
        <tr>
            <td class="style5">
                Select Course</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource1" DataTextField="course_name" 
                    DataValueField="course_id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT * FROM [course]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Select Subject</td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server" 
                    DataSourceID="SqlDataSource2" DataTextField="subject_name" 
                    DataValueField="subject_id">
                </asp:DropDownList>
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
            <td class="style5">
                <asp:Button ID="Button1" runat="server" Text="Search" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="quiz_id" 
                    DataSourceID="SqlDataSource3" BackColor="#DEBA84" BorderColor="#DEBA84" 
                    BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" 
                    Width="100%" Visible="False">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="quiz_id" HeaderText="Quiz ID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="quiz_id" />
                        <asp:BoundField DataField="quiz_title" HeaderText="Title" 
                            SortExpression="quiz_title" />
                        <asp:BoundField DataField="total_question" HeaderText="Total Question" 
                            SortExpression="total_question" />
                        <asp:BoundField DataField="upload_date" HeaderText="Upload Date" 
                            SortExpression="upload_date" DataFormatString="{0:d}" />
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
                    SelectCommand="SELECT [quiz_id], [quiz_title], [total_question], [upload_date] FROM [quiz] WHERE ([subject_id] = @subject_id)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList2" Name="subject_id" 
                            PropertyName="SelectedValue" Type="Decimal" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <table class="style1">
                    <tr>
                        <td class="style2">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Panel ID="Panel2" runat="server" Visible="False">
                                Select Question</asp:Panel>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
                                DataSourceID="SqlDataSource4" DataTextField="qno" 
                                DataValueField="quiz_details_id" Visible="False">
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                
                                SelectCommand="SELECT quiz_details_id, qno FROM quiz_details WHERE (quiz_id = @quiz_id)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="GridView1" Name="quiz_id" 
                                        PropertyName="SelectedValue" Type="Decimal" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td>
                            <table class="style1">
                                <tr>
                                    <td>
                                        <asp:Panel ID="Panel1" runat="server" Visible="False" Height="968px">
                                            <asp:DataList ID="DataList1" runat="server" DataKeyField="quiz_details_id" 
                                DataSourceID="SqlDataSource5" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" 
                                                BorderWidth="1px" CellPadding="3" CellSpacing="2" GridLines="Both" Width="100%">
                                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                                <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                                                <ItemTemplate>
                                                    <table class="style1">
                                                        <tr>
                                                            <td>
                                                                &nbsp;</td>
                                                            <td>
                                                                &nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <b>Question</b></td>
                                                            <td>
                                                                <asp:Label ID="questionLabel" runat="server" Text='<%# Eval("question") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <b>Option 1</b></td>
                                                            <td>
                                                                <asp:Label ID="option1Label" runat="server" Text='<%# Eval("option1") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <b>Option 2</b></td>
                                                            <td>
                                                                <asp:Label ID="option2Label" runat="server" Text='<%# Eval("option2") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <b>Option 3</b></td>
                                                            <td>
                                                                <asp:Label ID="option3Label" runat="server" Text='<%# Eval("option3") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <b>Option 4</b></td>
                                                            <td>
                                                                <asp:Label ID="option4Label" runat="server" Text='<%# Eval("option4") %>' />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <br />
                                                </ItemTemplate>
                                                <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                            </asp:DataList>
                                            <table class="style1">
                                                <tr>
                                                    <td class="style4">
                                                        Choose Option</td>
                                                    <td>
                                                        <asp:RadioButtonList ID="RadioButtonList2" runat="server">
                                                            <asp:ListItem>Option 1</asp:ListItem>
                                                            <asp:ListItem>Option 2</asp:ListItem>
                                                            <asp:ListItem>Option 3</asp:ListItem>
                                                            <asp:ListItem>Option 4</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                            ControlToValidate="RadioButtonList2" ErrorMessage="*"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style4">
                                                        <asp:Button ID="Button3" runat="server" Text="SAVE" />
                                                        <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style4">
                                                        &nbsp;</td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style4">
                                                        &nbsp;</td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style4">
                                                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                                                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                                            SelectCommand="SELECT [quiz_details_id], [question], [option1], [option2], [option3], [option4] FROM [quiz_details] WHERE ([quiz_details_id] = @quiz_details_id)">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="RadioButtonList1" Name="quiz_details_id" 
                                                                    PropertyName="SelectedValue" Type="Decimal" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style4">
                                                        &nbsp;</td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style4">
                                                        &nbsp;</td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        
                                    </td>
                                </tr>
                                </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
                <br />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                                                            <asp:Button ID="Button4" 
                    runat="server" Text="FINISH QUIZ" Visible="False" />
            </td>
        </tr>
    </table>
</asp:Content>

