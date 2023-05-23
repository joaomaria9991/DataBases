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
    public partial class TorrentPage : Form
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


        public void SearchContentTorrent()
        {
            SqlConnection cn = getSGBDConnection();  //criar nova conecção

            if (!verifySGBDConnection(cn))       //verificar a validade da canexão
                return;

            SqlCommand cmd = new SqlCommand();        //novo comando que acede à BD
            cmd.CommandText = "SELECT * FROM TorrentTracker.ContentTorrent WHERE NomeContentTorrent LIKE"+"'%"+search.Text+"%'"; //trocar por sp
            cmd.Connection = cn;   //esta não percebo bem, mas funcionar

            SqlDataReader reader = cmd.ExecuteReader();   //inicializar a minha variável que percorre a tabela previamente especificada
            listBox1.Items.Clear();                       //limpar a lista para não ficar cheia de lixo
            ContentTorrent ct = new ContentTorrent();     //inicializar a variável da classe que vai ser lida e posteriormente terá os seus atributos preenchidos no while abaixo



            while (reader.Read())     //a variável de leitura percorre a tabela 

            {
                ct.NomeContentTorrent = reader["NomeContentTorrent"].ToString();   //standart stuff se tiveres a classe criada 
                ct.ID_ContentTorrent = reader["ID_ContentTorrent"].ToString();


                listBox1.Items.Add(ct); //se quiser adicionar um item em específico ct -- ct.NomeContentTorrent
            }



        }


        public TorrentPage()
        {
            InitializeComponent();
        }

        public string GetLoginName { get; internal set; }

        private void button1_Click(object sender, EventArgs e)
        {
            SearchContentTorrent();
            System.Diagnostics.Debug.WriteLine(search.Text);

        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void TorrentPage_Load(object sender, EventArgs e)
        {
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
