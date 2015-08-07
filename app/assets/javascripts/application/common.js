$(document).ready(function(){
  $('textarea').autogrow();

  $("#q_title_or_author_or_ISBN_cont").autocomplete({
    source: function( request, response ) {
        $.ajax({
          url: "/books/search",
          dataType: "JSON",
          type: "GET",
          data: {
            title: request.term
          },
          success: function( data ) {
            response( data );
          }
        });
      },
    minLength: 3
  }).data( "ui-autocomplete" )._renderItem = function( ul, item ) {
        var inner_html = '<a href="/books/'+item.id+'"><div class="list_item_container"><div class="image"><img src="' + item.book_url + '"></div><div>' + item.title_truncate + '</div><div class="author">' + item.author + '</div></div></a>';
        return $( "<li></li>" )
            .data( "item.autocomplete", item )
            .append(inner_html)
            .appendTo( ul );
    };

  if($(".pagination").size() > 0) {
    $(".pagination").hide();
    $("#endless-scroll").removeClass("hidden");
    $(window).bindWithDelay("scroll", function(){
      var url = $("a.next_page").attr("href");
      if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
        $.getScript(url);
      }
    }, 150);
  }
});
