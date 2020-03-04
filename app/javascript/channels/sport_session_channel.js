import consumer from "./consumer";


const initChat = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.sportSessionId;
    consumer.subscriptions.create({ channel: "SportSessionChannel", id: id }, {
      received(data) {
        messagesContainer.insertAdjacentHTML('beforeend', data); // called when data is broadcast in the cable
        messagesContainer.scrollTop = messagesContainer.scrollHeight;
      },
    });
    messagesContainer.scrollTop = messagesContainer.scrollHeight;
  };
}

export { initChat };
