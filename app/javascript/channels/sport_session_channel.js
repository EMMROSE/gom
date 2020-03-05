import consumer from "./consumer";


const initChat = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.sportSessionId;
    consumer.subscriptions.create({ channel: "SportSessionChannel", id: id }, {
      received(data) {
        const currentUser = messagesContainer.dataset.currentUserId;
        messagesContainer.insertAdjacentHTML('beforeend', data);

        const messageSender = messagesContainer.lastElementChild.dataset.messageSender;
        if (currentUser === messageSender) {
          messagesContainer.lastElementChild.classList.add("message-author");
        }

        messagesContainer.scrollTop = messagesContainer.scrollHeight;
      },
    });
    messagesContainer.scrollTop = messagesContainer.scrollHeight;
  };
}

export { initChat };
