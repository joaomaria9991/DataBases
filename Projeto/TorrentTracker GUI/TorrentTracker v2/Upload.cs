using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace TorrentTracker
{
    public partial class Upload : Form
    {
        public Upload()
        {
            InitializeComponent();
        }

        public static string GetLoginName { get; internal set; }
    }
}
