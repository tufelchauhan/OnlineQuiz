Imports System.Data.SqlClient
Partial Class Squiz
    Inherits System.Web.UI.Page
    Dim cnn As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True")


  
    Protected Sub DataList1_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles DataList1.ItemCommand
        Dim ans As String
        Dim rb As RadioButtonList
        Dim lb As Label
        Dim str As String
        lb = e.Item.FindControl("quiz_details_idLabel")
        rb = e.Item.FindControl("RadioButtonList2")

        str = "select * from Quiz_Answer where quiz_details_id=" & Session("temp") & " and student_id=" & Session("sid") & ""
        Dim cmd3 As New SqlCommand(str, cnn)
        Dim ds1 As New Data.DataSet
        Dim da1 As New SqlDataAdapter(cmd3)
        da1.Fill(ds1)
        MsgBox(ds1.Tables(0).Rows(0)(0))

        If e.CommandName = "btn" Then
            '            MsgBox(rb.SelectedItem.ToString)

            str = "select correct_option from quiz_details where quiz_details_id=" & lb.Text & ""
            Dim cmd As New SqlCommand(str, cnn)
            Dim ds As New Data.DataSet
            Dim da As New SqlDataAdapter(cmd)
            da.Fill(ds)
            If ds.Tables(0).Rows(0)(0) = rb.SelectedItem.ToString Then
                ans = "true"
            Else
                ans = "false"
            End If

            If ds1.Tables(0).Rows.Count > 0 Then
                str = "update Quiz_Answer set answer='" & rb.SelectedItem.ToString & "',is_correct='" & ans & "' where quiz_details_id=" & lb.Text & " and student_id=" & Session("sid") & ""
                Dim cmd4 As New SqlCommand(str, cnn)
                cnn.Open()
                cmd4.ExecuteNonQuery()
                cnn.Close()

            Else
                str = "insert into Quiz_Answer values(" & lb.Text & "," & Session("sid") & ",'" & rb.SelectedItem.ToString & "','" & ans & "')"
                Dim cmd1 As New SqlCommand(str, cnn)
                cnn.Open()
                cmd1.ExecuteNonQuery()
                cnn.Close()
            End If

        End If
    End Sub

    Protected Sub RadioButtonList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList1.SelectedIndexChanged
        Panel1.Visible = True
        Panel2.Visible = True
        RadioButtonList1.Visible = True
        Dim str As String
        Session("temp") = RadioButtonList1.SelectedValue
        str = "select * from Quiz_Answer where quiz_details_id=" & Session("temp") & " and student_id=" & Session("sid") & ""
        Dim cmd3 As New SqlCommand(Str, cnn)
        Dim ds1 As New Data.DataSet
        Dim da1 As New SqlDataAdapter(cmd3)
        da1.Fill(ds1)
        Label1.Text = RadioButtonList1.SelectedValue

        If ds1.Tables(0).Rows.Count > 0 Then
            If ds1.Tables(0).Rows(0)(3) = "Option 1" Then
                RadioButtonList2.SelectedIndex = 0

            ElseIf ds1.Tables(0).Rows(0)(3) = "Option 2" Then
                RadioButtonList2.SelectedIndex = 1
            ElseIf ds1.Tables(0).Rows(0)(3) = "Option 3" Then
                RadioButtonList2.SelectedIndex = 2

            ElseIf ds1.Tables(0).Rows(0)(3) = "Option 4" Then
                RadioButtonList2.SelectedIndex = 3

            End If
        Else
            RadioButtonList2.SelectedIndex = -1
        End If
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        Button1.CausesValidation = False
        Panel1.Visible = False
        GridView1.Visible = True
        Panel2.Visible = True
        RadioButtonList1.Visible = True
        Button4.Visible = True
        Dim str As String
        Dim ans As String
        str = "select * from Quiz_Answer where quiz_details_id=" & Session("temp") & " and student_id=" & Session("sid") & ""
        Dim cmd3 As New SqlCommand(str, cnn)
        Dim ds1 As New Data.DataSet
        Dim da1 As New SqlDataAdapter(cmd3)
        da1.Fill(ds1)


        str = "select correct_option from quiz_details where quiz_details_id=" & Label1.Text & ""
        Dim cmd As New SqlCommand(Str, cnn)
        Dim ds As New Data.DataSet
        Dim da As New SqlDataAdapter(cmd)
        da.Fill(ds)
        If ds.Tables(0).Rows(0)(0) = RadioButtonList2.SelectedItem.ToString Then
            ans = "true"
        Else
            ans = "false"
        End If


        If ds1.Tables(0).Rows.Count > 0 Then
            str = "update Quiz_Answer set answer='" & RadioButtonList2.SelectedItem.ToString & "',is_correct='" & ans & "' where quiz_details_id=" & Label1.Text & " and student_id=" & Session("sid") & ""
            Dim cmd4 As New SqlCommand(str, cnn)
            cnn.Open()
            cmd4.ExecuteNonQuery()
            cnn.Close()

        Else
            str = "insert into Quiz_Answer values(" & Label1.Text & "," & Session("sid") & ",'" & RadioButtonList2.SelectedItem.ToString & "','" & ans & "')"
            Dim cmd1 As New SqlCommand(str, cnn)
            cnn.Open()
            cmd1.ExecuteNonQuery()
            cnn.Close()
        End If
        

    End Sub

   

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        GridView1.Visible = True

    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click
        Dim str As String
        Dim c As Integer
        Dim w As Integer
        str = "SELECT     Quiz_Answer.quiz_answer_id, Quiz_Answer.is_correct FROM Quiz_Answer INNER JOIN quiz_details ON Quiz_Answer.quiz_details_id = quiz_details.quiz_details_id WHERE (quiz_details.quiz_id = " & Session("quiz_id") & ") and (quiz_answer.student_id=" & Session("sid") & ") "
        Dim cmd As New SqlCommand(str, cnn)
        Dim ds As New Data.DataSet
        Dim da As New SqlDataAdapter(cmd)
        da.Fill(ds)
        For i = 0 To ds.Tables(0).Rows.Count - 1
            If ds.Tables(0).Rows(i)(1) = "True" Then
                c = c + 1
            Else
                w = w + 1
            End If
        Next
        MsgBox("Total Attempted = " & ds.Tables(0).Rows.Count, MsgBoxStyle.Information, "Online Quiz")

        MsgBox("Total Correct = " & c, MsgBoxStyle.Information, "Online Quiz")
        MsgBox("Total Wrong = " & w, MsgBoxStyle.Information, "Online Quiz")
        str = "insert into quiz_result values(" & Session("quiz_id") & "," & Session("sid") & "," & c & "," & w & ",'" & System.DateTime.Today & "')"
        Dim cmd1 As New SqlCommand(str, cnn)
        cnn.Open()
        cmd1.ExecuteNonQuery()
        cnn.Close()
        MsgBox("Finished", MsgBoxStyle.Information, "Online Quiz")
        Response.Redirect("Squiz.aspx")
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        Panel2.Visible = True
        RadioButtonList1.Visible = True

        Dim str As String
        Session("quiz_id") = GridView1.SelectedValue
        str = "SELECT quiz.quiz_id FROM quiz INNER JOIN quiz_details ON quiz.quiz_id = quiz_details.quiz_id INNER JOIN Quiz_Answer ON quiz_details.quiz_details_id = Quiz_Answer.quiz_details_id where Quiz_Answer.student_id=" & Session("sid") & " and quiz_details.quiz_id=" & Session("quiz_id") & ""
        Dim cmd As New SqlCommand(str, cnn)
        Dim ds As New Data.DataSet
        Dim da As New SqlDataAdapter(cmd)
        da.Fill(ds)
        If ds.Tables(0).Rows.Count > 0 Then
            MsgBox("Sorry you have already played", MsgBoxStyle.Information, "Online Quiz")
            Response.Redirect("Squiz.aspx")
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("sid") = 0 Then
            MsgBox("Please Login as Student To Play Quiz", MsgBoxStyle.Information, "Online Quiz")
            Response.Redirect("Vlogin.aspx")
            Panel1.Visible = False
            GridView1.Visible = True
            Panel2.Visible = True
            RadioButtonList1.Visible = True
            Button4.Visible = True
        End If
    End Sub
End Class
