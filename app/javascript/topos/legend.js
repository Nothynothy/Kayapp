const closeLegend = () => {
  const button = document.querySelector('.info-btn');
  const background = document.querySelector('.info-bg');
  // const cross = document.querySelector('.cross');

  button.addEventListener("click", () => {
    background.classList.toggle("info-active")
  });

  background.addEventListener("click", () => {
    background.classList.toggle("info-active")
  })
};

export { closeLegend };
