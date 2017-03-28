App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
    $("#messages").removeClass('hidden')
    $('#messages').append(this.renderMessage(data));
    $("#messages").scrollTop(100000)
  },

  renderMessage: function(data) {
    return "<div class='panel-header'><h3>" + data.sender + "<small> at " + data.created_at + "</small></h3></div><div class='panel-body'><p>" + data.content + "</p></div>";
  }
});
