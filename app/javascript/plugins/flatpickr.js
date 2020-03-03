import flatpickr from "flatpickr";


const initFlatpickr = () => {
  const input = document.querySelector(".datepickr");
  if (input) {
    flatpickr(input, {
      altInput: true,
      altFormat: "F j, Y",
      dateFormat: "Y-m-d",
      minDate: "today",
    });
  };
};

export { initFlatpickr };

const dashboardFlatipickr = () => {
  const dashboardCalendar = document.querySelector(".dashboard-calendar");
  if (dashboardCalendar) {

    const dates = dashboardCalendar.dataset.dates;
    const ids = dashboardCalendar.dataset.id;
    const datesArray = [];
    JSON.parse(dates).forEach((element) => {
      datesArray.push(element)
    });

    flatpickr(dashboardCalendar, {
      altInput: true,
      inline: true,
      mode: "multiple",
      dateFormat: "Y-m-d",
      enable: datesArray,
      onChange: (selectedDates) => {
        // window.location.href = 'www.google.fr';
      }
    })
  };
};

export { dashboardFlatipickr };
