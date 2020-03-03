import consumer from "./consumer";

const requestsContainer = document.querySelector(".search");
if (requestsContainer) {
  const id = requestsContainer.dataset.userId;
  // const notifCount = document.querySelector('.fa-bell')
  const notificationRequest = document.getElementById('dropdown-notifications')
  if (notificationRequest) {
    consumer.subscriptions.create({ channel: "UserChannel", id: id }, {
      received(data) {
        notificationRequest.insertAdjacentHTML('afterbegin', data);
        // notifCount.insertAdjacentHTML('beforeend', "");
      },
    });
  }
}
