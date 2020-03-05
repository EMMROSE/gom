import consumer from "./consumer";


const initChat = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.sportSessionId;
    consumer.subscriptions.create({ channel: "SportSessionChannel", id: id }, {
      received(data) {
        console.log(data);

        const currentUser = messagesContainer.dataset.currentUserId;
        console.log(currentUser);


        messagesContainer.insertAdjacentHTML('beforeend', data);

        messagesContainer.scrollTop = messagesContainer.scrollHeight;
      },
    });
    messagesContainer.scrollTop = messagesContainer.scrollHeight;
  };
}

export { initChat };
