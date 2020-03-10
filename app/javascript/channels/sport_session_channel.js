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

  const messageForm = document.getElementById('new_message');

  if (messageForm) {
    console.log(messageForm);
  }

  messageForm.addEventListener('keydown', (event) => {
    if (event.key == "Enter") {
      event.preventDefault();
    };
  });
}

export { initChat };
