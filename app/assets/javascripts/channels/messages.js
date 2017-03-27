App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    console.log('received');
    $("#messages").removeClass('hidden')
    return $('#messages').append(this.renderMessage(data));
  },

  renderMessage: function(data) {
    console.log(data.message);
    return "<div class='panel-header'><h3>" + data.sender + "<small>at " + data.message.created_at + "</small></h3></div><div class='panel-body'><p>" + data.message.content + "</p></div>";
  }
});
