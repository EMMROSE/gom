import consumer from "./consumer";

const messagesContainer = document.getElementById('messages');
if (messagesContainer) {
  const id = messagesContainer.dataset.sportSessionId;
  console.log(id)
  consumer.subscriptions.create({ channel: "SportSessionChannel", id: id }, {
    received(data) {
      console.log(data);
      messagesContainer.insertAdjacentHTML('beforeend', data); // called when data is broadcast in the cable
    },
  });
  messagesContainer.scrollTo(0,1000);
}
