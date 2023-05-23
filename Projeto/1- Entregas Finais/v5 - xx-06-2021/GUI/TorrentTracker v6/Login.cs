using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;


namespace TorrentTracker
{

    public partial class Login : Form

        
    {
        public string loginname;


        public SqlConnection cn;
        public Login()
        {
            InitializeComponent();
            PasswordTextBox.BackColor = Color.FromArgb(171, 208, 153);
            UserTextBox.BackColor = Color.FromArgb(171, 208, 153);
            //removeBG(Icon, LoginBackGround_PictureBox);

        }






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



        public void loadWarnings()
        {
            SqlConnection cn = getSGBDConnection();  //criar nova conecção

            if (!verifySGBDConnection(cn))       //verificar a validade da canexão
                return;

            SqlCommand cmd = new SqlCommand("TorrentTracker.Make_Temp_Tables");        //novo comando que acede à BD
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();


            cmd.Connection = cn;   //esta não percebo bem, mas funcionar

            SqlDataReader reader = cmd.ExecuteReader();   //inicializar a minha variável que percorre a tabela previamente especificada


        }


        private void button1_Click(object sender, EventArgs e)
        {
            loadWarnings();
            //while (true) {
            if (!verifySGBDConnection(cn)) { return; }

                SqlCommand cmd = new SqlCommand("TorrentTracker.LoginProcedure", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@utilizador", UserTextBox.Text);
                cmd.Parameters.AddWithValue("@password", PasswordTextBox.Text);

                SqlDataReader reader = cmd.ExecuteReader();
                int counter = 0;
                string name_to_find = "";


                while (reader.Read())
                {
                    counter++;
                    name_to_find = reader["UserNickName"].ToString();

                }


                if (counter == 1)
                {
                    string message = "Bem Vindo";
                    string caption = "Nice!";
                    MessageBoxButtons buttons = MessageBoxButtons.OK;
                    DialogResult result;

                    // Display 
                    result = MessageBox.Show(message, caption, buttons);
                    if (result == System.Windows.Forms.DialogResult.OK)
                    {
                        Main mainForm = new Main();
                        mainForm.GetLoginName = loginname;
                        mainForm.Show();
                        this.Hide();


                    }
                }
                if (counter != 1)

                {
                    string message1 = "Combinação de User e Password errada";
                    string caption1 = "Nada para ver aqui senhor agente!";
                    MessageBoxButtons buttons1 = MessageBoxButtons.OK;
                    DialogResult result1;

                    // Display
                    result1 = MessageBox.Show(message1, caption1, buttons1);

                    if (result1 == System.Windows.Forms.DialogResult.OK)
                    {
                        Login mainForm = new Login();
                        mainForm.Show();
                        this.Hide();    
                    }


                }



        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void Login_Load(object sender, EventArgs e)
        {
            cn = getSGBDConnection();

        }

        private void user_TextChanged(object sender, EventArgs e)
        {
            loginname = UserTextBox.Text;

        }

        private void password_TextChanged(object sender, EventArgs e)
        {

        }


        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            Registo registoPage = new Registo();
            this.Hide();
            registoPage.Show();
        }
    }
}
