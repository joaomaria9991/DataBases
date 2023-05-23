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
    public partial class Main : Form
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


        private int currentContentTorrent;


        public string GetLoginName {
            get;
            set;
        }

        public Main()
        {
            InitializeComponent();
        }

        private void Main_Load(object sender, EventArgs e)
        {
            DisplayName.Text = GetLoginName;
            ShowRole();
            //ShowContentTorrent();

            if (role.Text != "Uploader" && role.Text!="Admin")
            {
                button7.Hide();
            }


            if (role.Text != "Uploader")
            {
                AddTorrent.Hide();
            }


        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void listView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void richTextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Upload UploadPage = new Upload();
            Upload.GetLoginName = this.GetLoginName;  //meter o login name dentro do profile;
            UploadPage.Show();
        }


        //public void ShowContentTorrent()
        //{
        //   SqlConnection cn = getSGBDConnection();  //criar nova conecção

        //    if (!verifySGBDConnection(cn))       //verificar a validade da canexão
        //        return;

        //    SqlCommand cmd = new SqlCommand();        //novo comando que acede à BD
        //    cmd.CommandText="SELECT * FROM TorrentTracker.ContentTorrent"; //trocar por sp
        //    cmd.Connection = cn;   //esta não percebo bem, mas funcionar

        //    SqlDataReader reader = cmd.ExecuteReader();   //inicializar a minha variável que percorre a tabela previamente especificada
        //    listBox1.Items.Clear();                       //limpar a lista para não ficar cheia de lixo
        //    ContentTorrent ct = new ContentTorrent();     //inicializar a variável da classe que vai ser lida e posteriormente terá os seus atributos preenchidos no while abaixo



        //    while (reader.Read())     //a variável de leitura percorre a tabela 

        //    {
        //        ct.NomeContentTorrent = reader["NomeContentTorrent"].ToString();   //standart stuff se tiveres a classe criada 
        //        ct.ID_ContentTorrent = reader["ID_ContentTorrent"].ToString();
        //        ct.Tamanho = reader["Tamanho"].ToString();
        //        ct.DataHoraAdicao = reader["DataHoraAdicao"].ToString();
        //        ct.NFO = reader["NFO"].ToString();
        //        ct.Descricao = reader["Descricao"].ToString();
        //        ct.FreeLeechDataHoraLimite = reader["FreeleeechDataHoraLimite"].ToString();

        //        listBox1.Items.Add(ct); //se quiser adicionar um item em específico ct -- ct.NomeContentTorrent
        //    }

        //    if (listBox1.Items.Count == 0 | currentContentTorrent < 0)
        //        return;

          
        //}

        public void SearchContentTorrent()
        {
            SqlConnection cn = getSGBDConnection();  //criar nova conecção

            if (!verifySGBDConnection(cn))       //verificar a validade da canexão
                return;

            SqlCommand cmd = new SqlCommand();        //novo comando que acede à BD
            cmd.CommandText = "SELECT * FROM TorrentTracker.ContentTorrent WHERE NomeContentTorrent LIKE" + "'%" + search.Text + "%'"; //trocar por sp
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



        public void ShowRole()
        {
            SqlConnection cn = getSGBDConnection();  //criar nova conecção

            if (!verifySGBDConnection(cn))       //verificar a validade da canexão
                return;

            SqlCommand cmd = new SqlCommand("TorrentTracker.UserRole");        //novo comando que acede à BD


            cmd.Connection = cn;   //esta não percebo bem, mas funcionar
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@user_nick", GetLoginName);
            SqlDataReader reader = cmd.ExecuteReader();   //inicializar a minha variável que percorre a tabela previamente especificada


            while (reader.Read())     //a variável de leitura percorre a tabela 

            {
                ContentTorrent ct = new ContentTorrent();     //inicializar a variável da classe que vai ser lida e posteriormente terá os seus atributos preenchidos no while abaixo
                ct.NomeContentTorrent = reader["Return Value"].ToString();   //standart stuff se tiveres a classe criada 


                role.Text += ct.NomeContentTorrent.ToString();
            }

        }


        private void torrents_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            
            Profile ProfileForm = new Profile();
            ProfileForm.GetLoginName = this.GetLoginName;  //meter o login name dentro do profile;
          


            ProfileForm.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            TorrentPage torrentPage = new TorrentPage();
            torrentPage.GetLoginName = this.GetLoginName;  //meter o login name dentro do profile;
            torrentPage.Show();


        }

        private void button3_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.text = listBox1.GetItemText(listBox1.SelectedItem);
            string S = text;
            System.Diagnostics.Debug.WriteLine(text);
            nameToId();
            System.Diagnostics.Debug.WriteLine(selectedID);

            String ID = selectedID;

            if (S != "")
            {
                TorrentSpecific torrentSpecificPage = new TorrentSpecific();
                torrentSpecificPage.GetLoginName = this.GetLoginName;  //meter o login name dentro do profile;
                TorrentSpecific.GetID = ID;
                torrentSpecificPage.Show();
            }
        }

        private void search_TextChanged(object sender, EventArgs e)
        {

        }

        private void button4_Click(object sender, EventArgs e)
        {
            SearchContentTorrent();
        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            Premios PremiosPage = new Premios();
            Premios.GetLoginName = this.GetLoginName;  //meter o login name dentro do profile;
            PremiosPage.Show();

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged_1(object sender, EventArgs e)
        {

        }

        private void button7_Click(object sender, EventArgs e)
        {

        }
    }
}
