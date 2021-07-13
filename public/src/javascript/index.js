import '../assets/stylesheets/application.scss';
import 'bootstrap';
import { initializeFlatpickr } from './plugins/flatpickr';
import { initializeGoogleAnalytics } from './plugins/google_analytics';
import { runSimulator } from './components/run_simulator';
import { validateContactForm } from './components/validate_contact_form';
import { switchButtons } from './components/switch_buttons';

initializeFlatpickr();
switchButtons();
runSimulator();
validateContactForm();
initializeGoogleAnalytics();
