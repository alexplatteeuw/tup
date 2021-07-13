const runSimulator = () => {
  const simulator = document.getElementById('simulator');
  if (simulator) {
    simulator.addEventListener('submit', (event) => {
      event.preventDefault();
      const publications = document.getElementById('publications');
      const startingPoints = document.getElementById('starting-points');
      if (publications) { fetchFromPublication(); }
      else if (!startingPoints && !publications) { resetForm(); }
      else { fetchFromPublicationOrEffect(); }
    });
  }
};

const resetForm = () => {
  fetch('/start')
    .then((response) => response.text())
    .then((data) => {
      document.getElementById('results').innerHTML = data;
    });
};

const fetchFromPublication = () => {
  const startingPoint = 'publication'
  const date = document.querySelector('input[name="date"]:checked').value;
  fetchResults(startingPoint, date);
}

const fetchFromPublicationOrEffect = () => {
  const startingPoint = document.querySelector('input[name="starting_point"]:checked').value;
  const date = document.getElementById('flatpickr').value;
  fetchResults(startingPoint, date);
}

const fetchResults = (startingPoint, date) => {
  fetch('/results', {
    method: 'POST',
    headers: {
      'Accept': 'text/html',
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({ starting_point: startingPoint, date: date }),
  })
    .then((response) => response.text())
    .then((data) => {
      document.getElementById('results').innerHTML = data;
    });
};

export { runSimulator };
