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
  const div = document.querySelector(".dashboard-calendar");
  if (div) {

    const dates = div.dataset.dates;
    const datesArray = [];
    JSON.parse(dates).forEach((element) => {
      datesArray.push(element)
    });

    flatpickr(div, {
      altInput: true,
      inline: true,
      mode: "multiple",
      dateFormat: "Y-m-d",
      enable: datesArray,
      onChange: (selectedDates) => {
        console.log(selectedDates);
      }
    })
  };
};

export { dashboardFlatipickr };
