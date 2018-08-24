<%@ Page Title="" Language="VB" MasterPageFile="~/faculty.master" AutoEventWireup="false" CodeFile="Fresult.aspx.vb" Inherits="Fresult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 120px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" 
        BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" CellSpacing="2" GridLines="Both" Width="100%">
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <ItemTemplate>
            <table class="style1">
                <tr>
                    <td class="style2">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        Student Name</td>
                    <td>
                        <asp:Label ID="student_nameLabel" runat="server" 
                            Text='<%# Eval("student_name") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        College
                    </td>
                    <td>
                        <asp:Label ID="college_nameLabel" runat="server" 
                            Text='<%# Eval("college_name") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        Course</td>
                    <td>
                        <asp:Label ID="course_nameLabel" runat="server" 
                            Text='<%# Eval("course_name") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        Subject</td>
                    <td>
                        <asp:Label ID="subject_nameLabel" runat="server" 
                            Text='<%# Eval("subject_name") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        Quiz Title</td>
                    <td>
                        <asp:Label ID="quiz_titleLabel" runat="server" 
                            Text='<%# Eval("quiz_title") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        Total Correct</td>
                    <td>
                        <asp:Label ID="total_correctLabel" runat="server" 
                            Text='<%# Eval("total_correct") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        Total Wrong</td>
                    <td>
                        <asp:Label ID="total_wrongLabel" runat="server" 
                            Text='<%# Eval("total_wrong") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        Result Date</td>
                    <td>
                        <asp:Label ID="result_dateLabel" runat="server" 
                            Text='<%# Eval("result_date") %>' />
                    </td>
                </tr>
            </table>
<br />
        </ItemTemplate>
        <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT student.student_name, college.college_name, course.course_name, subject.subject_name, quiz.quiz_title, quiz_result.total_correct, quiz_result.total_wrong, quiz_result.result_date FROM course INNER JOIN college INNER JOIN quiz_result INNER JOIN quiz ON quiz_result.quiz_id = quiz.quiz_id INNER JOIN student ON quiz_result.student_id = student.student_id INNER JOIN subject ON quiz.subject_id = subject.subject_id ON college.college_id = student.college_id ON course.course_id = subject.course_id">
    </asp:SqlDataSource>
</asp:Content>

