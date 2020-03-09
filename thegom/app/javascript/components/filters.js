const mapFilters = () => {
  const filters = document.querySelector('.container-filters');

  if (filters) {

    const openStatusFilter = document.querySelector('.open-status-filter');
    openStatusFilter.addEventListener('click', event => {
      event.currentTarget.classList.toggle('checked');
    })
  }
}


export { mapFilters };
