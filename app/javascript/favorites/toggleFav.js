const toggleFav = () => {
  const favorite = document.getElementById("favorite-icon");
  favorite.addEventListener("click", () => {
    favorite.classList.toggle("fav-active");
  });
}
export { toggleFav }
