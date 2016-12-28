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
    /// Interaction logic for Downloadcontrol.xaml
    /// </summary>
    public partial class Downloadcontrol : UserControl{
        RadialGradientBrush radialGradient = new RadialGradientBrush();

        public enum State { Ready,Running,Paused,Done };
        private State StateStatus;

        public static readonly RoutedEvent CancelRequestedEvent = EventManager.RegisterRoutedEvent(
            "CancelRequestedEvent", RoutingStrategy.Bubble, typeof(RoutedEventHandler), typeof(Downloadcontrol));

        public static readonly RoutedEvent PauseRequestedEvent = EventManager.RegisterRoutedEvent(
            "PauseRequestedEvent", RoutingStrategy.Bubble, typeof(RoutedEventHandler), typeof(Downloadcontrol));

        public static readonly RoutedEvent UnpauseRequestedEvent = EventManager.RegisterRoutedEvent(
            "UnpauseRequestedEvent", RoutingStrategy.Bubble, typeof(RoutedEventHandler), typeof(Downloadcontrol));

        public event RoutedEventHandler CancelRequested{
            add { AddHandler(CancelRequestedEvent, value); }
            remove { RemoveHandler(CancelRequestedEvent, value); }
        }

        public event RoutedEventHandler PauseRequested{
            add { AddHandler(PauseRequestedEvent, value); }
            remove { RemoveHandler(PauseRequestedEvent, value); }
        }

        public event RoutedEventHandler UnpauseRequested
        {
            add { AddHandler(UnpauseRequestedEvent, value); }
            remove { RemoveHandler(UnpauseRequestedEvent, value); }
        }

        public Downloadcontrol(){
            InitializeComponent();
            StateStatus = State.Ready;
        }

        private void HandleMouseEnter(object sender, MouseEventArgs e){
            radialGradient.RadiusX = 0.5;
            radialGradient.RadiusY = 0.5;
            radialGradient.GradientStops.Add(new GradientStop(Color.FromRgb(255,0,0),0.0));
            radialGradient.GradientStops.Add(new GradientStop(Colors.Black, 2.0));
            CancelButton.Fill = radialGradient;
            Pausebutton.Stroke = Brushes.White;
        }

        private void HandleMouseLeave(object sender, MouseEventArgs e){
            CancelButton.Fill = Brushes.Red;
            CancelButton.Stroke = Brushes.Black;
        }

        private void HandleMouseLUPCancel(object sender, MouseButtonEventArgs e){
            if (StateStatus == State.Paused || StateStatus == State.Running)
            {
                RoutedEventArgs CancelRequestedArgs = new RoutedEventArgs(CancelRequestedEvent, this);
                RaiseEvent(CancelRequestedArgs);
            }
            else
            {
                CancelButton.IsEnabled = false;
            }
        }

        public void setState(int v)
        {
            if (v == 0)
            {
                StateStatus = State.Ready;
            }
            else if (v == 1)
            {
                StateStatus = State.Running;
            }

            else if (v == 2)
            {
                StateStatus = State.Paused;
            }
            else
            {
                StateStatus = State.Done;
            }
        }

        

        private void HandleMouseEnterPauseButton(object sender, MouseEventArgs e)
        {
            ImageBrush brush = new ImageBrush();
            brush.ImageSource = new BitmapImage(new Uri(@"F:\Button1.png", UriKind.Relative));
            Pausebutton.Fill = brush;
            Pausebutton.Stroke = Brushes.White;
        }

        private void HandleMouseLeavePauseButton(object sender, MouseEventArgs e)
        {
            ImageBrush brush = new ImageBrush();
            brush.ImageSource = new BitmapImage(new Uri(@"F:\Button0.png", UriKind.Relative));
            Pausebutton.Fill = brush;
            Pausebutton.Stroke = Brushes.Black;

        }

        private void HandleMousePause(object sender, MouseButtonEventArgs e)
        {
            if (StateStatus == State.Running)
            {
                RoutedEventArgs PauseRequestedArgs = new RoutedEventArgs(PauseRequestedEvent, this);
                RaiseEvent(PauseRequestedArgs);
                Resume_Button.IsEnabled = true;
                Pausebutton.IsEnabled = false;

            }
        }

        private void HandleMouseEnterResume(object sender, MouseEventArgs e)
        {
            ImageBrush brush = new ImageBrush();
            brush.ImageSource = new BitmapImage(new Uri(@"F:\Button3.png", UriKind.Relative));
            Resume_Button.Fill = brush;
        }

        private void HandleMouseLeaveResume(object sender, MouseEventArgs e)
        {
            ImageBrush brush = new ImageBrush();
            brush.ImageSource = new BitmapImage(new Uri(@"F:\Button2.png", UriKind.Relative));
            Resume_Button.Fill = brush;
        }

        private void HandleResume(object sender, MouseButtonEventArgs e)
        {
            if (StateStatus == State.Paused)
            {
                RoutedEventArgs ResumeRequestedArgs = new RoutedEventArgs(UnpauseRequestedEvent, this);
                RaiseEvent(ResumeRequestedArgs);
                Pausebutton.IsEnabled = true;
                Resume_Button.IsEnabled = false;
            }
        }

    }
}
