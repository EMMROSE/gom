const formSportSessions = () => {
  const formContainer = document.querySelector('.form-container');

  if (formContainer) {

    const activities = document.querySelectorAll('.form-container .activity-choices .activity-choice');

    activities.forEach((activity) => {
      activity.addEventListener('click', (event) => {
        let previousActivity = document.querySelector('.activity-choice.active')
          if (previousActivity !== null) {
            previousActivity.classList.remove('active');
        }
        event.currentTarget.classList.add('active');
      });
    });

    const levelContainer = document.querySelector('.form-container .level-choices');
    const levels = document.querySelectorAll('.form-container .level-choices .level-choice');

    levelContainer.addEventListener('mouseleave', (event) => {
      document.querySelector(".level-choice[data-level='1'").classList.remove('hover');
      document.querySelector(".level-choice[data-level='2'").classList.remove('hover');
      document.querySelector(".level-choice[data-level='3'").classList.remove('hover');
    });


    levels.forEach((level) => {
      level.addEventListener('mouseover', (event) => {
        let currentLevel = (event.currentTarget.dataset.level)
        if (currentLevel == 1) {
          document.querySelector(".level-choice[data-level='2'").classList.remove('hover');
        } else if (currentLevel == 2) {
          document.querySelector(".level-choice[data-level='1'").classList.add('hover');
        } else if (currentLevel == 3 ) {
          document.querySelector(".level-choice[data-level='1'").classList.add('hover');
          document.querySelector(".level-choice[data-level='2'").classList.add('hover');
        }
      });
    });


    levels.forEach((level) => {
      level.addEventListener('click', (event) => {
        let currentLevel = (event.currentTarget.dataset.level)
        if (currentLevel == 1) {
          document.querySelector(".level-choice[data-level='1'").classList.add('active');
          document.querySelector(".level-choice[data-level='2'").classList.remove('active');
          document.querySelector(".level-choice[data-level='3'").classList.remove('active');

        } else if (currentLevel == 2) {
          document.querySelector(".level-choice[data-level='1'").classList.add('active');
          document.querySelector(".level-choice[data-level='2'").classList.add('active');

          document.querySelector(".level-choice[data-level='3'").classList.remove('active');

        } else if (currentLevel == 3 ) {
          document.querySelector(".level-choice[data-level='1'").classList.add('active');
          document.querySelector(".level-choice[data-level='2'").classList.add('active');

          document.querySelector(".level-choice[data-level='3'").classList.add('active');

        }
      });
    });

    // CAPACITY

    const capacityContainer = document.querySelector('.form-container .capacity-choices');
    const capacities = document.querySelectorAll('.form-container .capacity-choices .capacity-choice');

    capacityContainer.addEventListener('mouseleave', (event) => {
      document.querySelector(".capacity-choice[data-capacity='1'").classList.remove('hover');
      document.querySelector(".capacity-choice[data-capacity='2'").classList.remove('hover');
      document.querySelector(".capacity-choice[data-capacity='3'").classList.remove('hover');
      document.querySelector(".capacity-choice[data-capacity='4'").classList.remove('hover');
      document.querySelector(".capacity-choice[data-capacity='5'").classList.remove('hover');
    });


    capacities.forEach((capacity) => {
      capacity.addEventListener('mouseover', (event) => {
        let currentCapacity = (event.currentTarget.dataset.capacity)
        if (currentCapacity == 1) {
          document.querySelector(".capacity-choice[data-capacity='2'").classList.remove('hover');
        } else if (currentCapacity == 2) {
          document.querySelector(".capacity-choice[data-capacity='1'").classList.add('hover');
        } else if (currentCapacity == 3 ) {
          document.querySelector(".capacity-choice[data-capacity='1'").classList.add('hover');
          document.querySelector(".capacity-choice[data-capacity='2'").classList.add('hover');
        } else if (currentCapacity == 4) {
          document.querySelector(".capacity-choice[data-capacity='1'").classList.add('hover');
          document.querySelector(".capacity-choice[data-capacity='2'").classList.add('hover');
          document.querySelector(".capacity-choice[data-capacity='3'").classList.add('hover');
        } else if (currentCapacity == 5) {
          document.querySelector(".capacity-choice[data-capacity='1'").classList.add('hover');
          document.querySelector(".capacity-choice[data-capacity='2'").classList.add('hover');
          document.querySelector(".capacity-choice[data-capacity='3'").classList.add('hover');
          document.querySelector(".capacity-choice[data-capacity='4'").classList.add('hover');
        }
      });
    });


    capacities.forEach((capacity) => {
      capacity.addEventListener('click', (event) => {
        let currentCapacity = (event.currentTarget.dataset.capacity)
        if (currentCapacity == 1) {
          document.querySelector(".capacity-choice[data-capacity='1'").classList.add('active');
          document.querySelector(".capacity-choice[data-capacity='1'").innerHTML = '<i class="fas fa-user"></i>'
          document.querySelector(".capacity-choice[data-capacity='2'").classList.remove('active');
          document.querySelector(".capacity-choice[data-capacity='2'").innerHTML = '<i class="far fa-user"></i>'
          document.querySelector(".capacity-choice[data-capacity='3'").classList.remove('active');
          document.querySelector(".capacity-choice[data-capacity='3'").innerHTML = '<i class="far fa-user"></i>'
          document.querySelector(".capacity-choice[data-capacity='4'").classList.remove('active');
          document.querySelector(".capacity-choice[data-capacity='4'").innerHTML = '<i class="far fa-user"></i>'
          document.querySelector(".capacity-choice[data-capacity='5'").classList.remove('active');
          document.querySelector(".capacity-choice[data-capacity='5'").innerHTML = '<i class="far fa-user"></i>'
        } else if (currentCapacity == 2) {
          document.querySelector(".capacity-choice[data-capacity='1'").classList.add('active');
          document.querySelector(".capacity-choice[data-capacity='1'").innerHTML = '<i class="fas fa-user"></i>'
          document.querySelector(".capacity-choice[data-capacity='2'").classList.add('active');
          document.querySelector(".capacity-choice[data-capacity='2'").innerHTML = '<i class="fas fa-user"></i>'
          document.querySelector(".capacity-choice[data-capacity='3'").classList.remove('active');
          document.querySelector(".capacity-choice[data-capacity='3'").innerHTML = '<i class="far fa-user"></i>'
          document.querySelector(".capacity-choice[data-capacity='4'").classList.remove('active');
          document.querySelector(".capacity-choice[data-capacity='4'").innerHTML = '<i class="far fa-user"></i>'
          document.querySelector(".capacity-choice[data-capacity='5'").classList.remove('active');
          document.querySelector(".capacity-choice[data-capacity='5'").innerHTML = '<i class="far fa-user"></i>'
        } else if (currentCapacity == 3 ) {
          document.querySelector(".capacity-choice[data-capacity='1'").classList.add('active');
          document.querySelector(".capacity-choice[data-capacity='1'").innerHTML = '<i class="fas fa-user"></i>'
          document.querySelector(".capacity-choice[data-capacity='2'").classList.add('active');
          document.querySelector(".capacity-choice[data-capacity='2'").innerHTML = '<i class="fas fa-user"></i>'
          document.querySelector(".capacity-choice[data-capacity='3'").classList.add('active');
          document.querySelector(".capacity-choice[data-capacity='3'").innerHTML = '<i class="fas fa-user"></i>'
          document.querySelector(".capacity-choice[data-capacity='4'").classList.remove('active');
          document.querySelector(".capacity-choice[data-capacity='4'").innerHTML = '<i class="far fa-user"></i>'
          document.querySelector(".capacity-choice[data-capacity='5'").classList.remove('active');
          document.querySelector(".capacity-choice[data-capacity='5'").innerHTML = '<i class="far fa-user"></i>'
        } else if (currentCapacity == 4 ) {
          document.querySelector(".capacity-choice[data-capacity='1'").classList.add('active');
          document.querySelector(".capacity-choice[data-capacity='1'").innerHTML = '<i class="fas fa-user"></i>'
          document.querySelector(".capacity-choice[data-capacity='2'").classList.add('active');
          document.querySelector(".capacity-choice[data-capacity='2'").innerHTML = '<i class="fas fa-user"></i>'
          document.querySelector(".capacity-choice[data-capacity='3'").classList.add('active');
          document.querySelector(".capacity-choice[data-capacity='3'").innerHTML = '<i class="fas fa-user"></i>'
          document.querySelector(".capacity-choice[data-capacity='4'").classList.add('active');
          document.querySelector(".capacity-choice[data-capacity='4'").innerHTML = '<i class="fas fa-user"></i>'
          document.querySelector(".capacity-choice[data-capacity='5'").classList.remove('active');
          document.querySelector(".capacity-choice[data-capacity='5'").innerHTML = '<i class="far fa-user"></i>'
        } else if (currentCapacity == 5 ) {
          document.querySelector(".capacity-choice[data-capacity='1'").classList.add('active');
          document.querySelector(".capacity-choice[data-capacity='1'").innerHTML = '<i class="fas fa-user"></i>'
          document.querySelector(".capacity-choice[data-capacity='2'").classList.add('active');
          document.querySelector(".capacity-choice[data-capacity='2'").innerHTML = '<i class="fas fa-user"></i>'
          document.querySelector(".capacity-choice[data-capacity='3'").classList.add('active');
          document.querySelector(".capacity-choice[data-capacity='3'").innerHTML = '<i class="fas fa-user"></i>'
          document.querySelector(".capacity-choice[data-capacity='4'").classList.add('active');
          document.querySelector(".capacity-choice[data-capacity='4'").innerHTML = '<i class="fas fa-user"></i>'
          document.querySelector(".capacity-choice[data-capacity='5'").classList.add('active');
          document.querySelector(".capacity-choice[data-capacity='5'").innerHTML = '<i class="fas fa-user"></i>'
        }
      });
    });
  };
};

export { formSportSessions }

