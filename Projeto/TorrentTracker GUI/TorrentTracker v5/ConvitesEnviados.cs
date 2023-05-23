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
    public partial class ConvitesEnviados : Form
    {
        public ConvitesEnviados()
        {
            InitializeComponent();
        }

        public string GetLoginName { get; internal set; }


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



        public void ShowUserComents()
        {
            SqlConnection cn = getSGBDConnection();  //criar nova conecção

            if (!verifySGBDConnection(cn))       //verificar a validade da canexão
                return;

            SqlCommand cmd = new SqlCommand("TorrentTracker.ConvitesEnviados");        //novo comando que acede à BD
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            String nickname = GetLoginName;
            cmd.Parameters.AddWithValue("@user_nick", nickname);


            cmd.Connection = cn;   //esta não percebo bem, mas funcionar

            SqlDataReader reader = cmd.ExecuteReader();   //inicializar a minha variável que percorre a tabela previamente especificada

            while (reader.Read())     //a variável de leitura percorre a tabela 

            {


                TorrentTracker.Convite ct = new TorrentTracker.Convite();     //inicializar a variável da classe que vai ser lida e posteriormente terá os seus atributos preenchidos no while abaixo
                ct.DestinatarioEmail1 = reader["DestinatarioEmail"].ToString();   //standart stuff se tiveres a classe criada 
                ct.DataEnvio1 = reader["DataEnvio"].ToString();

                listBox1.Items.Add(ct);

            }

        }





        private void ConvitesEnviados_Load(object sender, EventArgs e)
        {
            ShowUserComents();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
