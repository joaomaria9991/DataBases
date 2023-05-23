<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form1
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.TextBox1 = New System.Windows.Forms.TextBox()
        Me.TextBox2 = New System.Windows.Forms.TextBox()
        Me.TextBox3 = New System.Windows.Forms.TextBox()
        Me.Botao_Teste_Ligacao = New System.Windows.Forms.Button()
        Me.Botao_Hello_table = New System.Windows.Forms.Button()
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(78, 65)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(39, 15)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "Server"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(78, 97)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(30, 15)
        Me.Label2.TabIndex = 1
        Me.Label2.Text = "User"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(78, 130)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(57, 15)
        Me.Label3.TabIndex = 2
        Me.Label3.Text = "Password"
        '
        'TextBox1
        '
        Me.TextBox1.Location = New System.Drawing.Point(175, 56)
        Me.TextBox1.Name = "TextBox1"
        Me.TextBox1.Size = New System.Drawing.Size(272, 23)
        Me.TextBox1.TabIndex = 3
        Me.TextBox1.Text = "tcp:mednat.ieeta.pt\SQLSERVER,8101"
        '
        'TextBox2
        '
        Me.TextBox2.Location = New System.Drawing.Point(175, 89)
        Me.TextBox2.Name = "TextBox2"
        Me.TextBox2.Size = New System.Drawing.Size(272, 23)
        Me.TextBox2.TabIndex = 4
        Me.TextBox2.Text = "p4g7"
        '
        'TextBox3
        '
        Me.TextBox3.Location = New System.Drawing.Point(175, 122)
        Me.TextBox3.Name = "TextBox3"
        Me.TextBox3.Size = New System.Drawing.Size(272, 23)
        Me.TextBox3.TabIndex = 5
        '
        'Botao_Teste_Ligacao
        '
        Me.Botao_Teste_Ligacao.Location = New System.Drawing.Point(151, 173)
        Me.Botao_Teste_Ligacao.Name = "Botao_Teste_Ligacao"
        Me.Botao_Teste_Ligacao.Size = New System.Drawing.Size(75, 52)
        Me.Botao_Teste_Ligacao.TabIndex = 6
        Me.Botao_Teste_Ligacao.Text = "Teste Ligacao"
        Me.Botao_Teste_Ligacao.UseVisualStyleBackColor = True
        '
        'Botao_Hello_table
        '
        Me.Botao_Hello_table.Location = New System.Drawing.Point(334, 173)
        Me.Botao_Hello_table.Name = "Botao_Hello_table"
        Me.Botao_Hello_table.Size = New System.Drawing.Size(75, 52)
        Me.Botao_Hello_table.TabIndex = 7
        Me.Botao_Hello_table.Text = "Hello table"
        Me.Botao_Hello_table.UseVisualStyleBackColor = True
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(7.0!, 15.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(534, 266)
        Me.Controls.Add(Me.Botao_Hello_table)
        Me.Controls.Add(Me.Botao_Teste_Ligacao)
        Me.Controls.Add(Me.TextBox3)
        Me.Controls.Add(Me.TextBox2)
        Me.Controls.Add(Me.TextBox1)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Name = "Form1"
        Me.Text = "Form1"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents Label1 As Label
    Friend WithEvents Label2 As Label
    Friend WithEvents Label3 As Label
    Friend WithEvents TextBox1 As TextBox
    Friend WithEvents TextBox2 As TextBox
    Friend WithEvents TextBox3 As TextBox
    Friend WithEvents Botao_Teste_Ligacao As Button
    Friend WithEvents Botao_Hello_table As Button
End Class
