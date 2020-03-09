import flatpickr from "flatpickr";


const initFlatpickr = () => {
  const input = document.querySelectorAll(".datepickr");
  if (input) {
    if (input.length < 2) {
      flatpickr(input, {
        altInput: true,
        altFormat: "F j, Y",
        dateFormat: "Y-m-d",
        minDate: "today",
      });
    };
  };
};

export { initFlatpickr };


const dashboardFlatipickr = () => {
  const dashboardCalendar = document.querySelector(".dashboard-calendar");
  const calendarNumber = document.querySelectorAll(".flatpickr-calendar").length;

  if (dashboardCalendar && calendarNumber < 2) {

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
        // Add a link
      }
    })
  };
};

export { dashboardFlatipickr };
