const scrolledNav = () => {
  const navbarHomepage = document.getElementById('navbar-homepage');

  if (navbarHomepage) {

    const navbarSearch = document.querySelector('#navbar-homepage .search');
    const navbarSearchButton = document.querySelector('#navbar-homepage .search .btn');
    const navbarBrand = document.querySelector('#navbar-homepage .navbar-brand');
    const navbarLoginButtons = document.querySelectorAll('#navbar-homepage .navbar-login .btn');

    navbarHomepage.classList.add('bg-transparent');
    navbarHomepage.classList.remove('border-bottom');
    navbarBrand.classList.add('flex-grow-1');
    navbarSearch.classList.add('d-none');

    navbarLoginButtons.forEach(button => {
      button.classList.add('btn-white');
      button.classList.remove('btn-black');
    })

    const bannerSearch = document.querySelector('.banner .search');

    window.addEventListener('scroll', () => {

      if (window.scrollY >= (window.innerHeight / 2)) {
        navbarBrand.classList.remove('flex-grow-1');
        navbarSearch.classList.add('flex-grow-1');
        navbarSearch.classList.remove('d-none');
        bannerSearch.classList.add('d-none');
        navbarSearchButton.classList.add('btn-gom');
        navbarSearchButton.classList.remove('btn-white');
      } else {
        navbarSearch.classList.add('d-none');
        bannerSearch.classList.remove('d-none');
        navbarSearchButton.classList.add('btn-white');
        navbarSearchButton.classList.remove('btn-gom');
      }

      if (window.scrollY > (window.innerHeight - 50)) {
        navbarHomepage.classList.remove('bg-transparent');
        navbarLoginButtons.forEach(button => {
          button.classList.remove('btn-white');
          button.classList.add('btn-black');
        })
      } else {
        navbarHomepage.classList.add('bg-transparent')
        navbarLoginButtons.forEach(button => {
          button.classList.add('btn-white');
          button.classList.remove('btn-black');
        })
      }


    });
  }
}

export { scrolledNav }
