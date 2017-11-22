$(document).on('turbolinks:load', function(){
    $("#new-tweets .tweet_description").focus(function(){
        $(this).css('height', '100px')
        x= setInterval(function(){
        wordCount = $("#new-tweets .tweet_description").val()
         $('#new-tweets .word-count').html(240 - wordCount.length)
        }, 100)
    })
    $("#new-tweets .tweet_description").blur(function(){
        clearInterval(x);
        setTimeout(function(){ $("#new-tweets .tweet_description").css('height', '35px') }, 1000)
    })
})