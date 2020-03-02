const smoothScrollDashboard = () => {

  const dashboard = document.getElementById('dashboard-container');

  if (dashboard) {
    const nextSessions = document.getElementById('next-sessions-link');
    const pastSessions = document.getElementById('past-sessions-link');
    const ownedSessions = document.getElementById('sessions-owned-link');
    const navLink1 = document.getElementById('nav-link-1');
    const navLink2 = document.getElementById('nav-link-2');
    const navLink3 = document.getElementById('nav-link-3');


    const smoothScrolltoTarget = (target) => {
      let count = window.pageYOffset - target.offsetTop + 140 // any extra distance from top ex. 60
      window.scrollBy({top: -count, left: 0, behavior: 'smooth'})
    }

    navLink1.addEventListener('click', (event) => {
      smoothScrolltoTarget(nextSessions);
    });

    navLink2.addEventListener('click', (event) => {
      smoothScrolltoTarget(pastSessions);
    });

    navLink3.addEventListener('click', (event) => {
      smoothScrolltoTarget(ownedSessions);
    });
  }

};

export { smoothScrollDashboard }
