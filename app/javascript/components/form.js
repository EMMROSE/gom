const formSportSessions = () => {
  const formContainer = document.querySelector('.form-container');

  if (formContainer) {

    const activities = document.querySelectorAll('.form-container .activity-choices .activity-choice');

    // Add click effect on activities radio-button
    activities.forEach((activity) => {
      activity.addEventListener('click', (event) => {
        let previousActivity = document.querySelector('.activity-choice.active')
          if (previousActivity !== null) {
            previousActivity.classList.remove('active');
        }
        event.currentTarget.classList.add('active');
      });
    });


    // Hover effect function for form range element

    const hoverEffect = (arr, data) => {
      arr.forEach((element) => {
        element.addEventListener('mouseover', (event) => {
          const currentElement = (event.currentTarget.dataset[`${data}`]);
          arr.slice(0, currentElement).forEach((element) => {
            element.classList.add('hover');
          });
        });

        element.addEventListener('mouseleave', (event) => {
          arr.forEach((element) => {
            element.classList.remove('hover');
          })
        });
      });
    };


    // Click effect function for form range element

    const clickEffect = (arr, data) => {
      arr.forEach((element) => {
        element.addEventListener('click', (event) => {
          const currentElement = (event.currentTarget.dataset[`${data}`]);
          arr.slice(0, currentElement).forEach((element) => {
            element.classList.add('active');
          });

          arr.slice(currentElement, arr.length).forEach((element) => {
            element.classList.remove('active');
          });
        });
      });
    };

    // LEVELS

    const levels = document.querySelectorAll('.form-container .level-choices .level-choice');

    let levelsArr = [];
    levels.forEach((level) => {
      levelsArr.push(level);
    });

    // Add hover effect on level range
    hoverEffect(levelsArr, 'level');

    // Add click effect on level range
    clickEffect(levelsArr, 'level');


    // CAPACITY

    const capacities = document.querySelectorAll('.form-container .capacity-choices .capacity-choice');

    let capacitiesArr = [];
    capacities.forEach((capacity) => {
      capacitiesArr.push(capacity);
    });

    // Add hover effect on level range
    hoverEffect(capacitiesArr, 'capacity');

    // Add click effect on level range
    clickEffect(capacitiesArr, 'capacity');

  };
};

export { formSportSessions }

