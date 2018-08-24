Imports System.Data.SqlClient
Partial Class VLogin
    Inherits System.Web.UI.Page
    Dim cnn As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True")

    Protected Sub Login1_Authenticate(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.AuthenticateEventArgs) Handles Login1.Authenticate
        Dim str As String
        str = "select * from student where email='" & Login1.UserName & "' and password='" & Login1.Password & "'"
        Dim cmd As New SqlCommand(str, cnn)
        Dim ds As New Data.DataSet
        Dim da As New SqlDataAdapter(cmd)
        da.Fill(ds)
        If ds.Tables(0).Rows.Count > 0 Then
            Session("sid") = ds.Tables(0).Rows(0)(0)
            Response.Redirect("SProfile.aspx")
        Else
            str = "select * from faculty where email='" & Login1.UserName & "' and password='" & Login1.Password & "' and is_admin='False'"
            Dim cmd1 As New SqlCommand(str, cnn)
            Dim ds1 As New Data.DataSet
            Dim da1 As New SqlDataAdapter(cmd1)
            da1.Fill(ds1)
            If ds1.Tables(0).Rows.Count > 0 Then
                Session("fid") = ds1.Tables(0).Rows(0)(0)
                Response.Redirect("FProfile.aspx")
            Else
                str = "select * from faculty where email='" & Login1.UserName & "' and password='" & Login1.Password & "' and is_admin='True'"
                Dim cmd2 As New SqlCommand(str, cnn)
                Dim ds2 As New Data.DataSet
                Dim da2 As New SqlDataAdapter(cmd2)
                da2.Fill(ds2)
                If ds2.Tables(0).Rows.Count > 0 Then
                    Session("aid") = ds2.Tables(0).Rows(0)(0)
                    Response.Redirect("AProfile.aspx")
                Else
                    MsgBox("Invalid Username and Password", MsgBoxStyle.Information, "Online Quiz")
                End If
            End If
        End If
    End Sub

  
End Class
