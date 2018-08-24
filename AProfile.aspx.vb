Imports System.Data.SqlClient
Partial Class AProfile
    Inherits System.Web.UI.Page
    Dim cnn As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True")
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim str As String
        str = "update faculty set faculty_name='" & TextBox1.Text & "', mobile=" & TextBox2.Text & ", email='" & TextBox3.Text & "' where faculty_id=" & Session("aid") & ""
        Dim cmd2 As New SqlCommand(str, cnn)
        cnn.Open()
        cmd2.ExecuteNonQuery()
        cnn.Close()
        MsgBox("Profile Updated successfully", MsgBoxStyle.Information, "Online Quiz")
        Response.Redirect("AProfile.aspx")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("aid") = 0 Then
            MsgBox("Please Login As Admin To View Profile", MsgBoxStyle.Information, "Online Quiz")
            Response.Redirect("VLogin.aspx")
        
        End If
        TabContainer1.ActiveTabIndex = 0
        If Not IsPostBack Then
            Dim str As String
            str = "select faculty_name, mobile, email from faculty where faculty_id=" & Session("aid") & ""
            Dim cmd As New SqlCommand(str, cnn)
            Dim ds As New Data.DataSet
            Dim da As New SqlDataAdapter(cmd)
            da.Fill(ds)
            TextBox1.Text = ds.Tables(0).Rows(0)(0)
            TextBox2.Text = ds.Tables(0).Rows(0)(1)
            TextBox3.Text = ds.Tables(0).Rows(0)(2)

        End If

        

    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Dim str As String
        str = Server.MapPath("faculty_images")
        If FileUpload1.HasFile = True Then
            str = str & "/" & FileUpload1.FileName
            FileUpload1.SaveAs(str)
            str = "update faculty set image_name='" & FileUpload1.FileName & "' where faculty_id=" & Session("aid") & ""
            Dim cmd3 As New SqlCommand(str, cnn)
            cnn.Open()
            cmd3.ExecuteNonQuery()
            cnn.Close()
            MsgBox("Profile Picture Changed Successfully", MsgBoxStyle.Information, "Online Quiz")
            Response.Redirect("AProfile.aspx")

        Else
            MsgBox("Image not selected", MsgBoxStyle.Information, "Online Quiz")
            TabContainer1.ActiveTabIndex = 2
        End If
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click

        Dim str As String
        str = "select password from faculty where faculty_id=" & Session("aid") & ""
        Dim cmd4 As New SqlCommand(str, cnn)
        Dim ds4 As New Data.DataSet
        Dim da4 As New SqlDataAdapter(cmd4)
        da4.Fill(ds4)
        If ds4.Tables(0).Rows(0)(0) = TextBox4.Text Then
            If TextBox5.Text = TextBox6.Text Then
                str = "update faculty set password='" & TextBox6.Text & "' where faculty_id=" & Session("aid") & ""
                Dim cmd5 As New SqlCommand(str, cnn)
                cnn.Open()
                cmd5.ExecuteNonQuery()
                cnn.Close()
                MsgBox("Password Changed successfully", MsgBoxStyle.Information, "Online Quiz")
                Response.Redirect("AProfile.aspx")

            Else
                MsgBox("New Password does not match", MsgBoxStyle.Information, "Online Quiz")
                TabContainer1.ActiveTabIndex = 3
            End If
        Else
            MsgBox("Invalid Old Password", MsgBoxStyle.Information, "Online Quiz")
            TabContainer1.ActiveTabIndex = 3
        End If

    End Sub
End Class
