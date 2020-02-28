import flatpickr from "flatpickr";


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
