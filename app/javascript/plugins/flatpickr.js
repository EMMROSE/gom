import flatpickr from "flatpickr";
import "flatpickr/dist/themes/airbnb.css"; // A path to the theme CSS


const initFlatpickr = () => {
  const input = document.querySelector(".datepickr")
  flatpickr(input, {
    altInput: true,
    altFormat: "F j, Y",
    dateFormat: "Y-m-d",
    minDate: "today",
  });
};

export { initFlatpickr };
