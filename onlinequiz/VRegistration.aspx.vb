Imports System.Data.SqlClient

Partial Class VReg
    Inherits System.Web.UI.Page
    Dim cnn As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True")
        Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
            Dim str As String
            str = Server.MapPath("stud_images")
            If FileUpload1.HasFile = True Then
                str = str & "/" & FileUpload1.FileName
                FileUpload1.SaveAs(str)
            End If
        str = "insert into student values('" & TextBox1.Text & "','" & RadioButtonList1.SelectedValue & "'," & DropDownList1.SelectedValue & "," & DropDownList4.SelectedValue & ",'" & TextBox2.Text & "','" & TextBox3.Text & "','" & TextBox4.Text & "','" & TextBox5.Text & "','" & TextBox7.Text & "','" & FileUpload1.FileName & "')"
            Dim cmd As New SqlCommand(str, cnn)
            cnn.Open()
            cmd.ExecuteNonQuery()
            cnn.Close()
        MsgBox("Registration Successful", MsgBoxStyle.Information, "Online Quiz")
            Response.Redirect("Vlogin.aspx")
        End Sub

        Protected Sub RadioButtonList2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList2.SelectedIndexChanged
            If RadioButtonList2.SelectedItem.Text = "Student" Then
                MultiView1.ActiveViewIndex = 0
            Else
                MultiView1.ActiveViewIndex = 1
            End If
        End Sub

        Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
            Dim str As String
            str = Server.MapPath("faculty_images")
            If FileUpload2.HasFile = True Then
                str = str & "/" & FileUpload2.FileName
                FileUpload2.SaveAs(str)
            End If
        str = "insert into faculty values('" & TextBox8.Text & "','" & RadioButtonList3.SelectedItem.Text & "'," & DropDownList3.SelectedValue & "," & TextBox9.Text & ",'" & TextBox10.Text & "','" & TextBox12.Text & "','" & FileUpload2.FileName & "','False')"
            Dim cmd As New SqlCommand(str, cnn)
            cnn.Open()
            cmd.ExecuteNonQuery()
            cnn.Close()
        MsgBox("Regisration Successful", MsgBoxStyle.Information, "Online Quiz")
            Response.Redirect("Vlogin.aspx")
        End Sub
    End Class




