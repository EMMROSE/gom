import places from 'places.js';

const initAutocomplete = () => {
  const addressInputs = document.querySelectorAll('.search_query');
  if (addressInputs.length > 0) {
    addressInputs.forEach((input) => {
      if (!input.attributes.hasOwnProperty('role')) {
        places({ container: input });
      }
    });
  };
};

export { initAutocomplete };

const initAutocomplete2 = () => {
  const addressInputs2 = document.querySelectorAll('.search_query_new');
  if (addressInputs2.length > 0) {
    addressInputs2.forEach((input) => {
      if (!input.attributes.hasOwnProperty('role')) {
        places({ container: input });
      }
    });
  };
};

export { initAutocomplete2 };
