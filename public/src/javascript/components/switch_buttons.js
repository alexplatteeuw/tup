const switchButtons = () => {
  const simulator = document.getElementById('simulator');
  const resultsObserver = new MutationObserver(switchButtonsCallback);
  if (simulator) {
    const results = document.getElementById('results');
    resultsObserver.observe(results, { childList: true });
  } else {
    resultsObserver.disconnect();
  }
};

const switchButtonsCallback = function mutationCallback(mutations) {
  const { addedNodes } = mutations[0];
  const publications = Object.values(addedNodes).some((value) => value.id === 'publications');
  const startingPoints = document.getElementById('starting-points');
  const wrapper = document.getElementById('submit-btn-wrapper');
  if (startingPoints || publications) {
    wrapper.innerHTML = '<button type="submit" class="btn btn-primary" id="compute-btn">Calculer<span class="ml-1"><i class="fas fa-arrow-right"></i></span></button>';
  } else {
    wrapper.innerHTML = '<button type="submit" class="btn btn-light mb-3" id="reset-btn">Recommencer</button>';
  }
};

export { switchButtons };
