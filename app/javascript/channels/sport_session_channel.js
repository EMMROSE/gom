import consumer from "./consumer";

const messagesContainer = document.getElementById('messages');
if (messagesContainer) {
  const id = messagesContainer.dataset.sportSessionId;
  console.log(id)
  consumer.subscriptions.create({ channel: "SportSessionChannel", id: id }, {
    received(data) {
      messagesContainer.insertAdjacentHTML('beforeend', data); // called when data is broadcast in the cable
      console.log(messagesContainer);
      // messagesContainer.scrollTo(0,3000);
      messagesContainer.scrollTop = messagesContainer.scrollHeight;
    },
  });
  messagesContainer.scrollTop = messagesContainer.scrollHeight;
  // messagesContainer.scrollTo(0,3000);
}
