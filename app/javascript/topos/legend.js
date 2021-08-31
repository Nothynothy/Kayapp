const closeLegend = () => {
  const closeBtn = document.querySelector('.cross');
  const divLegend = document.querySelector('.search-legend');
  if (closeBtn !== null){
    closeBtn.addEventListener('click', () => {
      divLegend.style.display = 'none';
    })
  }
}

export { closeLegend };
