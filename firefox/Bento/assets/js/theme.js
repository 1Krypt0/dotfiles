// Store the theme
let darkTheme = localStorage.getItem("darkTheme");
const bodyBackground = document.getElementById("#body");

// Apply Dark theme
const enableDark = () => {
  document.body.classList.add("darktheme");
  localStorage.setItem("darkTheme", "enabled");
  feather.replace();
};

enableDark();

if (CONFIG.imageBackground) {
  document.body.classList.add("withImageBackground");
}

