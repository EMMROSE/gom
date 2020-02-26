const formActivities = () => {

  const activities = document.querySelectorAll('.form-container .activity-choices .activity-choice');

  activities.forEach((activity) => {
    activity.addEventListener('click', (event) => {
      let currentActiveElement = document.querySelector('.activity-choice.active')
        if (currentActiveElement !== null) {
          currentActiveElement.classList.toggle('active');
      }
      event.currentTarget.classList.toggle('active');
    });
  });
};

export { formActivities }
