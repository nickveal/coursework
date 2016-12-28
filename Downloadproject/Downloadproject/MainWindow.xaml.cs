using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Downloadproject
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            download.moveborder.MouseLeftButtonDown += (object sender5, MouseButtonEventArgs e5) => {DragMove(); };
            download.moveimage.MouseLeftButtonDown += (object sender5, MouseButtonEventArgs e5) => { DragMove(); };


        }

        private void closeevent(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void maximizehandler(object sender, RoutedEventArgs e)
        {
            if (WindowState != WindowState.Maximized){
            WindowState = WindowState.Maximized;
            Maximize_Button.Label = "Normal";
            }
            
            else {
                WindowState = WindowState.Normal;
                Maximize_Button.Label = "Maximize";
            }
            
        }

        private void minimizehandler(object sender, RoutedEventArgs e)
        {   
            WindowState = WindowState.Minimized;
        }
    }
}
