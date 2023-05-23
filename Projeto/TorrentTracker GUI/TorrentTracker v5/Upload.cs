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
    public partial class Upload : Form
    {

        String tipo;

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



        public void newTorrent()
        {
            SqlConnection cn = getSGBDConnection();  //criar nova conecção

            if (!verifySGBDConnection(cn))       //verificar a validade da canexão
                return;

            SqlCommand cmd = new SqlCommand("TorrentTracker.Adicionar_Novo_Torrent");        //novo comando que acede à BD
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@tamanho ", textBox2.Text);
            cmd.Parameters.AddWithValue("@nome_torrent ", textBox1.Text);
            cmd.Parameters.AddWithValue("@user_nick ", GetLoginName);
            cmd.Parameters.AddWithValue("@nome_game_program_serie_movie ", textBox4.Text);
            cmd.Parameters.AddWithValue("@os ", comboBox2.Text);
            cmd.Parameters.AddWithValue("@imdb_link ", textBox10.Text);
            cmd.Parameters.AddWithValue("@imdb_ano ", textBox6.Text);
            cmd.Parameters.AddWithValue("@imdb_classificacao", textBox5.Text);
            cmd.Parameters.AddWithValue("@imdb_sinopse", textBox7.Text);
            cmd.Parameters.AddWithValue("@release", comboBox1.Text);
            cmd.Parameters.AddWithValue("@temporada", textBox8.Text);
            cmd.Parameters.AddWithValue("@episodio ", textBox9.Text);
            cmd.Parameters.AddWithValue("@categoria", tipo);







            cmd.Connection = cn;   //esta não percebo bem, mas funcionar

            SqlDataReader reader = cmd.ExecuteReader();   //inicializar a minha variável que percorre a tabela previamente especificada

        }





        public Upload()
        {
            InitializeComponent();
        }

        public static string GetLoginName { get; internal set; }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void Upload_Load(object sender, EventArgs e)
        {



        }

        private void label8_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            newTorrent();

            DialogResult res = MessageBox.Show("Torrent Enviado", "Sucesso", MessageBoxButtons.OK, MessageBoxIcon.Information);
            this.Close();
        }

        private void label9_Click(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox7_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox8_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox9_TextChanged(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {

        }

        private void button3_Click_1(object sender, EventArgs e)
        {
            if (jogo.Checked)
            {
                tipo = "Game";

                label12.Hide();
                textBox10.Hide();
                textBox5.Hide();
                textBox6.Hide();
                textBox7.Hide();
                textBox8.Hide();   //temporada
                textBox9.Hide();  //episodio   
                comboBox1.Hide();


                label5.Hide();
                label6.Hide();
                label7.Hide();
                label8.Hide();
                label9.Hide();
                label10.Hide();

                comboBox2.Show();
                label11.Show();


            }


            if (programa.Checked)
            {
                tipo = "Program";


                label12.Hide();
                textBox10.Hide();

                textBox5.Hide();
                textBox6.Hide();
                textBox7.Hide();
                textBox8.Hide();   //temporada
                textBox9.Hide();  //episodio   
                comboBox1.Hide();


                label5.Hide();
                label6.Hide();
                label7.Hide();
                label8.Hide();
                label9.Hide();


                label10.Hide();

            }



            if (filme.Checked)
            {
                tipo = "Movie";

                textBox5.Show();
                textBox6.Show();
                textBox7.Show();

                comboBox1.Show();


                label5.Show();
                label6.Show();
                label7.Show();
                label10.Show();

                label12.Show();
                textBox10.Show();


                textBox8.Hide();   //temporada
                textBox9.Hide();  //episodio 


                label8.Hide();
                label9.Hide();

                comboBox2.Hide();
                label11.Hide();
            }

            if (serie.Checked)
            {
                tipo = "Serie";
                //| programa.Checked
                textBox5.Show();
                textBox6.Show();
                textBox7.Show();

                comboBox1.Show();


                label5.Show();
                label6.Show();
                label7.Show();


                label8.Show();
                label9.Show();
                textBox8.Show();   //temporada
                textBox9.Show();  //episodio  

                label10.Show();

                label12.Show();
                textBox10.Show();



                comboBox2.Hide();
                label11.Hide();
            }
            
        }

        private void label10_Click(object sender, EventArgs e)
        {

        }

        private void textBox6_TextChanged(object sender, EventArgs e)
        {

        }
    }
}




