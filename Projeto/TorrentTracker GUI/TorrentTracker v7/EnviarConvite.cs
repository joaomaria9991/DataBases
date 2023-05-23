using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace TorrentTracker
{
    public partial class EnviarConvite : Form
    {

        private SqlConnection getSGBDConnection()
        {
            return new SqlConnection(@"Data Source = tcp:mednat.ieeta.pt\SQLSERVER,8101 ; " + "Initial Catalog = p4g7 ; uid = p4g7 ; " + "password = 123AB@-=:");

        }
        public bool verifySGBDConnection(SqlConnection cn)
        {
            if (cn == null)
                cn = getSGBDConnection();

            if (cn.State != ConnectionState.Open)
                cn.Open();

            return cn.State == ConnectionState.Open;

        }
        public void SendInvite()
        {
            SqlConnection cn = getSGBDConnection();  //criar nova conecção

            if (!verifySGBDConnection(cn))       //verificar a validade da canexão
                return;

            SqlCommand cmd = new SqlCommand("TorrentTracker.EnviarConvite");        //novo comando que acede à BD
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            String nickname = GetLoginName;
            cmd.Parameters.AddWithValue("@user_nick", GetLoginName);
            cmd.Parameters.AddWithValue("@email_envio", textBox1.Text);
            
            System.Diagnostics.Debug.WriteLine(textBox1);


            cmd.Connection = cn;   //esta não percebo bem, mas funcionar

            SqlDataReader reader = cmd.ExecuteReader();   //inicializar a minha variável que percorre a tabela previamente especificada

            TorrentTracker.UserComents ct = new TorrentTracker.UserComents();     //inicializar a variável da classe que vai ser lida e posteriormente terá os seus atributos preenchidos no while abaixo


            while (reader.Read())     //a variável de leitura percorre a tabela 

            {
                ct.UserNickName = reader["return Value"].ToString();   //standart stuff se tiveres a classe criada 
            }

             returnBox.Text = ct.UserNickName.ToString();
            
        }



        public EnviarConvite()
        {
            InitializeComponent();
        }

        public string GetLoginName { get; internal set; }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            returnBox.Show();
        }

        private void returnBox_TextChanged(object sender, EventArgs e)
        {

        }

        private void EnviarConvite_Load(object sender, EventArgs e)
        {
            returnBox.Hide();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            SendInvite();
        }
    }
}
