function toggleSearch() {

  const findBy = document.getElementById("show-hide-search");
  const searchBar = document.getElementById("search-bar");


  findBy.addEventListener('click', function(e) {

    if (searchBar.classList.contains("search-bar-is-hidden")) {
      searchBar.classList.remove("search-bar-is-hidden");
    } else {
      searchBar.classList.add("search-bar-is-hidden");
    }
  })
}

toggleSearch();
