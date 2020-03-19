$(function(){

  function appendIdea(idea) {
     var html =
     `<a href="/ideas/${idea.id}" class="idea">
        <div class="idea--title">
          ${idea.title}
        </div>
        <div class="idea--info>
          <div class="idea--info--price">
            price: $ ${idea.price}
          </div>
        </div>
              `
    $('.ideas').append(html);
  }

  function appendErrMsgToHTML(msg){
    var html =
    `<div class="name">${msg}</div>`
    $('.ideas').append(html);
  }

  $(".search-input").on("keyup", function(){
    let input = $(".search-input").val();
    $.ajax({
      type: 'GET',
      url: '/ideas/search',
      data: {keyword: input},
      dataType: 'json'
    })
    .done(function(ideas){
      $(".ideas").empty();
      if (ideas.length !==0){
        $('.search-btn').on('click', function(){
          $(this).prop('disabled', true);
          $(this).closest('form').submit();
        });   
        ideas.forEach(function(idea){
          appendIdea(idea);     
        });
      }else{
        appendErrMsgToHTML("一致するアイデアがありません。");
      }
    })
    .fail(function(){
      alert('error');
    });
  });
});