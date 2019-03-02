$(function(){ 
  $(".vote_button").on("click", function(event){
    event.preventDefault();   
    
    const title = $(this).parent().parent().find(".item_title").text();
    const desc = $(this).parent().parent().find(".item_title").text();
    const link = $(this).parent().parent().find(".item_title").find('a').attr('href');
    const pubDate = $(this).parent().parent().find(".item_pub_date").text();
    

    $.ajax({
      url: "/static_pages/vote_action",
      type: "GET",
      dataType: "script",
      data: { 
        title: title,
        desc: desc,
        link: link,
        pubDate: pubDate
       }, 
      error: function() {
        alert("Ajax error!")
      }
    });//end ajax    

  })
})