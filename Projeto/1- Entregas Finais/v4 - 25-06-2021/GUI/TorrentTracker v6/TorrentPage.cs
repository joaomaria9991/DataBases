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
       public String text = "";
       public String selectedID = "";

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



            while (reader.Read())     //a variável de leitura percorre a tabela 

            {
                ContentTorrent ct = new ContentTorrent();     //inicializar a variável da classe que vai ser lida e posteriormente terá os seus atributos preenchidos no while abaixo
                ct.NomeContentTorrent = reader["NomeContentTorrent"].ToString();   //standart stuff se tiveres a classe criada 
                ct.ID_ContentTorrent = reader["ID_ContentTorrent"].ToString();


                listBox1.Items.Add(ct); //se quiser adicionar um item em específico ct -- ct.NomeContentTorrent
            }

        }



        public void ShowLeech()
        {
            SqlConnection cn = getSGBDConnection();  //criar nova conecção

            if (!verifySGBDConnection(cn))       //verificar a validade da canexão
                return;

            SqlCommand cmd = new SqlCommand("TorrentTracker.Torrent_leechers");        //novo comando que acede à BD


            cmd.Connection = cn;   //esta não percebo bem, mas funcionar
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            String leech = text;
            cmd.Parameters.AddWithValue("@id_torrent", selectedID);
            SqlDataReader reader = cmd.ExecuteReader();   //inicializar a minha variável que percorre a tabela previamente especificada


            while (reader.Read())     //a variável de leitura percorre a tabela 

            {
                ContentTorrent ct = new ContentTorrent();     //inicializar a variável da classe que vai ser lida e posteriormente terá os seus atributos preenchidos no while abaixo
                ct.NomeContentTorrent = reader["Return Value"].ToString();   //standart stuff se tiveres a classe criada 


                textBox6.Text+=ct.NomeContentTorrent.ToString();   
            }

        }


        public void nameToId()
        {
            SqlConnection cn = getSGBDConnection();  //criar nova conecção

            if (!verifySGBDConnection(cn))       //verificar a validade da canexão
                return;

            SqlCommand cmd = new SqlCommand("nameToID");        //novo comando que acede à BD


            cmd.Connection = cn;   //esta não percebo bem, mas funcionar
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            String name = text;
            cmd.Parameters.AddWithValue("@name", name);
            SqlDataReader reader = cmd.ExecuteReader();   //inicializar a minha variável que percorre a tabela previamente especificada



            while (reader.Read())     //a variável de leitura percorre a tabela 

            {
                ContentTorrent ct = new ContentTorrent();     //inicializar a variável da classe que vai ser lida e posteriormente terá os seus atributos preenchidos no while abaixo
                ct.ID_ContentTorrent = reader["ID_ContentTorrent"].ToString();   //standart stuff se tiveres a classe criada 
                selectedID = ct.ID_ContentTorrent;

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

            
            this.text = listBox1.GetItemText(listBox1.SelectedItem);
            string S = text;
            //System.Diagnostics.Debug.WriteLine(text);
            nameToId();
            //System.Diagnostics.Debug.WriteLine(selectedID);

            if (S!="")
            {
                TorrentSpecific torrentSpecificPage = new TorrentSpecific();
                torrentSpecificPage.GetLoginName = this.GetLoginName;  //meter o login name dentro do profile;
                torrentSpecificPage.Show();
            }


            //MessageBox.Show(text);
            textBox6.Clear();
            ShowLeech();


        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void textBox5_TextChanged(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void button3_Click_1(object sender, EventArgs e)
        {
            TorrentSpecific torrentSpecificPage = new TorrentSpecific();
            torrentSpecificPage.GetLoginName = this.GetLoginName;  //meter o login name dentro do profile;
            torrentSpecificPage.Show();

        }

        private void textBox6_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
