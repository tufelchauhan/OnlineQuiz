Imports System.Data.SqlClient
Partial Class FProfile
    Inherits System.Web.UI.Page
    Dim cnn As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True")

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim str As String
        str = Server.MapPath("faculty_images")
        If FileUpload1.HasFile = True Then
            str = str & "/" & FileUpload1.FileName
            FileUpload1.SaveAs(str)
            str = "update faculty set image_name='" & FileUpload1.FileName & "' where faculty_id=" & Session("fid") & ""
            Dim cmd As New SqlCommand(str, cnn)
            cnn.Open()
            cmd.ExecuteNonQuery()
            cnn.Close()
            MsgBox("Image Changed Successfully", MsgBoxStyle.Information, "Online Quiz")
            Response.Redirect("FProfile.aspx")

        Else
            MsgBox("Image not selected", MsgBoxStyle.Information, "Online Quiz")
            TabContainer1.ActiveTabIndex = 2
        End If
      End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Dim str As String
        str = "select password from faculty where faculty_id=" & Session("fid") & ""
        Dim cmd As New SqlCommand(str, cnn)
        Dim ds As New Data.DataSet
        Dim da As New SqlDataAdapter(cmd)
        da.Fill(ds)
        If ds.Tables(0).Rows(0)(0) = TextBox1.Text Then
            If TextBox2.Text = TextBox3.Text Then
                str = "update faculty set password='" & TextBox3.Text & "' where faculty_id=" & Session("fid") & ""
                Dim cmd1 As New SqlCommand(str, cnn)
                cnn.Open()
                cmd1.ExecuteNonQuery()
                cnn.Close()
                MsgBox("Password Changed Successfully", MsgBoxStyle.Information, "Online Quiz")
                Response.Redirect("FProfile.aspx")
            Else
                MsgBox("New Password does not match", MsgBoxStyle.Information, "Online Quiz")
                TabContainer1.ActiveTabIndex = 3
            End If
        Else
            MsgBox("Invalid Old Password", MsgBoxStyle.Information, "Online Quiz")
            TabContainer1.ActiveTabIndex = 3
        End If
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        Dim str As String
        str = "update faculty set faculty_name='" & TextBox4.Text & "',mobile=" & TextBox5.Text & ",email='" & TextBox6.Text & "' where faculty_id=" & Session("fid") & ""
        Dim cmd As New SqlCommand(str, cnn)
        cnn.Open()
        cmd.ExecuteNonQuery()
        cnn.Close()
        MsgBox("Profile Edited Successfully", MsgBoxStyle.Information, "Online Quiz")
        Response.Redirect("Fprofile.aspx")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("fid") = 0 Then
            MsgBox("Please Login As Faculty To View Profile", MsgBoxStyle.Information, "Online Quiz")
            Response.Redirect("VLogin.aspx")
        End If
        TabContainer1.ActiveTabIndex = 0
        If Not IsPostBack Then
            Dim str As String
            str = "select faculty_name,mobile,email from faculty where faculty_id=" & Session("fid") & ""
            Dim cmd As New SqlCommand(str, cnn)
            Dim ds As New Data.DataSet
            Dim da As New SqlDataAdapter(cmd)
            da.Fill(ds)
            If ds.Tables(0).Rows.Count > 0 Then
                TextBox4.Text = ds.Tables(0).Rows(0)(0)
                TextBox5.Text = ds.Tables(0).Rows(0)(1)
                TextBox6.Text = ds.Tables(0).Rows(0)(2)
            End If

        End If
    End Sub
End Class

