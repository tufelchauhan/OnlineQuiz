Imports System.Data.SqlClient
Partial Class FQuiz
    Inherits System.Web.UI.Page
    Dim cnn As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True")
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim str As String
        str = "insert into quiz values('" & TextBox1.Text & "'," & RadioButtonList1.SelectedValue & "," & TextBox2.Text & ",'" & System.DateTime.Now.Date & "'," & Session("fid") & ")"
        Dim cmd As New SqlCommand(str, cnn)
        cnn.Open()
        cmd.ExecuteNonQuery()
        cnn.Close()
        MsgBox("Quiz Added Successfully", MsgBoxStyle.Information, "Online Quiz")
        Response.Redirect("Fquiz.aspx")

    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Dim str As String
        str = "select total_question from quiz where quiz_id=" & Session("qid") & ""
        Dim cmd As New SqlCommand(str, cnn)
        Dim ds As New Data.DataSet
        Dim da As New SqlDataAdapter(cmd)
        da.Fill(ds)


        str = "select count(*) from quiz_details where quiz_id=" & Session("qid") & ""
        Dim cmd2 As New SqlCommand(str, cnn)
        Dim ds1 As New Data.DataSet
        Dim da1 As New SqlDataAdapter(cmd2)
        da1.Fill(ds1)

        Dim qno As Integer = ds1.Tables(0).Rows(0)(0)
        qno = qno + 1

        If ds1.Tables(0).Rows(0)(0) >= ds.Tables(0).Rows(0)(0) Then
            MsgBox("Limit Exceeds", MsgBoxStyle.Information, "Online Quiz")
            Panel1.Visible = False
        Else
            str = "insert into quiz_details values(" & Session("qid") & ",'" & TextBox3.Text & "','" & TextBox4.Text & "','" & TextBox5.Text & "','" & TextBox6.Text & "','" & TextBox7.Text & "','" & RadioButtonList2.SelectedItem.Text & "'," & qno & ")"
            Dim cmd1 As New SqlCommand(str, cnn)
            cnn.Open()
            cmd1.ExecuteNonQuery()
            cnn.Close()
            MsgBox("Question Added Successfully", MsgBoxStyle.Information, "Online Quiz")
            Response.Redirect("Fquiz.aspx")

        End If
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        Session("qid") = GridView1.SelectedValue
        Panel1.Visible = True
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("fid") = 0 Then
            MsgBox("Please Login As Faculty To Upload Quiz", MsgBoxStyle.Information, "Online Quiz")
            Response.Redirect("VLogin.aspx")
        End If
    End Sub
End Class
