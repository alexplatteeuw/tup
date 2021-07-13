import flatpickr from "flatpickr";
import {fr as French} from "flatpickr/dist/l10n/fr.js";

const initializeFlatpickr = () => {
  const flatpickrInput = document.getElementById('flatpickr');
  if (flatpickrInput) {
    flatpickr.localize(flatpickr.l10ns.fr);
    flatpickr('#flatpickr', {
      inline: true,
      dateFormat: "Y-m-d",
      locale: { firstDayOfWeek: 1 }
    });
    document.getElementById('flatpickr').setAttribute('type', 'hidden');
  }
};

export { initializeFlatpickr };
