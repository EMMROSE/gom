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
